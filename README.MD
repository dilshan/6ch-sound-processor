
# 5.1 channel analog audio processor

This project is a 5.1-channel, USB analog audio processor based on *PT2322* and [Arduino Nano](https://store.arduino.cc/products/arduino-nano).

![Finished 5.1-channel analog audio processor board.](https://raw.githubusercontent.com/dilshan/6ch-sound-processor/main/resources/6ch-afx-board.jpg)

[*PT2322*](https://www.alldatasheet.com/datasheet-pdf/pdf/167269/ETC1/PT2322.html) is an inexpensive analog audio processor introduced by [*Princeton Technology Corporation*](http://www.princeton.com.tw/). It contains 6-channel individual channel attenuators, a 3-way tone control system for front-end speakers, and a 3D audio simulation system.

In this design, we combine *PT2322* with *Arduino Nano* and interface it with PC/embedded computing boards through a USB port. Native *GTK* UI application provides to control all functions of the *PT2322* IC.

This audio processing module is an open-source hardware project. All the design files, source codes, and compiled binaries are available in this repository.

- [6ch-sound-fx-arduino](https://github.com/dilshan/6ch-sound-processor/tree/main/6ch-sound-fx-arduino): Source code of the *Arduino Nano* firmware.
- [6ch-sound-fx-controller](https://github.com/dilshan/6ch-sound-processor/tree/main/6ch-sound-fx-controller): Source code of the sound processor control application.
- [kicad-design](https://github.com/dilshan/6ch-sound-processor/tree/main/kicad-design): *KiCAD* 6 schematic and PCB design.

## Assembling the module

The PCB of this module can directly order from the [pcbway.com](https://www.pcbway.com/) project page. Also, the latest Gerber files of this module are available in the [release](https://github.com/dilshan/6ch-sound-processor/releases) section of this repository.

All the required components to assemble this module are in the BOM file at [here](https://github.com/dilshan/6ch-sound-processor/tree/main/kicad-design/6ch-sound-fx-proc-bom.pdf).

The entire assembly process of this module is shown in the below video:

[![5.1 Channel Audio Processor](https://i3.ytimg.com/vi/wblaniLDYwU/maxresdefault.jpg)](https://youtu.be/wblaniLDYwU)

## Compiling source codes

*Arduino Nano* firmware of this project is written using [*PlatformIO*](https://platformio.org/). To compile and install the firmware, use the latest version of [*PlatformIO IDE*](https://platformio.org/platformio-ide).

![Sound processor control application](https://raw.githubusercontent.com/dilshan/6ch-sound-processor/main/resources/6ch-afx-control-app.jpg)

The sound processor control application is a *GTK* application. *GTK* 3 development packages are required to compile this application. To compile the application, issue the `make` command from the source directory.

```
$ git clone git@github.com:dilshan/6ch-sound-processor.git
$ cd 6ch-sound-processor/6ch-sound-fx-controller/
$ make
```
