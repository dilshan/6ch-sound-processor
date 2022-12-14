EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "5.1 channel audio processor"
Date "2021-09-13"
Rev "1.0.0"
Comp "Dilshan R Jayakody"
Comment1 "jayakody2000lk@gmail.com"
Comment2 "http://jayakody2000lk.blogspot.com"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 615DE671
P 5650 2900
F 0 "A1" H 5300 1950 50  0000 C CNN
F 1 "Arduino Nano (V3)" H 6200 1950 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5650 2900 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5650 2900 50  0001 C CNN
	1    5650 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3300 6150 3300
Wire Wire Line
	6450 3400 6150 3400
Text GLabel 6450 3300 2    50   BiDi ~ 0
SDA
Text GLabel 6450 3400 2    50   Input ~ 0
SCL
$Comp
L power:GNDD #PWR0148
U 1 1 61408B01
P 5750 4200
F 0 "#PWR0148" H 5750 3950 50  0001 C CNN
F 1 "GNDD" H 5754 4045 50  0000 C CNN
F 2 "" H 5750 4200 50  0001 C CNN
F 3 "" H 5750 4200 50  0001 C CNN
	1    5750 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3900 5750 4050
Wire Wire Line
	5650 3900 5650 4050
Wire Wire Line
	5650 4050 5750 4050
Connection ~ 5750 4050
Wire Wire Line
	5750 4050 5750 4200
NoConn ~ 5550 1900
NoConn ~ 5750 1900
$Comp
L power:+5V #PWR0149
U 1 1 6140986A
P 5850 1700
F 0 "#PWR0149" H 5850 1550 50  0001 C CNN
F 1 "+5V" H 5865 1873 50  0000 C CNN
F 2 "" H 5850 1700 50  0001 C CNN
F 3 "" H 5850 1700 50  0001 C CNN
	1    5850 1700
	1    0    0    -1  
$EndComp
NoConn ~ 6150 2300
NoConn ~ 6150 2400
NoConn ~ 6150 2700
NoConn ~ 5150 2300
NoConn ~ 5150 2400
NoConn ~ 6150 2900
NoConn ~ 6150 3000
NoConn ~ 6150 3100
NoConn ~ 6150 3200
NoConn ~ 6150 3500
NoConn ~ 6150 3600
NoConn ~ 5150 3600
NoConn ~ 5150 3500
NoConn ~ 5150 3400
NoConn ~ 5150 3300
NoConn ~ 5150 3200
NoConn ~ 5150 3100
NoConn ~ 5150 2600
NoConn ~ 5150 2500
$Comp
L Switch:SW_Push SW3
U 1 1 61429EF2
P 4300 3300
F 0 "SW3" V 4346 3252 50  0000 R CNN
F 1 "6mm Tactile" V 4255 3252 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 4300 3500 50  0001 C CNN
F 3 "~" H 4300 3500 50  0001 C CNN
	1    4300 3300
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 6142A9F6
P 3450 3300
F 0 "SW2" V 3496 3252 50  0000 R CNN
F 1 "6mm Tactile" V 3405 3252 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 3450 3500 50  0001 C CNN
F 3 "~" H 3450 3500 50  0001 C CNN
	1    3450 3300
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 6142AF8E
P 2600 3300
F 0 "SW1" V 2646 3252 50  0000 R CNN
F 1 "6mm Tactile" V 2555 3252 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 2600 3500 50  0001 C CNN
F 3 "~" H 2600 3500 50  0001 C CNN
	1    2600 3300
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDD #PWR0150
U 1 1 6142B369
P 4300 4200
F 0 "#PWR0150" H 4300 3950 50  0001 C CNN
F 1 "GNDD" H 4304 4045 50  0000 C CNN
F 2 "" H 4300 4200 50  0001 C CNN
F 3 "" H 4300 4200 50  0001 C CNN
	1    4300 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0151
U 1 1 6142B753
P 3450 4200
F 0 "#PWR0151" H 3450 3950 50  0001 C CNN
F 1 "GNDD" H 3454 4045 50  0000 C CNN
F 2 "" H 3450 4200 50  0001 C CNN
F 3 "" H 3450 4200 50  0001 C CNN
	1    3450 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0152
U 1 1 6142BAF2
P 2600 4200
F 0 "#PWR0152" H 2600 3950 50  0001 C CNN
F 1 "GNDD" H 2604 4045 50  0000 C CNN
F 2 "" H 2600 4200 50  0001 C CNN
F 3 "" H 2600 4200 50  0001 C CNN
	1    2600 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 2700 2600 2700
Wire Wire Line
	2600 2700 2600 3100
Wire Wire Line
	5150 2800 3450 2800
Wire Wire Line
	3450 2800 3450 3100
Wire Wire Line
	5150 2900 4300 2900
Wire Wire Line
	4300 2900 4300 3100
Wire Wire Line
	4300 3500 4300 4200
Wire Wire Line
	3450 3500 3450 4200
Wire Wire Line
	2600 3500 2600 4200
NoConn ~ 5150 3000
Wire Wire Line
	5850 1700 5850 1900
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 614352B6
P 7700 3650
F 0 "#FLG0103" H 7700 3725 50  0001 C CNN
F 1 "PWR_FLAG" H 7700 3823 50  0000 C CNN
F 2 "" H 7700 3650 50  0001 C CNN
F 3 "~" H 7700 3650 50  0001 C CNN
	1    7700 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0153
U 1 1 61435E67
P 7700 4200
F 0 "#PWR0153" H 7700 3950 50  0001 C CNN
F 1 "GNDD" H 7704 4045 50  0000 C CNN
F 2 "" H 7700 4200 50  0001 C CNN
F 3 "" H 7700 4200 50  0001 C CNN
	1    7700 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 3650 7700 4200
Text Notes 4300 2650 0    50   ~ 0
MUTE
Text Notes 2600 2650 0    50   ~ 0
VOLUME\nUP
Text Notes 3450 2650 0    50   ~ 0
VOLUME \nDOWN
$Comp
L power:GNDD #PWR01
U 1 1 614506A3
P 8600 4200
F 0 "#PWR01" H 8600 3950 50  0001 C CNN
F 1 "GNDD" H 8604 4045 50  0000 C CNN
F 2 "" H 8600 4200 50  0001 C CNN
F 3 "" H 8600 4200 50  0001 C CNN
	1    8600 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR02
U 1 1 61451F00
P 9200 4200
F 0 "#PWR02" H 9200 3950 50  0001 C CNN
F 1 "GNDA" H 9205 4027 50  0000 C CNN
F 2 "" H 9200 4200 50  0001 C CNN
F 3 "" H 9200 4200 50  0001 C CNN
	1    9200 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 61452D5A
P 8900 3850
F 0 "R21" V 8693 3850 50  0000 C CNN
F 1 "0R" V 8784 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8830 3850 50  0001 C CNN
F 3 "~" H 8900 3850 50  0001 C CNN
	1    8900 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	8600 4200 8600 3850
Wire Wire Line
	8600 3850 8750 3850
Wire Wire Line
	9050 3850 9200 3850
Wire Wire Line
	9200 3850 9200 4200
Text Notes 8750 3550 0    50   ~ 0
OPTIONAL
$Comp
L power:+5V #PWR03
U 1 1 614585AD
P 7700 1700
F 0 "#PWR03" H 7700 1550 50  0001 C CNN
F 1 "+5V" H 7715 1873 50  0000 C CNN
F 2 "" H 7700 1700 50  0001 C CNN
F 3 "" H 7700 1700 50  0001 C CNN
	1    7700 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR04
U 1 1 61458B92
P 7700 2400
F 0 "#PWR04" H 7700 2150 50  0001 C CNN
F 1 "GNDD" H 7704 2245 50  0000 C CNN
F 2 "" H 7700 2400 50  0001 C CNN
F 3 "" H 7700 2400 50  0001 C CNN
	1    7700 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C27
U 1 1 614591DC
P 7700 2050
F 0 "C27" H 7815 2096 50  0000 L CNN
F 1 "10MFD" H 7815 2005 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7700 2050 50  0001 C CNN
F 3 "~" H 7700 2050 50  0001 C CNN
	1    7700 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 1700 7700 1900
Wire Wire Line
	7700 2200 7700 2400
Text Notes 5100 4600 0    50   ~ 0
2.54mm female header (2 x 15 pin)
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 6141F322
P 2600 5850
F 0 "H1" H 2700 5899 50  0000 L CNN
F 1 "M3" H 2700 5808 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 2600 5850 50  0001 C CNN
F 3 "~" H 2600 5850 50  0001 C CNN
	1    2600 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0154
U 1 1 61420427
P 2600 6150
F 0 "#PWR0154" H 2600 5900 50  0001 C CNN
F 1 "GNDA" H 2605 5977 50  0000 C CNN
F 2 "" H 2600 6150 50  0001 C CNN
F 3 "" H 2600 6150 50  0001 C CNN
	1    2600 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 5950 2600 6150
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 614214BF
P 3100 5850
F 0 "H2" H 3200 5899 50  0000 L CNN
F 1 "M3" H 3200 5808 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 3100 5850 50  0001 C CNN
F 3 "~" H 3100 5850 50  0001 C CNN
	1    3100 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0155
U 1 1 6142161F
P 3100 6150
F 0 "#PWR0155" H 3100 5900 50  0001 C CNN
F 1 "GNDA" H 3105 5977 50  0000 C CNN
F 2 "" H 3100 6150 50  0001 C CNN
F 3 "" H 3100 6150 50  0001 C CNN
	1    3100 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5950 3100 6150
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 61423271
P 3550 5850
F 0 "H3" H 3650 5899 50  0000 L CNN
F 1 "M3" H 3650 5808 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 3550 5850 50  0001 C CNN
F 3 "~" H 3550 5850 50  0001 C CNN
	1    3550 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0156
U 1 1 614233EB
P 3550 6150
F 0 "#PWR0156" H 3550 5900 50  0001 C CNN
F 1 "GNDA" H 3555 5977 50  0000 C CNN
F 2 "" H 3550 6150 50  0001 C CNN
F 3 "" H 3550 6150 50  0001 C CNN
	1    3550 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5950 3550 6150
Wire Notes Line
	2000 5300 4150 5300
Wire Notes Line
	4150 5300 4150 6650
Wire Notes Line
	4150 6650 2000 6650
Wire Notes Line
	2000 6650 2000 5300
Text Notes 2000 6750 0    50   ~ 0
PCB MOUNTING HOLES (M3)
$EndSCHEMATC
