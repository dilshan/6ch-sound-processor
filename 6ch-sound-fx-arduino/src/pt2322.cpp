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

#include "pt2322.h"

#define PT2322_ADDRESS  0x44

#define PT2322_CMD_REG_CLEAR        0xFF
#define PT2322_CMD_INPUT_SWITCH     0xC7
#define PT2322_CMD_FUNCTION_SELECT  0x70
#define PT2322_CMD_1DB_VOLUME       0xD0
#define PT2322_CMD_10DB_VOLUME      0xE0

unsigned char functionReg;

void sendPT2322(unsigned char cmd)
{
    Wire.beginTransmission(PT2322_ADDRESS);
    Wire.write(cmd);
    Wire.endTransmission();
}

void initPT2322()
{
    // Initialize PT2322 by sending the registry clear and activate input switch commands.
    sendPT2322(PT2322_CMD_REG_CLEAR);
    sendPT2322(PT2322_CMD_INPUT_SWITCH);

    // Mute audio, disable the 3D effect and tone control.
    functionReg = PT2322_CMD_FUNCTION_SELECT | ((1 << PT2322_FUNC_MUTE) | (1 << PT2322_FUNC_3D) | (1 << PT2322_TONE_CONTROL));
    sendPT2322(functionReg);
}

void setLevel(unsigned char channel, unsigned char level)
{
    level = level & 0x0F;
    sendPT2322(channel | level);
}

void setMasterVolume(unsigned char level)
{
    if(level > PT2322_MASTER_VOLUME_MIN)
    {
        level = PT2322_MASTER_VOLUME_MIN;
    }

    Wire.beginTransmission(PT2322_ADDRESS);

    // Send master volume level in -10dB steps.
    Wire.write(PT2322_CMD_10DB_VOLUME | (level/10));

    // Send master volume level in -1dB steps.
    Wire.write(PT2322_CMD_1DB_VOLUME | (level%10));

    Wire.endTransmission();
}

void setFunctionState(unsigned char func, unsigned char isSet)
{
    if(isSet)
    {
        functionReg = functionReg | (1 << func);
    }
    else
    {
        functionReg = functionReg & (~(1 << func));
    }

    sendPT2322(functionReg);
}

unsigned char getFunctionState(unsigned char func)
{
    return (functionReg & (1 << func));
}