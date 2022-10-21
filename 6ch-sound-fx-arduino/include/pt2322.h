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

#ifndef _6CH_SOUND_FX_PT2322_HEADER_
#define _6CH_SOUND_FX_PT2322_HEADER_

#define PT2322_FUNC_MUTE    3
#define PT2322_FUNC_3D      2
#define PT2322_TONE_CONTROL 1

#define PT2322_TRIM_CHANNEL_FRONT_LEFT  0x10
#define PT2322_TRIM_CHANNEL_FRONT_RIGHT 0x20
#define PT2322_TRIM_CHANNEL_CENTER      0x30
#define PT2322_TRIM_CHANNEL_REAR_LEFT   0x40
#define PT2322_TRIM_CHANNEL_REAR_RIGHT  0x50
#define PT2322_TRIM_CHANNEL_SUBWOOFER   0x60

#define PT2322_TONE_BASS    0x90
#define PT2322_TONE_MID     0xA0
#define PT2322_TONE_TREBLE  0xB0

#define PT2322_MASTER_VOLUME_MIN    0x4F
#define PT2322_MASTER_VOLUME_MAX    0x00

#define PT2322_TRIM_MIN     0x0F
#define PT2322_TRIM_MAX     0x00

#define PT2322_TONE_MIN     0x0F
#define PT2322_TONE_MAX     0x00

void initPT2322();

void setLevel(unsigned char channel, unsigned char level);
void setMasterVolume(unsigned char level);

void setFunctionState(unsigned char func, unsigned char isSet);
unsigned char getFunctionState(unsigned char func);

#define setTrimLevel(c,l) setLevel(c,l)
#define setToneLevel(t,l) setLevel(t,l)

#define setMute(v) setFunctionState(PT2322_FUNC_MUTE, v)
#define set3DAudio(v) setFunctionState(PT2322_FUNC_3D, v)
#define setTone(v) setFunctionState(PT2322_TONE_CONTROL, v)

#define getMute() getFunctionState(PT2322_FUNC_MUTE)
#define get3DAudio() getFunctionState(PT2322_FUNC_3D)
#define getTone() getFunctionState(PT2322_TONE_CONTROL)

#endif /* _6CH_SOUND_FX_PT2322_HEADER_ */