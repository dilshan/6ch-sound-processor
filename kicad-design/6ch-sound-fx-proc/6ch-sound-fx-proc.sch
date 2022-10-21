EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 13780 8661
encoding utf-8
Sheet 1 2
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
L Device:C C7
U 1 1 613EB203
P 3650 4850
F 0 "C7" V 3750 4950 50  0000 L CNN
F 1 "0.0022MFD" V 3500 4650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 3688 4700 50  0001 C CNN
F 3 "~" H 3650 4850 50  0001 C CNN
	1    3650 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C8
U 1 1 613EBDC5
P 4000 3900
F 0 "C8" H 3750 3950 50  0000 L CNN
F 1 "10MFD" H 3600 3850 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 4000 3900 50  0001 C CNN
F 3 "~" H 4000 3900 50  0001 C CNN
	1    4000 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0101
U 1 1 613EE4D2
P 3800 3500
F 0 "#PWR0101" H 3800 3250 50  0001 C CNN
F 1 "GNDD" H 3804 3345 50  0000 C CNN
F 2 "" H 3800 3500 50  0001 C CNN
F 3 "" H 3800 3500 50  0001 C CNN
	1    3800 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3500 3800 3350
Wire Wire Line
	4000 3750 4000 3350
$Comp
L power:GNDA #PWR0102
U 1 1 613F01DB
P 4000 4150
F 0 "#PWR0102" H 4000 3900 50  0001 C CNN
F 1 "GNDA" H 4005 3977 50  0000 C CNN
F 2 "" H 4000 4150 50  0001 C CNN
F 3 "" H 4000 4150 50  0001 C CNN
	1    4000 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4050 4000 4150
$Comp
L Device:C C9
U 1 1 613F1AE9
P 4100 4850
F 0 "C9" V 4200 4950 50  0000 L CNN
F 1 "0.0022MFD" V 3950 4650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4138 4700 50  0001 C CNN
F 3 "~" H 4100 4850 50  0001 C CNN
	1    4100 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3350 4250 4500
Wire Wire Line
	4250 4500 3650 4500
Wire Wire Line
	3650 4500 3650 4700
Wire Wire Line
	4350 3350 4350 4600
Wire Wire Line
	4350 4600 4100 4600
Wire Wire Line
	4100 4600 4100 4700
$Comp
L power:GNDA #PWR0103
U 1 1 613F2C52
P 3650 5150
F 0 "#PWR0103" H 3650 4900 50  0001 C CNN
F 1 "GNDA" H 3655 4977 50  0000 C CNN
F 2 "" H 3650 5150 50  0001 C CNN
F 3 "" H 3650 5150 50  0001 C CNN
	1    3650 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0104
U 1 1 613F3104
P 4100 5150
F 0 "#PWR0104" H 4100 4900 50  0001 C CNN
F 1 "GNDA" H 4105 4977 50  0000 C CNN
F 2 "" H 4100 5150 50  0001 C CNN
F 3 "" H 4100 5150 50  0001 C CNN
	1    4100 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 5150 3650 5000
Wire Wire Line
	4100 5150 4100 5000
$Comp
L Device:C C10
U 1 1 613F49CC
P 4500 4850
F 0 "C10" V 4600 4950 50  0000 L CNN
F 1 "0.01MFD" V 4350 4700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4538 4700 50  0001 C CNN
F 3 "~" H 4500 4850 50  0001 C CNN
	1    4500 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 613F55C4
P 4850 4850
F 0 "C11" V 4950 4950 50  0000 L CNN
F 1 "0.01MFD" V 4700 4700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4888 4700 50  0001 C CNN
F 3 "~" H 4850 4850 50  0001 C CNN
	1    4850 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3350 4500 4700
Wire Wire Line
	4600 3350 4600 4600
Wire Wire Line
	4600 4600 4850 4600
Wire Wire Line
	4850 4600 4850 4700
Wire Wire Line
	4500 5000 4500 5100
Wire Wire Line
	4500 5100 4850 5100
Wire Wire Line
	4850 5100 4850 5000
$Comp
L Device:R R7
U 1 1 613F6853
P 4500 5350
F 0 "R7" H 4570 5396 50  0000 L CNN
F 1 "3.3K" H 4570 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4430 5350 50  0001 C CNN
F 3 "~" H 4500 5350 50  0001 C CNN
	1    4500 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0105
U 1 1 613F6E0A
P 4500 5600
F 0 "#PWR0105" H 4500 5350 50  0001 C CNN
F 1 "GNDA" H 4505 5427 50  0000 C CNN
F 2 "" H 4500 5600 50  0001 C CNN
F 3 "" H 4500 5600 50  0001 C CNN
	1    4500 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 5100 4500 5200
Connection ~ 4500 5100
Wire Wire Line
	4500 5500 4500 5600
$Comp
L Device:C C12
U 1 1 613F7D24
P 5200 4850
F 0 "C12" V 5300 4950 50  0000 L CNN
F 1 "0.01MFD" V 5050 4700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5238 4700 50  0001 C CNN
F 3 "~" H 5200 4850 50  0001 C CNN
	1    5200 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 613F80C5
P 5550 4850
F 0 "C13" V 5650 4950 50  0000 L CNN
F 1 "0.01MFD" V 5400 4700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5588 4700 50  0001 C CNN
F 3 "~" H 5550 4850 50  0001 C CNN
	1    5550 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3350 4750 4500
Wire Wire Line
	4750 4500 5200 4500
Wire Wire Line
	5200 4500 5200 4700
Wire Wire Line
	4850 3350 4850 4400
Wire Wire Line
	4850 4400 5550 4400
Wire Wire Line
	5550 4400 5550 4700
Wire Wire Line
	5550 5000 5550 5100
Wire Wire Line
	5550 5100 5200 5100
Wire Wire Line
	5200 5100 5200 5000
$Comp
L Device:R R8
U 1 1 613F965A
P 5200 5350
F 0 "R8" H 5270 5396 50  0000 L CNN
F 1 "3.3K" H 5270 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5130 5350 50  0001 C CNN
F 3 "~" H 5200 5350 50  0001 C CNN
	1    5200 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0106
U 1 1 613F9B6A
P 5200 5600
F 0 "#PWR0106" H 5200 5350 50  0001 C CNN
F 1 "GNDA" H 5205 5427 50  0000 C CNN
F 2 "" H 5200 5600 50  0001 C CNN
F 3 "" H 5200 5600 50  0001 C CNN
	1    5200 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 5600 5200 5500
Wire Wire Line
	5200 5200 5200 5100
Connection ~ 5200 5100
$Comp
L Device:C C14
U 1 1 613FAD2F
P 5900 4850
F 0 "C14" V 6000 4950 50  0000 L CNN
F 1 "0.1MFD" V 5750 4700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5938 4700 50  0001 C CNN
F 3 "~" H 5900 4850 50  0001 C CNN
	1    5900 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 613FB46E
P 6250 4850
F 0 "C15" V 6350 4950 50  0000 L CNN
F 1 "0.1MFD" V 6100 4700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6288 4700 50  0001 C CNN
F 3 "~" H 6250 4850 50  0001 C CNN
	1    6250 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3350 5000 4300
Wire Wire Line
	5000 4300 5900 4300
Wire Wire Line
	5900 4300 5900 4700
Wire Wire Line
	5100 3350 5100 4200
Wire Wire Line
	5100 4200 6250 4200
Wire Wire Line
	6250 4200 6250 4700
Wire Wire Line
	6250 5000 6250 5100
Wire Wire Line
	6250 5100 5900 5100
Wire Wire Line
	5900 5100 5900 5000
$Comp
L Device:R R9
U 1 1 613FD866
P 5900 5350
F 0 "R9" H 5970 5396 50  0000 L CNN
F 1 "6.2K" H 5970 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5830 5350 50  0001 C CNN
F 3 "~" H 5900 5350 50  0001 C CNN
	1    5900 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 5200 5900 5100
Connection ~ 5900 5100
$Comp
L power:GNDA #PWR0107
U 1 1 613FE8EB
P 5900 5600
F 0 "#PWR0107" H 5900 5350 50  0001 C CNN
F 1 "GNDA" H 5905 5427 50  0000 C CNN
F 2 "" H 5900 5600 50  0001 C CNN
F 3 "" H 5900 5600 50  0001 C CNN
	1    5900 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 5600 5900 5500
$Comp
L Device:C C16
U 1 1 61406C79
P 6600 4850
F 0 "C16" V 6700 4950 50  0000 L CNN
F 1 "0.1MFD" V 6450 4700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6638 4700 50  0001 C CNN
F 3 "~" H 6600 4850 50  0001 C CNN
	1    6600 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 61406E03
P 6950 4850
F 0 "C17" V 7050 4950 50  0000 L CNN
F 1 "0.1MFD" V 6800 4700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6988 4700 50  0001 C CNN
F 3 "~" H 6950 4850 50  0001 C CNN
	1    6950 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 5000 6950 5100
Wire Wire Line
	6950 5100 6600 5100
Wire Wire Line
	6600 5100 6600 5000
$Comp
L Device:R R10
U 1 1 61406E10
P 6600 5350
F 0 "R10" H 6670 5396 50  0000 L CNN
F 1 "6.2K" H 6670 5305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6530 5350 50  0001 C CNN
F 3 "~" H 6600 5350 50  0001 C CNN
	1    6600 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5200 6600 5100
Connection ~ 6600 5100
$Comp
L power:GNDA #PWR0108
U 1 1 61406E1C
P 6600 5600
F 0 "#PWR0108" H 6600 5350 50  0001 C CNN
F 1 "GNDA" H 6605 5427 50  0000 C CNN
F 2 "" H 6600 5600 50  0001 C CNN
F 3 "" H 6600 5600 50  0001 C CNN
	1    6600 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5600 6600 5500
Wire Wire Line
	5250 3350 5250 4100
Wire Wire Line
	5250 4100 6600 4100
Wire Wire Line
	6600 4100 6600 4700
Wire Wire Line
	5350 3350 5350 4000
Wire Wire Line
	5350 4000 6950 4000
Wire Wire Line
	6950 4000 6950 4700
$Comp
L power:GNDA #PWR0109
U 1 1 6140D888
P 5550 3500
F 0 "#PWR0109" H 5550 3250 50  0001 C CNN
F 1 "GNDA" H 5555 3327 50  0000 C CNN
F 2 "" H 5550 3500 50  0001 C CNN
F 3 "" H 5550 3500 50  0001 C CNN
	1    5550 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3350 5550 3500
$Comp
L Device:CP1 C1
U 1 1 6140F4EA
P 2200 950
F 0 "C1" V 2300 1000 50  0000 L CNN
F 1 "10MFD" V 2000 850 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 2200 950 50  0001 C CNN
F 3 "~" H 2200 950 50  0001 C CNN
	1    2200 950 
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 6140FFC0
P 1900 1250
F 0 "R1" H 1970 1296 50  0000 L CNN
F 1 "100K" H 1970 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1830 1250 50  0001 C CNN
F 3 "~" H 1900 1250 50  0001 C CNN
	1    1900 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 950  1900 950 
Wire Wire Line
	1900 950  1900 1100
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 614113F0
P 1400 950
F 0 "J1" H 1400 700 50  0000 C CNN
F 1 "2.54mm 2-pin" H 1318 1076 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1400 950 50  0001 C CNN
F 3 "~" H 1400 950 50  0001 C CNN
	1    1400 950 
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0110
U 1 1 614154A0
P 1900 1450
F 0 "#PWR0110" H 1900 1200 50  0001 C CNN
F 1 "GNDA" H 1905 1277 50  0000 C CNN
F 2 "" H 1900 1450 50  0001 C CNN
F 3 "" H 1900 1450 50  0001 C CNN
	1    1900 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0111
U 1 1 614159F0
P 1600 1450
F 0 "#PWR0111" H 1600 1200 50  0001 C CNN
F 1 "GNDA" H 1605 1277 50  0000 C CNN
F 2 "" H 1600 1450 50  0001 C CNN
F 3 "" H 1600 1450 50  0001 C CNN
	1    1600 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 950  1900 950 
Connection ~ 1900 950 
Wire Wire Line
	1900 1400 1900 1450
Wire Wire Line
	1600 1050 1600 1450
$Comp
L Device:CP1 C2
U 1 1 61471379
P 2200 2100
F 0 "C2" V 2300 2150 50  0000 L CNN
F 1 "10MFD" V 2000 2000 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 2200 2100 50  0001 C CNN
F 3 "~" H 2200 2100 50  0001 C CNN
	1    2200 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 614714BD
P 1900 2400
F 0 "R2" H 1970 2446 50  0000 L CNN
F 1 "100K" H 1970 2355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1830 2400 50  0001 C CNN
F 3 "~" H 1900 2400 50  0001 C CNN
	1    1900 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2100 1900 2100
Wire Wire Line
	1900 2100 1900 2250
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 614714C9
P 1400 2100
F 0 "J2" H 1400 1850 50  0000 C CNN
F 1 "2.54mm 2-pin" H 1318 2226 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1400 2100 50  0001 C CNN
F 3 "~" H 1400 2100 50  0001 C CNN
	1    1400 2100
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0112
U 1 1 614714D3
P 1900 2600
F 0 "#PWR0112" H 1900 2350 50  0001 C CNN
F 1 "GNDA" H 1905 2427 50  0000 C CNN
F 2 "" H 1900 2600 50  0001 C CNN
F 3 "" H 1900 2600 50  0001 C CNN
	1    1900 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0113
U 1 1 614714DD
P 1600 2600
F 0 "#PWR0113" H 1600 2350 50  0001 C CNN
F 1 "GNDA" H 1605 2427 50  0000 C CNN
F 2 "" H 1600 2600 50  0001 C CNN
F 3 "" H 1600 2600 50  0001 C CNN
	1    1600 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2100 1900 2100
Connection ~ 1900 2100
Wire Wire Line
	1900 2550 1900 2600
Wire Wire Line
	1600 2200 1600 2600
$Comp
L Device:CP1 C3
U 1 1 614784C1
P 2200 3250
F 0 "C3" V 2300 3300 50  0000 L CNN
F 1 "10MFD" V 2000 3150 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 2200 3250 50  0001 C CNN
F 3 "~" H 2200 3250 50  0001 C CNN
	1    2200 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 61478745
P 1900 3550
F 0 "R3" H 1970 3596 50  0000 L CNN
F 1 "100K" H 1970 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1830 3550 50  0001 C CNN
F 3 "~" H 1900 3550 50  0001 C CNN
	1    1900 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 3250 1900 3250
Wire Wire Line
	1900 3250 1900 3400
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 61478751
P 1400 3250
F 0 "J3" H 1400 3000 50  0000 C CNN
F 1 "2.54mm 2-pin" H 1318 3376 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1400 3250 50  0001 C CNN
F 3 "~" H 1400 3250 50  0001 C CNN
	1    1400 3250
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0114
U 1 1 6147875B
P 1900 3750
F 0 "#PWR0114" H 1900 3500 50  0001 C CNN
F 1 "GNDA" H 1905 3577 50  0000 C CNN
F 2 "" H 1900 3750 50  0001 C CNN
F 3 "" H 1900 3750 50  0001 C CNN
	1    1900 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0115
U 1 1 61478765
P 1600 3750
F 0 "#PWR0115" H 1600 3500 50  0001 C CNN
F 1 "GNDA" H 1605 3577 50  0000 C CNN
F 2 "" H 1600 3750 50  0001 C CNN
F 3 "" H 1600 3750 50  0001 C CNN
	1    1600 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 3250 1900 3250
Connection ~ 1900 3250
Wire Wire Line
	1900 3700 1900 3750
Wire Wire Line
	1600 3350 1600 3750
$Comp
L Device:CP1 C4
U 1 1 61478773
P 2200 4400
F 0 "C4" V 2300 4450 50  0000 L CNN
F 1 "10MFD" V 2000 4300 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 2200 4400 50  0001 C CNN
F 3 "~" H 2200 4400 50  0001 C CNN
	1    2200 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 6147877D
P 1900 4700
F 0 "R4" H 1970 4746 50  0000 L CNN
F 1 "100K" H 1970 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1830 4700 50  0001 C CNN
F 3 "~" H 1900 4700 50  0001 C CNN
	1    1900 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 4400 1900 4400
Wire Wire Line
	1900 4400 1900 4550
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 61478789
P 1400 4400
F 0 "J4" H 1400 4150 50  0000 C CNN
F 1 "2.54mm 2-pin" H 1318 4526 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1400 4400 50  0001 C CNN
F 3 "~" H 1400 4400 50  0001 C CNN
	1    1400 4400
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0116
U 1 1 61478793
P 1900 4900
F 0 "#PWR0116" H 1900 4650 50  0001 C CNN
F 1 "GNDA" H 1905 4727 50  0000 C CNN
F 2 "" H 1900 4900 50  0001 C CNN
F 3 "" H 1900 4900 50  0001 C CNN
	1    1900 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0117
U 1 1 6147879D
P 1600 4900
F 0 "#PWR0117" H 1600 4650 50  0001 C CNN
F 1 "GNDA" H 1605 4727 50  0000 C CNN
F 2 "" H 1600 4900 50  0001 C CNN
F 3 "" H 1600 4900 50  0001 C CNN
	1    1600 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 4400 1900 4400
Connection ~ 1900 4400
Wire Wire Line
	1900 4850 1900 4900
Wire Wire Line
	1600 4500 1600 4900
$Comp
L Device:CP1 C5
U 1 1 61484E6D
P 2200 5550
F 0 "C5" V 2300 5600 50  0000 L CNN
F 1 "10MFD" V 2000 5450 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 2200 5550 50  0001 C CNN
F 3 "~" H 2200 5550 50  0001 C CNN
	1    2200 5550
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 61485199
P 1900 5850
F 0 "R5" H 1970 5896 50  0000 L CNN
F 1 "100K" H 1970 5805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1830 5850 50  0001 C CNN
F 3 "~" H 1900 5850 50  0001 C CNN
	1    1900 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5550 1900 5550
Wire Wire Line
	1900 5550 1900 5700
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 614851A5
P 1400 5550
F 0 "J5" H 1400 5300 50  0000 C CNN
F 1 "2.54mm 2-pin" H 1318 5676 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1400 5550 50  0001 C CNN
F 3 "~" H 1400 5550 50  0001 C CNN
	1    1400 5550
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0118
U 1 1 614851AF
P 1900 6050
F 0 "#PWR0118" H 1900 5800 50  0001 C CNN
F 1 "GNDA" H 1905 5877 50  0000 C CNN
F 2 "" H 1900 6050 50  0001 C CNN
F 3 "" H 1900 6050 50  0001 C CNN
	1    1900 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0119
U 1 1 614851B9
P 1600 6050
F 0 "#PWR0119" H 1600 5800 50  0001 C CNN
F 1 "GNDA" H 1605 5877 50  0000 C CNN
F 2 "" H 1600 6050 50  0001 C CNN
F 3 "" H 1600 6050 50  0001 C CNN
	1    1600 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 5550 1900 5550
Connection ~ 1900 5550
Wire Wire Line
	1900 6000 1900 6050
Wire Wire Line
	1600 5650 1600 6050
$Comp
L Device:CP1 C6
U 1 1 614851C7
P 2200 6700
F 0 "C6" V 2300 6750 50  0000 L CNN
F 1 "10MFD" V 2000 6600 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 2200 6700 50  0001 C CNN
F 3 "~" H 2200 6700 50  0001 C CNN
	1    2200 6700
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 614851D1
P 1900 7000
F 0 "R6" H 1970 7046 50  0000 L CNN
F 1 "100K" H 1970 6955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1830 7000 50  0001 C CNN
F 3 "~" H 1900 7000 50  0001 C CNN
	1    1900 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 6700 1900 6700
Wire Wire Line
	1900 6700 1900 6850
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 614851DD
P 1400 6700
F 0 "J6" H 1400 6450 50  0000 C CNN
F 1 "2.54mm 2-pin" H 1318 6826 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1400 6700 50  0001 C CNN
F 3 "~" H 1400 6700 50  0001 C CNN
	1    1400 6700
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0120
U 1 1 614851E7
P 1900 7200
F 0 "#PWR0120" H 1900 6950 50  0001 C CNN
F 1 "GNDA" H 1905 7027 50  0000 C CNN
F 2 "" H 1900 7200 50  0001 C CNN
F 3 "" H 1900 7200 50  0001 C CNN
	1    1900 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0121
U 1 1 614851F1
P 1600 7200
F 0 "#PWR0121" H 1600 6950 50  0001 C CNN
F 1 "GNDA" H 1605 7027 50  0000 C CNN
F 2 "" H 1600 7200 50  0001 C CNN
F 3 "" H 1600 7200 50  0001 C CNN
	1    1600 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 6700 1900 6700
Connection ~ 1900 6700
Wire Wire Line
	1900 7150 1900 7200
Wire Wire Line
	1600 6800 1600 7200
Wire Wire Line
	3400 2200 3200 2200
Wire Wire Line
	3200 2200 3200 950 
Wire Wire Line
	3200 950  2350 950 
Wire Wire Line
	2350 2100 3050 2100
Wire Wire Line
	3050 2100 3050 2300
Wire Wire Line
	3050 2300 3400 2300
Wire Wire Line
	2350 6700 3200 6700
Wire Wire Line
	3200 6700 3200 2700
Wire Wire Line
	3200 2700 3400 2700
Wire Wire Line
	2350 5550 3050 5550
Wire Wire Line
	3050 5550 3050 2600
Wire Wire Line
	3050 2600 3400 2600
Wire Wire Line
	2350 4400 2900 4400
Wire Wire Line
	2900 4400 2900 2500
Wire Wire Line
	2900 2500 3400 2500
Wire Wire Line
	2350 3250 2750 3250
Wire Wire Line
	2750 3250 2750 2400
Wire Wire Line
	2750 2400 3400 2400
$Comp
L Device:CP1 C18
U 1 1 614BB605
P 7850 950
F 0 "C18" V 7700 1050 50  0000 L CNN
F 1 "10MFD" V 8050 800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7850 950 50  0001 C CNN
F 3 "~" H 7850 950 50  0001 C CNN
	1    7850 950 
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R11
U 1 1 614BD71D
P 8150 1250
F 0 "R11" H 7850 1300 50  0000 L CNN
F 1 "100K" H 7850 1200 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8080 1250 50  0001 C CNN
F 3 "~" H 8150 1250 50  0001 C CNN
	1    8150 1250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 614BDE8D
P 8650 950
F 0 "J7" H 8650 700 50  0000 C CNN
F 1 "2.54mm 2-pin" H 8568 1076 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8650 950 50  0001 C CNN
F 3 "~" H 8650 950 50  0001 C CNN
	1    8650 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 950  8150 950 
Wire Wire Line
	8150 1100 8150 950 
Connection ~ 8150 950 
Wire Wire Line
	8150 950  8000 950 
$Comp
L power:GNDA #PWR0122
U 1 1 61510F5D
P 8150 1450
F 0 "#PWR0122" H 8150 1200 50  0001 C CNN
F 1 "GNDA" H 8155 1277 50  0000 C CNN
F 2 "" H 8150 1450 50  0001 C CNN
F 3 "" H 8150 1450 50  0001 C CNN
	1    8150 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0123
U 1 1 61511506
P 8450 1450
F 0 "#PWR0123" H 8450 1200 50  0001 C CNN
F 1 "GNDA" H 8455 1277 50  0000 C CNN
F 2 "" H 8450 1450 50  0001 C CNN
F 3 "" H 8450 1450 50  0001 C CNN
	1    8450 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1400 8150 1450
Wire Wire Line
	8450 1050 8450 1450
$Comp
L Device:CP1 C19
U 1 1 6151B4AD
P 7850 2100
F 0 "C19" V 7700 2200 50  0000 L CNN
F 1 "10MFD" V 8050 1950 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7850 2100 50  0001 C CNN
F 3 "~" H 7850 2100 50  0001 C CNN
	1    7850 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R12
U 1 1 6151B895
P 8150 2400
F 0 "R12" H 7850 2450 50  0000 L CNN
F 1 "100K" H 7850 2350 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8080 2400 50  0001 C CNN
F 3 "~" H 8150 2400 50  0001 C CNN
	1    8150 2400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 6151B89F
P 8650 2100
F 0 "J8" H 8650 1850 50  0000 C CNN
F 1 "2.54mm 2-pin" H 8568 2226 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8650 2100 50  0001 C CNN
F 3 "~" H 8650 2100 50  0001 C CNN
	1    8650 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 2100 8150 2100
Wire Wire Line
	8150 2250 8150 2100
Connection ~ 8150 2100
Wire Wire Line
	8150 2100 8000 2100
$Comp
L power:GNDA #PWR0124
U 1 1 6151B8AD
P 8150 2600
F 0 "#PWR0124" H 8150 2350 50  0001 C CNN
F 1 "GNDA" H 8155 2427 50  0000 C CNN
F 2 "" H 8150 2600 50  0001 C CNN
F 3 "" H 8150 2600 50  0001 C CNN
	1    8150 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0125
U 1 1 6151B8B7
P 8450 2600
F 0 "#PWR0125" H 8450 2350 50  0001 C CNN
F 1 "GNDA" H 8455 2427 50  0000 C CNN
F 2 "" H 8450 2600 50  0001 C CNN
F 3 "" H 8450 2600 50  0001 C CNN
	1    8450 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2550 8150 2600
Wire Wire Line
	8450 2200 8450 2600
$Comp
L Device:CP1 C20
U 1 1 615307EC
P 7850 3250
F 0 "C20" V 7700 3350 50  0000 L CNN
F 1 "10MFD" V 8050 3100 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7850 3250 50  0001 C CNN
F 3 "~" H 7850 3250 50  0001 C CNN
	1    7850 3250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R13
U 1 1 61530C28
P 8150 3550
F 0 "R13" H 7850 3600 50  0000 L CNN
F 1 "100K" H 7850 3500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8080 3550 50  0001 C CNN
F 3 "~" H 8150 3550 50  0001 C CNN
	1    8150 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 61530C32
P 8650 3250
F 0 "J9" H 8650 3000 50  0000 C CNN
F 1 "2.54mm 2-pin" H 8568 3376 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8650 3250 50  0001 C CNN
F 3 "~" H 8650 3250 50  0001 C CNN
	1    8650 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3250 8150 3250
Wire Wire Line
	8150 3400 8150 3250
Connection ~ 8150 3250
Wire Wire Line
	8150 3250 8000 3250
$Comp
L power:GNDA #PWR0126
U 1 1 61530C40
P 8150 3750
F 0 "#PWR0126" H 8150 3500 50  0001 C CNN
F 1 "GNDA" H 8155 3577 50  0000 C CNN
F 2 "" H 8150 3750 50  0001 C CNN
F 3 "" H 8150 3750 50  0001 C CNN
	1    8150 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0127
U 1 1 61530C4A
P 8450 3750
F 0 "#PWR0127" H 8450 3500 50  0001 C CNN
F 1 "GNDA" H 8455 3577 50  0000 C CNN
F 2 "" H 8450 3750 50  0001 C CNN
F 3 "" H 8450 3750 50  0001 C CNN
	1    8450 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 3700 8150 3750
Wire Wire Line
	8450 3350 8450 3750
$Comp
L Device:CP1 C21
U 1 1 61530C56
P 7850 4400
F 0 "C21" V 7700 4500 50  0000 L CNN
F 1 "10MFD" V 8050 4250 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7850 4400 50  0001 C CNN
F 3 "~" H 7850 4400 50  0001 C CNN
	1    7850 4400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R14
U 1 1 61530C60
P 8150 4700
F 0 "R14" H 7850 4750 50  0000 L CNN
F 1 "100K" H 7850 4650 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8080 4700 50  0001 C CNN
F 3 "~" H 8150 4700 50  0001 C CNN
	1    8150 4700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J10
U 1 1 61530C6A
P 8650 4400
F 0 "J10" H 8650 4150 50  0000 C CNN
F 1 "2.54mm 2-pin" H 8568 4526 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8650 4400 50  0001 C CNN
F 3 "~" H 8650 4400 50  0001 C CNN
	1    8650 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 4400 8150 4400
Wire Wire Line
	8150 4550 8150 4400
Connection ~ 8150 4400
Wire Wire Line
	8150 4400 8000 4400
$Comp
L power:GNDA #PWR0128
U 1 1 61530C78
P 8150 4900
F 0 "#PWR0128" H 8150 4650 50  0001 C CNN
F 1 "GNDA" H 8155 4727 50  0000 C CNN
F 2 "" H 8150 4900 50  0001 C CNN
F 3 "" H 8150 4900 50  0001 C CNN
	1    8150 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0129
U 1 1 61530C82
P 8450 4900
F 0 "#PWR0129" H 8450 4650 50  0001 C CNN
F 1 "GNDA" H 8455 4727 50  0000 C CNN
F 2 "" H 8450 4900 50  0001 C CNN
F 3 "" H 8450 4900 50  0001 C CNN
	1    8450 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4850 8150 4900
Wire Wire Line
	8450 4500 8450 4900
$Comp
L Device:CP1 C22
U 1 1 61541D69
P 7850 5550
F 0 "C22" V 7700 5650 50  0000 L CNN
F 1 "10MFD" V 8050 5400 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7850 5550 50  0001 C CNN
F 3 "~" H 7850 5550 50  0001 C CNN
	1    7850 5550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R15
U 1 1 6154228D
P 8150 5850
F 0 "R15" H 7850 5900 50  0000 L CNN
F 1 "100K" H 7850 5800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8080 5850 50  0001 C CNN
F 3 "~" H 8150 5850 50  0001 C CNN
	1    8150 5850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J11
U 1 1 61542297
P 8650 5550
F 0 "J11" H 8650 5300 50  0000 C CNN
F 1 "2.54mm 2-pin" H 8568 5676 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8650 5550 50  0001 C CNN
F 3 "~" H 8650 5550 50  0001 C CNN
	1    8650 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 5550 8150 5550
Wire Wire Line
	8150 5700 8150 5550
Connection ~ 8150 5550
Wire Wire Line
	8150 5550 8000 5550
$Comp
L power:GNDA #PWR0130
U 1 1 615422A5
P 8150 6050
F 0 "#PWR0130" H 8150 5800 50  0001 C CNN
F 1 "GNDA" H 8155 5877 50  0000 C CNN
F 2 "" H 8150 6050 50  0001 C CNN
F 3 "" H 8150 6050 50  0001 C CNN
	1    8150 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0131
U 1 1 615422AF
P 8450 6050
F 0 "#PWR0131" H 8450 5800 50  0001 C CNN
F 1 "GNDA" H 8455 5877 50  0000 C CNN
F 2 "" H 8450 6050 50  0001 C CNN
F 3 "" H 8450 6050 50  0001 C CNN
	1    8450 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 6000 8150 6050
Wire Wire Line
	8450 5650 8450 6050
$Comp
L Device:CP1 C23
U 1 1 615422BB
P 7850 6700
F 0 "C23" V 7700 6800 50  0000 L CNN
F 1 "10MFD" V 8050 6550 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7850 6700 50  0001 C CNN
F 3 "~" H 7850 6700 50  0001 C CNN
	1    7850 6700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R16
U 1 1 615422C5
P 8150 7000
F 0 "R16" H 7850 7050 50  0000 L CNN
F 1 "100K" H 7850 6950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8080 7000 50  0001 C CNN
F 3 "~" H 8150 7000 50  0001 C CNN
	1    8150 7000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J12
U 1 1 615422CF
P 8650 6700
F 0 "J12" H 8650 6450 50  0000 C CNN
F 1 "2.54mm 2-pin" H 8568 6826 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8650 6700 50  0001 C CNN
F 3 "~" H 8650 6700 50  0001 C CNN
	1    8650 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 6700 8150 6700
Wire Wire Line
	8150 6850 8150 6700
Connection ~ 8150 6700
Wire Wire Line
	8150 6700 8000 6700
$Comp
L power:GNDA #PWR0132
U 1 1 615422DD
P 8150 7200
F 0 "#PWR0132" H 8150 6950 50  0001 C CNN
F 1 "GNDA" H 8155 7027 50  0000 C CNN
F 2 "" H 8150 7200 50  0001 C CNN
F 3 "" H 8150 7200 50  0001 C CNN
	1    8150 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0133
U 1 1 615422E7
P 8450 7200
F 0 "#PWR0133" H 8450 6950 50  0001 C CNN
F 1 "GNDA" H 8455 7027 50  0000 C CNN
F 2 "" H 8450 7200 50  0001 C CNN
F 3 "" H 8450 7200 50  0001 C CNN
	1    8450 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 7150 8150 7200
Wire Wire Line
	8450 6800 8450 7200
Wire Wire Line
	5950 2700 7150 2700
Wire Wire Line
	7150 2700 7150 6700
Wire Wire Line
	5950 2600 7300 2600
Wire Wire Line
	7300 2600 7300 5550
Wire Wire Line
	5950 2500 7450 2500
Wire Wire Line
	7450 2500 7450 4400
Wire Wire Line
	5950 2400 7600 2400
Wire Wire Line
	7600 2400 7600 3250
Wire Wire Line
	5950 2300 7600 2300
Wire Wire Line
	7600 2300 7600 2100
Wire Wire Line
	5950 2200 7450 2200
Wire Wire Line
	7450 2200 7450 950 
Wire Wire Line
	7700 950  7450 950 
Wire Wire Line
	7600 2100 7700 2100
Wire Wire Line
	7600 3250 7700 3250
Wire Wire Line
	7700 4400 7450 4400
Wire Wire Line
	7300 5550 7700 5550
Wire Wire Line
	7700 6700 7150 6700
$Comp
L power:+8V #PWR0134
U 1 1 61622314
P 5000 1450
F 0 "#PWR0134" H 5000 1300 50  0001 C CNN
F 1 "+8V" H 5015 1623 50  0000 C CNN
F 2 "" H 5000 1450 50  0001 C CNN
F 3 "" H 5000 1450 50  0001 C CNN
	1    5000 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1300 4100 1800
Text Label 3800 1300 2    50   ~ 0
SDA-HV
Text Label 3800 1400 2    50   ~ 0
SCL-HV
Wire Wire Line
	4000 1400 4000 1800
Wire Wire Line
	3800 1300 4100 1300
Wire Wire Line
	3800 1400 4000 1400
$Comp
L Device:CP1 C24
U 1 1 6142899E
P 10600 1700
F 0 "C24" H 10715 1746 50  0000 L CNN
F 1 "100MFD" H 10715 1655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10600 1700 50  0001 C CNN
F 3 "~" H 10600 1700 50  0001 C CNN
	1    10600 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C25
U 1 1 61428DF7
P 11850 1700
F 0 "C25" H 11965 1746 50  0000 L CNN
F 1 "22MFD" H 11965 1655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 11850 1700 50  0001 C CNN
F 3 "~" H 11850 1700 50  0001 C CNN
	1    11850 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C26
U 1 1 61429A02
P 12500 1700
F 0 "C26" H 12615 1746 50  0000 L CNN
F 1 "0.1MFD" H 12615 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 12538 1550 50  0001 C CNN
F 3 "~" H 12500 1700 50  0001 C CNN
	1    12500 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0135
U 1 1 6142ADC7
P 10600 1950
F 0 "#PWR0135" H 10600 1700 50  0001 C CNN
F 1 "GNDA" H 10605 1777 50  0000 C CNN
F 2 "" H 10600 1950 50  0001 C CNN
F 3 "" H 10600 1950 50  0001 C CNN
	1    10600 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0136
U 1 1 6142B59D
P 11850 1950
F 0 "#PWR0136" H 11850 1700 50  0001 C CNN
F 1 "GNDA" H 11855 1777 50  0000 C CNN
F 2 "" H 11850 1950 50  0001 C CNN
F 3 "" H 11850 1950 50  0001 C CNN
	1    11850 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0137
U 1 1 6142BC39
P 12500 1950
F 0 "#PWR0137" H 12500 1700 50  0001 C CNN
F 1 "GNDA" H 12505 1777 50  0000 C CNN
F 2 "" H 12500 1950 50  0001 C CNN
F 3 "" H 12500 1950 50  0001 C CNN
	1    12500 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 1400 10600 1400
Wire Wire Line
	10600 1400 10600 1550
$Comp
L power:GNDA #PWR0138
U 1 1 61433EAF
P 11250 1950
F 0 "#PWR0138" H 11250 1700 50  0001 C CNN
F 1 "GNDA" H 11255 1777 50  0000 C CNN
F 2 "" H 11250 1950 50  0001 C CNN
F 3 "" H 11250 1950 50  0001 C CNN
	1    11250 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+8V #PWR0139
U 1 1 6143534E
P 12500 1250
F 0 "#PWR0139" H 12500 1100 50  0001 C CNN
F 1 "+8V" H 12515 1423 50  0000 C CNN
F 2 "" H 12500 1250 50  0001 C CNN
F 3 "" H 12500 1250 50  0001 C CNN
	1    12500 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 1400 11850 1400
Wire Wire Line
	12500 1400 12500 1250
Wire Wire Line
	11850 1550 11850 1400
Connection ~ 11850 1400
Wire Wire Line
	11850 1400 12500 1400
Wire Wire Line
	12500 1400 12500 1550
Connection ~ 12500 1400
Wire Wire Line
	10600 1850 10600 1950
Wire Wire Line
	11250 1700 11250 1950
Wire Wire Line
	11850 1850 11850 1950
Wire Wire Line
	12500 1850 12500 1950
$Comp
L Connector_Generic:Conn_01x02 J13
U 1 1 61469AD8
P 9950 1400
F 0 "J13" H 9950 1150 50  0000 C CNN
F 1 "2.54mm 2-pin" H 9950 1550 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MCV_1,5_2-G-3.5_1x02_P3.50mm_Vertical" H 9950 1400 50  0001 C CNN
F 3 "~" H 9950 1400 50  0001 C CNN
	1    9950 1400
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0140
U 1 1 6146A37D
P 10150 1950
F 0 "#PWR0140" H 10150 1700 50  0001 C CNN
F 1 "GNDA" H 10155 1777 50  0000 C CNN
F 2 "" H 10150 1950 50  0001 C CNN
F 3 "" H 10150 1950 50  0001 C CNN
	1    10150 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 1400 10600 1400
Connection ~ 10600 1400
Wire Wire Line
	10150 1500 10150 1950
$Comp
L Device:R R17
U 1 1 614DBBE5
P 10550 3100
F 0 "R17" H 10620 3146 50  0000 L CNN
F 1 "10K" H 10620 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 10480 3100 50  0001 C CNN
F 3 "~" H 10550 3100 50  0001 C CNN
	1    10550 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0141
U 1 1 614DD3B4
P 11950 2800
F 0 "#PWR0141" H 11950 2650 50  0001 C CNN
F 1 "+5V" H 11965 2973 50  0000 C CNN
F 2 "" H 11950 2800 50  0001 C CNN
F 3 "" H 11950 2800 50  0001 C CNN
	1    11950 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0142
U 1 1 614DD631
P 11250 2800
F 0 "#PWR0142" H 11250 2650 50  0001 C CNN
F 1 "+5V" H 11265 2973 50  0000 C CNN
F 2 "" H 11250 2800 50  0001 C CNN
F 3 "" H 11250 2800 50  0001 C CNN
	1    11250 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	11050 3350 10550 3350
Wire Wire Line
	10550 3350 10550 3250
Wire Wire Line
	10550 2800 10550 2950
Wire Wire Line
	11250 2800 11250 3050
$Comp
L Device:R R19
U 1 1 614F681E
P 11950 3100
F 0 "R19" H 12020 3146 50  0000 L CNN
F 1 "10K" H 12020 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 11880 3100 50  0001 C CNN
F 3 "~" H 11950 3100 50  0001 C CNN
	1    11950 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	11450 3350 11950 3350
Wire Wire Line
	11950 3350 11950 3250
Wire Wire Line
	11950 2800 11950 2950
$Comp
L power:+8V #PWR0143
U 1 1 615091B4
P 10550 2800
F 0 "#PWR0143" H 10550 2650 50  0001 C CNN
F 1 "+8V" H 10565 2973 50  0000 C CNN
F 2 "" H 10550 2800 50  0001 C CNN
F 3 "" H 10550 2800 50  0001 C CNN
	1    10550 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	12300 3350 11950 3350
Connection ~ 11950 3350
Wire Wire Line
	10200 3350 10550 3350
Connection ~ 10550 3350
Text Label 10200 3350 2    50   ~ 0
SCL-HV
$Comp
L Device:R R18
U 1 1 6152EAA7
P 10550 4400
F 0 "R18" H 10620 4446 50  0000 L CNN
F 1 "10K" H 10620 4355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 10480 4400 50  0001 C CNN
F 3 "~" H 10550 4400 50  0001 C CNN
	1    10550 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0144
U 1 1 6152EAB1
P 11950 4100
F 0 "#PWR0144" H 11950 3950 50  0001 C CNN
F 1 "+5V" H 11965 4273 50  0000 C CNN
F 2 "" H 11950 4100 50  0001 C CNN
F 3 "" H 11950 4100 50  0001 C CNN
	1    11950 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0145
U 1 1 6152EABB
P 11250 4100
F 0 "#PWR0145" H 11250 3950 50  0001 C CNN
F 1 "+5V" H 11265 4273 50  0000 C CNN
F 2 "" H 11250 4100 50  0001 C CNN
F 3 "" H 11250 4100 50  0001 C CNN
	1    11250 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	11050 4650 10550 4650
Wire Wire Line
	10550 4650 10550 4550
Wire Wire Line
	10550 4100 10550 4250
Wire Wire Line
	11250 4100 11250 4350
$Comp
L Device:R R20
U 1 1 6152EAC9
P 11950 4400
F 0 "R20" H 12020 4446 50  0000 L CNN
F 1 "10K" H 12020 4355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 11880 4400 50  0001 C CNN
F 3 "~" H 11950 4400 50  0001 C CNN
	1    11950 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	11450 4650 11950 4650
Wire Wire Line
	11950 4650 11950 4550
Wire Wire Line
	11950 4100 11950 4250
$Comp
L power:+8V #PWR0146
U 1 1 6152EAD6
P 10550 4100
F 0 "#PWR0146" H 10550 3950 50  0001 C CNN
F 1 "+8V" H 10565 4273 50  0000 C CNN
F 2 "" H 10550 4100 50  0001 C CNN
F 3 "" H 10550 4100 50  0001 C CNN
	1    10550 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	12300 4650 11950 4650
Connection ~ 11950 4650
Wire Wire Line
	10200 4650 10550 4650
Connection ~ 10550 4650
Text Label 10200 4650 2    50   ~ 0
SDA-HV
Text Notes 9800 1150 0    50   ~ 0
12V DC IN
Text Notes 800  1050 0    50   ~ 0
FRONT LEFT
Text Notes 800  2200 0    50   ~ 0
REAR LEFT
Text Notes 800  3350 0    50   ~ 0
CENTER
Text Notes 800  4500 0    50   ~ 0
SUBWOOFER
Text Notes 800  5650 0    50   ~ 0
REAR RIGHT
Text Notes 800  6800 0    50   ~ 0
FRONT RIGHT
Text Notes 8800 1050 0    50   ~ 0
FRONT LEFT
Text Notes 8800 2200 0    50   ~ 0
REAR LEFT
Text Notes 8800 3350 0    50   ~ 0
CENTER
Text Notes 8800 4500 0    50   ~ 0
SUBWOOFER
Text Notes 8800 5650 0    50   ~ 0
REAR RIGHT
Text Notes 8800 6800 0    50   ~ 0
FRONT RIGHT
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61869A2F
P 10600 1250
F 0 "#FLG0101" H 10600 1325 50  0001 C CNN
F 1 "PWR_FLAG" H 10600 1423 50  0000 C CNN
F 2 "" H 10600 1250 50  0001 C CNN
F 3 "~" H 10600 1250 50  0001 C CNN
	1    10600 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 1250 10600 1400
Wire Wire Line
	5000 1450 5000 1800
$Comp
L 6ch-sound-fx-proc:PT2322 U1
U 1 1 619567A3
P 4000 2350
F 0 "U1" H 5700 2950 50  0000 C CNN
F 1 "PT2322" H 5700 2850 50  0000 C CNN
F 2 "6ch-sound-fx-proc:SSOP-28_5.3x10.2mm_P0.65mm" H 4000 2350 50  0001 C CNN
F 3 "" H 4000 2350 50  0001 C CNN
	1    4000 2350
	1    0    0    -1  
$EndComp
Text GLabel 12300 3350 2    50   Input ~ 0
SCL
Text GLabel 12300 4650 2    50   BiDi ~ 0
SDA
$Comp
L power:GNDA #PWR0147
U 1 1 615691B6
P 5200 7200
F 0 "#PWR0147" H 5200 6950 50  0001 C CNN
F 1 "GNDA" H 5205 7027 50  0000 C CNN
F 2 "" H 5200 7200 50  0001 C CNN
F 3 "" H 5200 7200 50  0001 C CNN
	1    5200 7200
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 6156B072
P 5200 6700
F 0 "#FLG0102" H 5200 6775 50  0001 C CNN
F 1 "PWR_FLAG" H 5200 6873 50  0000 C CNN
F 2 "" H 5200 6700 50  0001 C CNN
F 3 "~" H 5200 6700 50  0001 C CNN
	1    5200 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 6700 5200 7200
$Sheet
S 10400 5600 2150 1000
U 615CA678
F0 "arduino-intf" 50
F1 "arduino-intf.sch" 50
$EndSheet
$Comp
L Transistor_FET:2N7002 Q1
U 1 1 61426FE2
P 11250 3250
F 0 "Q1" V 11499 3250 50  0000 C CNN
F 1 "2N7002" V 11590 3250 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 11450 3175 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 11250 3250 50  0001 L CNN
	1    11250 3250
	0    -1   1    0   
$EndComp
$Comp
L Transistor_FET:2N7002 Q2
U 1 1 61431C62
P 11250 4550
F 0 "Q2" V 11499 4550 50  0000 C CNN
F 1 "2N7002" V 11590 4550 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 11450 4475 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 11250 4550 50  0001 L CNN
	1    11250 4550
	0    -1   1    0   
$EndComp
$Comp
L Regulator_Linear:LM78M05_TO252 U2
U 1 1 6144D133
P 11250 1400
F 0 "U2" H 11250 1642 50  0000 C CNN
F 1 "LM78M08" H 11250 1551 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 11250 1625 50  0001 C CIN
F 3 "https://www.onsemi.com/pub/Collateral/MC78M00-D.PDF" H 11250 1350 50  0001 C CNN
	1    11250 1400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
