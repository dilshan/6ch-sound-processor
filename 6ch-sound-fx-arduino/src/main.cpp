//********************************************************************************
// Copyright (c) 2022 Dilshan R Jayakody.
// 6-channel sound processor - Arduino Nano firmware.
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

#include <Arduino.h>
#include <Wire.h>
#include <EEPROM.h>

#include "pt2322.h"
#include "confmem.h"

#include "config.h"
#include "common.h"

audioSettings audioConfig;
unsigned char lastVolUp, lastVolDown, lastMute;
unsigned char autoInc, autoDec;
unsigned long pressDelay;

void updateTrimLevels(trimLevel *trimConf)
{
    setTrimLevel(PT2322_TRIM_CHANNEL_REAR_LEFT, trimConf->rearLeft);
    setTrimLevel(PT2322_TRIM_CHANNEL_REAR_RIGHT, trimConf->rearRight);
    setTrimLevel(PT2322_TRIM_CHANNEL_FRONT_LEFT, trimConf->frontLeft);
    setTrimLevel(PT2322_TRIM_CHANNEL_FRONT_RIGHT, trimConf->frontRight);
    setTrimLevel(PT2322_TRIM_CHANNEL_CENTER, trimConf->center);
    setTrimLevel(PT2322_TRIM_CHANNEL_SUBWOOFER, trimConf->subwoofer);
}

void updateToneLevels(toneLevel *toneConf)
{
    setToneLevel(PT2322_TONE_BASS, toneConf->bass);
    setToneLevel(PT2322_TONE_TREBLE, toneConf->treble);
    setToneLevel(PT2322_TONE_MID, toneConf->mid);
}

void sendControlValue(const char *cmdID, unsigned char value)
{
    char buffer[6];
    
    // Copy command ID to the response.
    buffer[0] = cmdID[0];
    buffer[1] = cmdID[1];
    buffer[2] = cmdID[2];

    // Copy value to the response.
    buffer[4] = ((value % 10) + 0x30);
    buffer[3] = ((value / 10) + 0x30);

    buffer[5] = 0;

    Serial.print(buffer);     
}

void setup() 
{
    // Initialize USART0 interface to communicate with PC.
    Serial.begin(SERIAL_COMM_BAUD_RATE);
    Serial.setTimeout(SERIAL_TIMEOUT_MS);

    // Initialize I2C interface to communicate with PT2322.
    Wire.begin();

    // Set input pin configuration for VOL+, VOL- and MUTE buttons.
    pinMode(PIN_VOL_UP, INPUT_PULLUP);
    pinMode(PIN_VOL_DOWN, INPUT_PULLUP);
    pinMode(PIN_MUTE, INPUT_PULLUP);

    // Initialize PT2322.
    delay(500);
    initPT2322();

    // Update configuration to defaults.
    audioConfig.trimSettings.frontLeft = PT2322_TRIM_MAX;
    audioConfig.trimSettings.frontRight = PT2322_TRIM_MAX;
    audioConfig.trimSettings.rearLeft = PT2322_TRIM_MAX;
    audioConfig.trimSettings.rearRight = PT2322_TRIM_MAX;
    audioConfig.trimSettings.center = PT2322_TRIM_MAX;
    audioConfig.trimSettings.subwoofer = PT2322_TRIM_MAX;

    audioConfig.toneSettings.bass = PT2322_TONE_MIN;
    audioConfig.toneSettings.treble = PT2322_TONE_MIN;
    audioConfig.toneSettings.mid = PT2322_TONE_MIN;

    audioConfig.isMute = FALSE;
    audioConfig.is3DDisable = FALSE;
    audioConfig.isToneDisable = FALSE;
    
    audioConfig.master = PT2322_MASTER_VOLUME_MIN;

    // Try to restore last user setting into the configuration structure.
    getConfigValue(EEPROM_ADDR_MASTER_VOLUME, &(audioConfig.master));

    getConfigValue(EEPROM_ADDR_TRIM_FRONT_LEFT, &(audioConfig.trimSettings.frontLeft));
    getConfigValue(EEPROM_ADDR_TRIM_FRONT_RIGHT, &(audioConfig.trimSettings.frontRight));
    getConfigValue(EEPROM_ADDR_TRIM_REAR_LEFT, &(audioConfig.trimSettings.rearLeft));
    getConfigValue(EEPROM_ADDR_TRIM_REAR_RIGHT, &(audioConfig.trimSettings.rearRight));
    getConfigValue(EEPROM_ADDR_TRIM_CENTER, &(audioConfig.trimSettings.center));
    getConfigValue(EEPROM_ADDR_TRIM_SUBWOOFER, &(audioConfig.trimSettings.subwoofer));

    getConfigValue(EEPROM_ADDR_BASS, &(audioConfig.toneSettings.bass));
    getConfigValue(EEPROM_ADDR_TREBLE, &(audioConfig.toneSettings.treble));
    getConfigValue(EEPROM_ADDR_MID, &(audioConfig.toneSettings.mid));

    getConfigValue(EEPROM_ADDR_3DFX, &(audioConfig.is3DDisable));
    getConfigValue(EEPROM_ADDR_TONE, &(audioConfig.isToneDisable));

    // Apply default configurations to the PT2322.
    updateTrimLevels(&(audioConfig.trimSettings));
    updateToneLevels(&(audioConfig.toneSettings));

    setMute(audioConfig.isMute);
    setTone(audioConfig.isToneDisable);
    set3DAudio(audioConfig.is3DDisable);

    setMasterVolume(audioConfig.master);

    // Get current state of the input buttons.
    lastVolUp = digitalRead(PIN_VOL_UP);
    lastVolDown = digitalRead(PIN_VOL_DOWN);
    lastMute = digitalRead(PIN_MUTE);

    // Initialize button press detection variables.
    pressDelay = millis();
    autoInc = FALSE;
    autoDec = FALSE;
}

void loop() 
{
    // Reset button press detection timer at the beginning of the button press.
    if(((lastVolUp == HIGH) && (digitalRead(PIN_VOL_UP) == LOW)) || ((lastVolDown == HIGH) && (digitalRead(PIN_VOL_DOWN) == LOW)))
    {
        pressDelay = millis();
    }
    
    // Handle continues volume increment.
    if((digitalRead(PIN_VOL_UP) == LOW) && ((millis() - pressDelay) > BUTTON_PRESS_DELAY))
    {
        pressDelay = millis();
        if(audioConfig.master > PT2322_MASTER_VOLUME_MAX)
        {
            audioConfig.master = audioConfig.master - 1;
            setMasterVolume(audioConfig.master);
            sendControlValue(CNT_GET_MASTER, audioConfig.master);
            autoInc = TRUE;
        } 
    }

    // Handle continues volume decrement.
    if((digitalRead(PIN_VOL_DOWN) == LOW) && ((millis() - pressDelay) > BUTTON_PRESS_DELAY))
    {
        pressDelay = millis();
        if(audioConfig.master < PT2322_MASTER_VOLUME_MIN)
        {
            audioConfig.master = audioConfig.master + 1;
            setMasterVolume(audioConfig.master);
            sendControlValue(CNT_GET_MASTER, audioConfig.master);
            autoDec = TRUE;
        } 
    }
    
    // Check for Volume UP button event.
    if((lastVolUp == LOW) && (digitalRead(PIN_VOL_UP) == HIGH))
    {          
        // Avoid volume increment on button release after long press.
        if(autoInc)
        {
            autoInc = FALSE;
            EEPROM.update(EEPROM_ADDR_MASTER_VOLUME, audioConfig.master); 
        }
        else if(audioConfig.master > PT2322_MASTER_VOLUME_MAX)
        {
            audioConfig.master = audioConfig.master - 1;
            setMasterVolume(audioConfig.master);
            sendControlValue(CNT_GET_MASTER, audioConfig.master);
            EEPROM.update(EEPROM_ADDR_MASTER_VOLUME, audioConfig.master);
        }  

        delay(BUTTON_PRESS_DELAY);      
    }

    // Check for Volume DOWN button event.
    if((lastVolDown == LOW) && (digitalRead(PIN_VOL_DOWN) == HIGH))
    {
        // Avoid volume decrement on button release after long press.
        if(autoDec)
        {
            autoDec = FALSE;
            EEPROM.update(EEPROM_ADDR_MASTER_VOLUME, audioConfig.master); 
        }
        else if(audioConfig.master < PT2322_MASTER_VOLUME_MIN)
        {
            audioConfig.master = audioConfig.master + 1;
            setMasterVolume(audioConfig.master);
            sendControlValue(CNT_GET_MASTER, audioConfig.master);   
            EEPROM.update(EEPROM_ADDR_MASTER_VOLUME, audioConfig.master);         
        }   

        delay(BUTTON_PRESS_DELAY);     
    }

    // Check for MUTE button event.
    if((lastMute == LOW) && (digitalRead(PIN_MUTE) == HIGH))
    {
        audioConfig.isMute = (audioConfig.isMute == FALSE) ? TRUE : FALSE;
        setMute(audioConfig.isMute);
        sendControlValue(CNT_GET_MUTE, audioConfig.isMute);  
        delay(BUTTON_PRESS_DELAY);
    }

    // Get current state of the input buttons.
    lastVolUp = digitalRead(PIN_VOL_UP);
    lastVolDown = digitalRead(PIN_VOL_DOWN);
    lastMute = digitalRead(PIN_MUTE);
    
    if(Serial.available() == 0)
    {
        // Serial data is not available.
        return;
    }

    String cmdData = Serial.readString();
    cmdData.trim();

    String subCmd = cmdData.substring(0, 3);
    if(subCmd == CNT_CMD_TRIM_REAR_LEFT)
    {
        // Adjust rear left trim level.
        audioConfig.trimSettings.rearLeft = cmdData.substring(3).toInt();
        setTrimLevel(PT2322_TRIM_CHANNEL_REAR_LEFT, audioConfig.trimSettings.rearLeft);

        Serial.print(CNT_ACK);
        EEPROM.update(EEPROM_ADDR_TRIM_REAR_LEFT, audioConfig.trimSettings.rearLeft);
    }
    else if(subCmd == CNT_CMD_TRIM_REAR_RIGHT)
    {
        // Adjust rear right trim level.
        audioConfig.trimSettings.rearRight = cmdData.substring(3).toInt();
        setTrimLevel(PT2322_TRIM_CHANNEL_REAR_RIGHT, audioConfig.trimSettings.rearRight);

        Serial.print(CNT_ACK);
        EEPROM.update(EEPROM_ADDR_TRIM_REAR_RIGHT, audioConfig.trimSettings.rearRight);
    }
    else if(subCmd == CNT_CMD_TRIM_FRONT_LEFT)
    {
        // Adjust front left trim level.
        audioConfig.trimSettings.frontLeft = cmdData.substring(3).toInt();
        setTrimLevel(PT2322_TRIM_CHANNEL_FRONT_LEFT, audioConfig.trimSettings.frontLeft);

        Serial.print(CNT_ACK);
        EEPROM.update(EEPROM_ADDR_TRIM_FRONT_LEFT, audioConfig.trimSettings.frontLeft);
    }
    else if(subCmd == CNT_CMD_TRIM_FRONT_RIGHT)
    {
        // Adjust front right trim level.
        audioConfig.trimSettings.frontRight = cmdData.substring(3).toInt();
        setTrimLevel(PT2322_TRIM_CHANNEL_FRONT_RIGHT, audioConfig.trimSettings.frontRight);

        Serial.print(CNT_ACK);
        EEPROM.update(EEPROM_ADDR_TRIM_FRONT_RIGHT, audioConfig.trimSettings.frontRight);
    }
    else if(subCmd == CNT_CMD_TRIM_CENTER)
    {
        // Adjust center trim level.
        audioConfig.trimSettings.center = cmdData.substring(3).toInt();
        setTrimLevel(PT2322_TRIM_CHANNEL_CENTER, audioConfig.trimSettings.center);

        Serial.print(CNT_ACK);
        EEPROM.update(EEPROM_ADDR_TRIM_CENTER, audioConfig.trimSettings.center);
    }
    else if(subCmd == CNT_CMD_TRIM_SUBWOOFER)
    {
        // Adjust subwoofer trim level.
        audioConfig.trimSettings.subwoofer = cmdData.substring(3).toInt();
        setTrimLevel(PT2322_TRIM_CHANNEL_SUBWOOFER, audioConfig.trimSettings.subwoofer);

        Serial.print(CNT_ACK);
        EEPROM.update(EEPROM_ADDR_TRIM_SUBWOOFER, audioConfig.trimSettings.subwoofer);
    }
    else if(subCmd == CNT_CMD_MASTER)
    {
        // Adjust master volume level.
        audioConfig.master = cmdData.substring(3).toInt();
        setMasterVolume(audioConfig.master);

        Serial.print(CNT_ACK);
        EEPROM.update(EEPROM_ADDR_MASTER_VOLUME, audioConfig.master);
    }
    else if(subCmd == CNT_CMD_BASS)
    {
        // Adjust bass level.
        audioConfig.toneSettings.bass = cmdData.substring(3).toInt();
        setToneLevel(PT2322_TONE_BASS, audioConfig.toneSettings.bass);

        Serial.print(CNT_ACK);
        EEPROM.update(EEPROM_ADDR_BASS, audioConfig.toneSettings.bass);
    }
    else if(subCmd == CNT_CMD_TREBLE)
    {
        // Adjust treble level.
        audioConfig.toneSettings.treble = cmdData.substring(3).toInt();
        setToneLevel(PT2322_TONE_TREBLE, audioConfig.toneSettings.treble);

        Serial.print(CNT_ACK);
        EEPROM.update(EEPROM_ADDR_TREBLE, audioConfig.toneSettings.treble);
    }
    else if(subCmd == CNT_CMD_MID_RANGE)
    {
        // Adjust mid-range level.
        audioConfig.toneSettings.mid = cmdData.substring(3).toInt();
        setToneLevel(PT2322_TONE_MID, audioConfig.toneSettings.mid);

        Serial.print(CNT_ACK);
        EEPROM.update(EEPROM_ADDR_MID, audioConfig.toneSettings.mid);
    }
    else if(subCmd == CNT_CMD_MUTE)
    {
        // Set mute state.
        audioConfig.isMute = cmdData.substring(3).toInt();
        setMute((audioConfig.isMute > 0) ? TRUE : FALSE);

        Serial.print(CNT_ACK);
    }
    else if(subCmd == CNT_CMD_TONE)
    {
        // Set tone control state.
        audioConfig.isToneDisable = cmdData.substring(3).toInt();
        setTone((audioConfig.isToneDisable > 0) ? TRUE : FALSE);

        Serial.print(CNT_ACK);
        EEPROM.update(EEPROM_ADDR_TONE, ((audioConfig.isToneDisable > 0) ? 1 : 0));
    }
    else if(subCmd == CNT_CMD_3D_AUDIO)
    {
        // Set 3D audio state.
        audioConfig.is3DDisable = cmdData.substring(3).toInt();
        set3DAudio((audioConfig.is3DDisable > 0) ? TRUE : FALSE);

        Serial.print(CNT_ACK);
        EEPROM.update(EEPROM_ADDR_3DFX, ((audioConfig.is3DDisable > 0) ? 1 : 0));
    }
    else if(cmdData == PING_CMD_DEV_ID)
    {
        // Device identification request.
        Serial.print(CNT_ACK);
    }
    else if(cmdData == CNT_GET_TRIM_REAR_LEFT)
    {
        sendControlValue(CNT_GET_TRIM_REAR_LEFT, audioConfig.trimSettings.rearLeft);
    }
    else if(cmdData == CNT_GET_TRIM_REAR_RIGHT)
    {
        sendControlValue(CNT_GET_TRIM_REAR_RIGHT, audioConfig.trimSettings.rearRight);
    }
    else if(cmdData == CNT_GET_TRIM_FRONT_LEFT)
    {
        sendControlValue(CNT_GET_TRIM_FRONT_LEFT, audioConfig.trimSettings.frontLeft);
    }
    else if(cmdData == CNT_GET_TRIM_FRONT_RIGHT)
    {
        sendControlValue(CNT_GET_TRIM_FRONT_RIGHT, audioConfig.trimSettings.frontRight);
    }
    else if(cmdData == CNT_GET_TRIM_CENTER)
    {
        sendControlValue(CNT_GET_TRIM_CENTER, audioConfig.trimSettings.center);
    }
    else if(cmdData == CNT_GET_TRIM_SUBWOOFER)
    {
        sendControlValue(CNT_GET_TRIM_SUBWOOFER, audioConfig.trimSettings.subwoofer);
    }
    else if(cmdData == CNT_GET_MASTER)
    {
        sendControlValue(CNT_GET_MASTER, audioConfig.master);
    }
    else if(cmdData == CNT_GET_BASS)
    {
        sendControlValue(CNT_GET_BASS, audioConfig.toneSettings.bass);
    }
    else if(cmdData == CNT_GET_TREBLE)
    {
        sendControlValue(CNT_GET_TREBLE, audioConfig.toneSettings.treble);
    }
    else if(cmdData == CNT_GET_MID_RANGE)
    {
        sendControlValue(CNT_GET_MID_RANGE, audioConfig.toneSettings.mid);
    }
    else if(cmdData == CNT_GET_3D_AUDIO)
    {
        sendControlValue(CNT_GET_3D_AUDIO, audioConfig.is3DDisable);
    }
    else if(cmdData == CNT_GET_MUTE)
    {
        sendControlValue(CNT_GET_MUTE, audioConfig.isMute);
    }
    else if(cmdData == CNT_GET_TONE)
    {
        sendControlValue(CNT_GET_TONE, audioConfig.isToneDisable);
    }
    else
    {
        // Unknown command.
        Serial.print(CNT_ERROR);
    }
}