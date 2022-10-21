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

#ifndef _6CH_SOUND_PROCESSOR_COMMON_H_
#define _6CH_SOUND_PROCESSOR_COMMON_H_

// Number of requests to identify the target device.
#define DEV_ID_TRY_COUNT    10

// Maximum number of requests issue to the device to get the 
// successful reponse.
#define MAX_TRY_COUNT   5

// Control IDs.
enum ControlID
{
    // Level control IDs.
    CID_MASTER,
    CID_TRIM_FRONT_LEFT,
    CID_TRIM_FRONT_RIGHT,
    CID_TRIM_REAR_LEFT,
    CID_TRIM_REAR_RIGHT,
    CID_CENTER,
    CID_SUBWOOFER,
    CID_BASS,
    CID_MID,
    CID_TREBLE,

    // Effect control IDs.
    CID_TONE,
    CID_3DFX
};

typedef void (*onMasterVolumeEvent)(unsigned char newLevel);
typedef void (*onTrimChannelVolumeEvent)(enum ControlID cID, unsigned char newLevel);
typedef void (*onToneLevelEvent)(enum ControlID cID, unsigned char newLevel);
typedef void (*onEffectEvent)(enum ControlID cID, gboolean newState);

// Channel output trim levels.
typedef struct trimLevel
{
    unsigned char frontLeft;
    unsigned char frontRight;
    unsigned char rearLeft;
    unsigned char rearRight;
    unsigned char center;
    unsigned char subwoofer;
} trimLevel;

// Tone control levels.
typedef struct toneLevel
{
    unsigned char bass;
    unsigned char treble;
    unsigned char mid;
} toneLevel;

// Audio settings for PT2322.
typedef struct audioSettings
{
    trimLevel trimSettings;
    toneLevel toneSettings;
    unsigned char master;
    gboolean isMute;
    gboolean isToneDisable;
    gboolean is3DDisable;
} audioSettings;

// Data structure to pass data between threads.
typedef struct commInfo
{
    int serialIntf;
    audioSettings *audioControlData;

    onMasterVolumeEvent masterVolumeEvent;
    onTrimChannelVolumeEvent trimChannelVolumeEvent;
    onToneLevelEvent toneLevelEvent;
    onEffectEvent effectEvent;
} commInfo;

// Serial commands to control the sound processor board.
#define CNT_CMD_TRIM_REAR_LEFT      "RLT"
#define CNT_CMD_TRIM_REAR_RIGHT     "RRT"
#define CNT_CMD_TRIM_FRONT_LEFT     "FLT"
#define CNT_CMD_TRIM_FRONT_RIGHT    "FRT"
#define CNT_CMD_TRIM_CENTER         "CET"
#define CNT_CMD_TRIM_SUBWOOFER      "SWT"
#define CNT_CMD_MASTER              "MST"
#define CNT_CMD_BASS                "TBL"
#define CNT_CMD_TREBLE              "TTL"
#define CNT_CMD_MID_RANGE           "TML"
#define CNT_CMD_MUTE                "FCM"
#define CNT_CMD_TONE                "FCT"
#define CNT_CMD_3D_AUDIO            "FC3"

// Serial commands to get current control values from 
// the sound processor board.
#define CNT_GET_TRIM_REAR_LEFT      "RLG"
#define CNT_GET_TRIM_REAR_RIGHT     "RRG"
#define CNT_GET_TRIM_FRONT_LEFT     "FLG"
#define CNT_GET_TRIM_FRONT_RIGHT    "FRG"
#define CNT_GET_TRIM_CENTER         "CEG"
#define CNT_GET_TRIM_SUBWOOFER      "SWG"
#define CNT_GET_MASTER              "MSG"
#define CNT_GET_BASS                "TBG"
#define CNT_GET_TREBLE              "TTG"
#define CNT_GET_MID_RANGE           "TMG"
#define CNT_GET_MUTE                "FGM"
#define CNT_GET_TONE                "FGT"
#define CNT_GET_3D_AUDIO            "FG3"

// Ping command to identify the device.
#define PING_CMD_DEV_ID     "SFX51"

// Status codes used in serial communication.
#define CNT_ACK     "ACK"
#define CNT_ERROR   "ERR"

#endif /* _6CH_SOUND_PROCESSOR_COMMON_H_ */