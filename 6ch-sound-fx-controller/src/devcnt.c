//********************************************************************************
// Copyright (c) 2022 Dilshan R Jayakody.
// 6-channel sound processor - control panel.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//********************************************************************************

#include <gtk/gtk.h>

#include "devcnt.h"
#include "common.h"
#include "logger.h"

#include <stdio.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include <sys/ioctl.h>

#define updateLevelEx(i)    updateLevel(&(commInfoPtr->serialIntf), i, &audioDefaultData, commInfoPtr->audioControlData)
#define updateStateEx(i)    updateState(&(commInfoPtr->serialIntf), i, &audioDefaultData, commInfoPtr->audioControlData)

gboolean updateControlOnDevice(int *fileHandle, char *controlCmd, unsigned char *cValue)
{
    char controlReq[7], regStatus[4] = {[0 ... 3] = 0};
    ssize_t status;
    
    if(controlCmd != NULL)
    {
        // Only two digits are allowed for the level.
        assert((*cValue) < 100);

        // Construct control request with specified level value.
        sprintf(controlReq, "%s%02d", controlCmd, *cValue);
        status = write(*fileHandle, controlReq, sizeof(controlReq));
        
        if(status >= sizeof(controlReq))
        {
            // Waiting for the acknowlegment or error from the device.
            usleep(100);
            status = read(*fileHandle, regStatus, 3);
            if(status > 0)
            {
                regStatus[3] = 0;

                if(strcmp(regStatus, CNT_ACK) == 0)
                {
                    // Received ACK from device, and operation is successful.
                    return TRUE;
                } 
            }                       
        }
        else
        {
            // Control request transfer fails.
            printLogError("Control request transfer fail");
        }
    }

    return FALSE;
}

void updateState(int *fileHandle, enum ControlID cID, audioSettings *defaultLvl, audioSettings *currentLvl)
{
    char *controlCmd = NULL;
    gboolean newLevel;
    gboolean *lastLevel;
    unsigned char newLevelChr;

    // Find the serial control command and effect state related to the specified control ID.
    switch(cID)
    {
        case CID_TONE:
            controlCmd = CNT_CMD_TONE;
            lastLevel = &(defaultLvl->isToneDisable);
            newLevel = currentLvl->isToneDisable;
            break;
        case CID_3DFX:
            controlCmd = CNT_CMD_3D_AUDIO;
            lastLevel = &(defaultLvl->is3DDisable);
            newLevel = currentLvl->is3DDisable;
            break;
        default:
            ;
    }

    newLevelChr = newLevel ? 0x01 : 0x00;

    if(*lastLevel != newLevel)
    {            
        if(updateControlOnDevice(fileHandle, controlCmd, &newLevelChr) == TRUE)
        {
            *lastLevel = newLevel;

            // Allow sometime to do a request processing at the device.
            usleep(200);
        }
    }
}

void updateLevel(int *fileHandle, enum ControlID cID, audioSettings *defaultLvl, audioSettings *currentLvl)
{
    char *controlCmd = NULL;
    unsigned char newLevel;
    unsigned char *lastLevel;
    
    // Find the serial control command and levels related to the specified control ID.
    switch(cID)
    {
        case CID_MASTER:
            controlCmd = CNT_CMD_MASTER;
            lastLevel = &(defaultLvl->master);
            newLevel = currentLvl->master;
            break;
        case CID_TRIM_FRONT_LEFT:
            controlCmd = CNT_CMD_TRIM_FRONT_LEFT;
            lastLevel = &(defaultLvl->trimSettings.frontLeft);
            newLevel = currentLvl->trimSettings.frontLeft;
            break;
        case CID_TRIM_FRONT_RIGHT:
            controlCmd = CNT_CMD_TRIM_FRONT_RIGHT;
            lastLevel = &(defaultLvl->trimSettings.frontRight);
            newLevel = currentLvl->trimSettings.frontRight;
            break;
        case CID_TRIM_REAR_LEFT:
            controlCmd = CNT_CMD_TRIM_REAR_LEFT;
            lastLevel = &(defaultLvl->trimSettings.rearLeft);
            newLevel = currentLvl->trimSettings.rearLeft;
            break;
        case CID_TRIM_REAR_RIGHT:
            controlCmd = CNT_CMD_TRIM_REAR_RIGHT;
            lastLevel = &(defaultLvl->trimSettings.rearRight);
            newLevel = currentLvl->trimSettings.rearRight;
            break;
        case CID_CENTER:
            controlCmd = CNT_CMD_TRIM_CENTER;
            lastLevel = &(defaultLvl->trimSettings.center);
            newLevel = currentLvl->trimSettings.center;
            break;
        case CID_SUBWOOFER:
            controlCmd = CNT_CMD_TRIM_SUBWOOFER;
            lastLevel = &(defaultLvl->trimSettings.subwoofer);
            newLevel = currentLvl->trimSettings.subwoofer;
            break;
        case CID_BASS:
            controlCmd = CNT_CMD_BASS;
            lastLevel = &(defaultLvl->toneSettings.bass);
            newLevel = currentLvl->toneSettings.bass;
            break;
        case CID_MID:
            controlCmd = CNT_CMD_MID_RANGE;
            lastLevel = &(defaultLvl->toneSettings.mid);
            newLevel = currentLvl->toneSettings.mid;
            break;
        case CID_TREBLE:
            controlCmd = CNT_CMD_TREBLE;
            lastLevel = &(defaultLvl->toneSettings.treble);
            newLevel = currentLvl->toneSettings.treble;
            break;
        default:
            ;
    }

    if(*lastLevel != newLevel)
    {            
        if(updateControlOnDevice(fileHandle, controlCmd, &newLevel) == TRUE)
        {
            *lastLevel = newLevel;

            // Allow sometime to do a request processing at the device.
            usleep(200);
        }
    }
}

void checkForInputEvent(commInfo *commInfoPtr, audioSettings* defaultData)
{    
    ssize_t status;
    char cmdID [4] = {[0 ... 3] = 0};
    char cmdValueStr[3] = {[0 ... 2] = 0};
    char inData[6];
    unsigned char cmdValue;

    // Read data in the serial input buffer.           
    status = read(commInfoPtr->serialIntf, inData, 5);
    if(status > 0)
    {
        // Extract command ID to identify the event type.
        cmdID[0] = inData[0];
        cmdID[1] = inData[1];
        cmdID[2] = inData[2];

        // Extracting value received with the command.
        cmdValueStr[0] = inData[3];
        cmdValueStr[1] = inData[4];
        cmdValue = atoi(cmdValueStr);

        if(strcmp(cmdID, CNT_GET_MASTER) == 0)
        {
            // Master volume level change event.     
            commInfoPtr->audioControlData->master = cmdValue;  
            defaultData->master = cmdValue;                   
            commInfoPtr->masterVolumeEvent(cmdValue);
        }
    }
}

gboolean getControlLevel(int *fileHandle, enum ControlID cID, unsigned char *value)
{
    char *controlCmd = NULL;
    char cmdValue[6], responseValue[3];
    ssize_t status;

    // Find the serial command to get the level/state value from the device.
    switch(cID)
    {
        case CID_MASTER:
            controlCmd = CNT_GET_MASTER;
            break;
        case CID_TRIM_FRONT_LEFT:
            controlCmd = CNT_GET_TRIM_FRONT_LEFT;
            break;
        case CID_TRIM_FRONT_RIGHT:
            controlCmd = CNT_GET_TRIM_FRONT_RIGHT;
            break;
        case CID_TRIM_REAR_LEFT:
            controlCmd = CNT_GET_TRIM_REAR_LEFT;
            break;
        case CID_TRIM_REAR_RIGHT:
            controlCmd = CNT_GET_TRIM_REAR_RIGHT;
            break;
        case CID_CENTER:
            controlCmd = CNT_GET_TRIM_CENTER;
            break;
        case CID_SUBWOOFER:
            controlCmd = CNT_GET_TRIM_SUBWOOFER;
            break;
        case CID_BASS:
            controlCmd = CNT_GET_BASS;
            break;
        case CID_MID:
            controlCmd = CNT_GET_MID_RANGE;
            break;
        case CID_TREBLE:
            controlCmd = CNT_GET_TREBLE;
            break;
        case CID_3DFX:
            controlCmd = CNT_GET_3D_AUDIO;
            break;
        case CID_TONE:
            controlCmd = CNT_GET_TONE;
            break;
        default:
            ;
    }

    if(controlCmd != NULL)
    {
        // Send command to the device and waiting for the response.
        status = write(*fileHandle, controlCmd, sizeof(controlCmd));
        if(status >= sizeof(controlCmd))
        {
            usleep(50);

            status = read(*fileHandle, cmdValue, 5);
            if((status > 0) && (cmdValue[5] == 0))
            {
                // Check for valid response.
                if(!((cmdValue[0] == controlCmd[0]) && (cmdValue[1] == controlCmd[1]) && (cmdValue[2] == controlCmd[2])))
                {
                    printLogInfo("Invalid response received from the device");
                    return FALSE;
                }

                // Extract value from the response and convert to a byte.
                responseValue[0] = cmdValue[3];
                responseValue[1] = cmdValue[4];
                responseValue[2] = 0;

                *value = atoi(responseValue);

                if(*value > 100)
                {
                    printLogInfo("Invalid value received from the device");
                    return FALSE;
                }

                return TRUE;
            }
        }
    }

    return FALSE;
}

gboolean getControlLevelForce(int *fileHandle, enum ControlID cID, unsigned char *value)
{
    unsigned char tryCount = MAX_TRY_COUNT;

    while(tryCount > 0)
    {
        if(getControlLevel(fileHandle, cID, value))
        {
            return TRUE;
        }

        tryCount--;
    }

    return FALSE;
}

void *controlThreadHandler(void *args)
{
    audioSettings audioDefaultData;
    commInfo *commInfoPtr = (commInfo *)args;
    unsigned char defaultState;
    int inBufferSize;

    // Set control level and state data structures to the default value.
    audioDefaultData.master = 0xFF;

    audioDefaultData.trimSettings.frontLeft = 0xFF;
    audioDefaultData.trimSettings.frontRight = 0xFF;
    audioDefaultData.trimSettings.rearLeft = 0xFF;
    audioDefaultData.trimSettings.rearRight = 0xFF;
    audioDefaultData.trimSettings.subwoofer = 0xFF;
    audioDefaultData.trimSettings.center = 0xFF;

    audioDefaultData.toneSettings.bass = 0xFF;
    audioDefaultData.toneSettings.treble = 0xFF;
    audioDefaultData.toneSettings.mid = 0xFF;

    audioDefaultData.is3DDisable = FALSE;
    audioDefaultData.isMute = FALSE;
    audioDefaultData.isToneDisable = FALSE;

    if(commInfoPtr == NULL)
    {
        // Thread argument is invalid or undefined!
        printLogInfo("Unable to start capture and transfer thread");
        return NULL;
    }

    // Try tp get current level from the device.
    if(getControlLevelForce(&(commInfoPtr->serialIntf), CID_MASTER, &(audioDefaultData.master)))
    {
        commInfoPtr->audioControlData->master = audioDefaultData.master;
        commInfoPtr->masterVolumeEvent(audioDefaultData.master);
    }

    // Synchronize volume, tone and effect settings with the device.
    printLogInfo("Synchronize volume, tone and effect settings");

    if(getControlLevelForce(&(commInfoPtr->serialIntf), CID_TRIM_FRONT_LEFT, &(audioDefaultData.trimSettings.frontLeft)))
    {
        commInfoPtr->audioControlData->trimSettings.frontLeft = audioDefaultData.trimSettings.frontLeft;
        commInfoPtr->trimChannelVolumeEvent(CID_TRIM_FRONT_LEFT, audioDefaultData.trimSettings.frontLeft);
    }

    if(getControlLevelForce(&(commInfoPtr->serialIntf), CID_TRIM_FRONT_RIGHT, &(audioDefaultData.trimSettings.frontRight)))
    {
        commInfoPtr->audioControlData->trimSettings.frontRight = audioDefaultData.trimSettings.frontRight;
        commInfoPtr->trimChannelVolumeEvent(CID_TRIM_FRONT_RIGHT, audioDefaultData.trimSettings.frontRight);
    }
    
    if(getControlLevelForce(&(commInfoPtr->serialIntf), CID_TRIM_REAR_LEFT, &(audioDefaultData.trimSettings.rearLeft)))
    {
        commInfoPtr->audioControlData->trimSettings.rearLeft = audioDefaultData.trimSettings.rearLeft;
        commInfoPtr->trimChannelVolumeEvent(CID_TRIM_REAR_LEFT, audioDefaultData.trimSettings.rearLeft);
    }

    if(getControlLevelForce(&(commInfoPtr->serialIntf), CID_TRIM_REAR_RIGHT, &(audioDefaultData.trimSettings.rearRight)))
    {
        commInfoPtr->audioControlData->trimSettings.rearRight = audioDefaultData.trimSettings.rearRight;
        commInfoPtr->trimChannelVolumeEvent(CID_TRIM_REAR_RIGHT, audioDefaultData.trimSettings.rearRight);
    }

    if(getControlLevelForce(&(commInfoPtr->serialIntf), CID_SUBWOOFER, &(audioDefaultData.trimSettings.subwoofer)))
    {
        commInfoPtr->audioControlData->trimSettings.subwoofer = audioDefaultData.trimSettings.subwoofer;
        commInfoPtr->trimChannelVolumeEvent(CID_SUBWOOFER, audioDefaultData.trimSettings.subwoofer);
    }

    if(getControlLevelForce(&(commInfoPtr->serialIntf), CID_CENTER, &(audioDefaultData.trimSettings.center)))
    {
        commInfoPtr->audioControlData->trimSettings.center = audioDefaultData.trimSettings.center;
        commInfoPtr->trimChannelVolumeEvent(CID_CENTER, audioDefaultData.trimSettings.center);
    }

    if(getControlLevelForce(&(commInfoPtr->serialIntf), CID_BASS, &(audioDefaultData.toneSettings.bass)))
    {
        commInfoPtr->audioControlData->toneSettings.bass = audioDefaultData.toneSettings.bass;
        commInfoPtr->toneLevelEvent(CID_BASS, audioDefaultData.toneSettings.bass);
    }

    if(getControlLevelForce(&(commInfoPtr->serialIntf), CID_TREBLE, &(audioDefaultData.toneSettings.treble)))
    {
        commInfoPtr->audioControlData->toneSettings.treble = audioDefaultData.toneSettings.treble;
        commInfoPtr->toneLevelEvent(CID_TREBLE, audioDefaultData.toneSettings.treble);
    }
    
    if(getControlLevelForce(&(commInfoPtr->serialIntf), CID_MID, &(audioDefaultData.toneSettings.mid)))
    {
        commInfoPtr->audioControlData->toneSettings.mid = audioDefaultData.toneSettings.mid;
        commInfoPtr->toneLevelEvent(CID_MID, audioDefaultData.toneSettings.mid);
    }

    defaultState = 0;
    if(getControlLevelForce(&(commInfoPtr->serialIntf), CID_3DFX, &defaultState))
    {
        audioDefaultData.is3DDisable = (defaultState > 0) ? TRUE : FALSE;
        commInfoPtr->audioControlData->is3DDisable = audioDefaultData.is3DDisable;
        commInfoPtr->effectEvent(CID_3DFX, audioDefaultData.is3DDisable);
    }

    defaultState = 0;
    if(getControlLevelForce(&(commInfoPtr->serialIntf), CID_TONE, &defaultState))
    {
        audioDefaultData.isToneDisable = (defaultState > 0) ? TRUE : FALSE;
        commInfoPtr->audioControlData->isToneDisable = audioDefaultData.isToneDisable;
        commInfoPtr->effectEvent(CID_TONE, audioDefaultData.isToneDisable);
    }

    // Device volume and tone update cycle.
    while(1)
    {
        // Check for any data in the serial input buffer.
        if(ioctl(commInfoPtr->serialIntf, TIOCINQ, &inBufferSize) == 0)
        {
            if(inBufferSize >= 5)
            {
                // Check for pending events from the device.        
                checkForInputEvent(commInfoPtr, &audioDefaultData);
            }
        }
        
        // Check and update changes in master volume.
        updateLevelEx(CID_MASTER);

        // Check and update changes in trim levels.
        updateLevelEx(CID_TRIM_FRONT_LEFT);
        updateLevelEx(CID_TRIM_FRONT_RIGHT);
        updateLevelEx(CID_TRIM_REAR_LEFT);
        updateLevelEx(CID_TRIM_REAR_RIGHT);
        updateLevelEx(CID_CENTER);
        updateLevelEx(CID_SUBWOOFER);

        // Check and update changes in tone levels.
        updateLevelEx(CID_BASS);
        updateLevelEx(CID_MID);
        updateLevelEx(CID_TREBLE);

        // Check and update changes in effect controls.
        updateStateEx(CID_3DFX);
        updateStateEx(CID_TONE);

        usleep(200);
    }
}