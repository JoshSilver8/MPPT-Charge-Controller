EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "MTTP Charge Controller"
Date ""
Rev ""
Comp "Walla Walla University"
Comment1 "Rob Frohne"
Comment2 "ENGR 460"
Comment3 "Joshua Silver"
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5E9E173E
P 3050 5600
F 0 "A1" H 3050 6150 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" V 3050 5600 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 3050 5600 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 3050 5600 50  0001 C CNN
	1    3050 5600
	1    0    0    -1  
$EndComp
Text Label 3250 4200 1    50   ~ 0
5V
Text Label 3150 4300 1    50   ~ 0
3.3V
Wire Wire Line
	3150 4300 3150 4450
Wire Wire Line
	3250 4200 3250 4450
$Comp
L Device:C_Small C4
U 1 1 5E9E89EE
P 3350 4450
F 0 "C4" V 3250 4450 50  0000 C CNN
F 1 ".1uF" V 3450 4450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3350 4450 50  0001 C CNN
F 3 "~" H 3350 4450 50  0001 C CNN
	1    3350 4450
	0    1    1    0   
$EndComp
Connection ~ 3250 4450
Wire Wire Line
	3250 4450 3250 4600
$Comp
L power:GND #PWR0101
U 1 1 5E9EAB0D
P 3450 4450
F 0 "#PWR0101" H 3450 4200 50  0001 C CNN
F 1 "GND" H 3450 4300 50  0001 C CNN
F 2 "" H 3450 4450 50  0001 C CNN
F 3 "" H 3450 4450 50  0001 C CNN
	1    3450 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5E9EAF0A
P 3050 4450
F 0 "C3" V 2950 4450 50  0000 C CNN
F 1 ".1uF" V 3150 4450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3050 4450 50  0001 C CNN
F 3 "~" H 3050 4450 50  0001 C CNN
	1    3050 4450
	0    1    1    0   
$EndComp
Connection ~ 3150 4450
Wire Wire Line
	3150 4450 3150 4600
$Comp
L power:GND #PWR0103
U 1 1 5E9EBC22
P 4100 5850
F 0 "#PWR0103" H 4100 5600 50  0001 C CNN
F 1 "GND" H 4100 5700 50  0001 C CNN
F 2 "" H 4100 5850 50  0001 C CNN
F 3 "" H 4100 5850 50  0001 C CNN
	1    4100 5850
	-1   0    0    -1  
$EndComp
NoConn ~ 3550 5000
NoConn ~ 3550 5100
$Comp
L power:GND #PWR0104
U 1 1 5EA0F46A
P 1100 6850
F 0 "#PWR0104" H 1100 6600 50  0001 C CNN
F 1 "GND" H 1100 6700 50  0001 C CNN
F 2 "" H 1100 6850 50  0001 C CNN
F 3 "" H 1100 6850 50  0001 C CNN
	1    1100 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F1
U 1 1 5ED46F29
P 1750 2150
F 0 "F1" V 1650 2150 50  0000 C CNN
F 1 "10A" V 1750 2150 50  0000 C CNN
F 2 "Fuse:Fuseholder_Cylinder-5x20mm_Stelvio-Kontek_PTF78_Horizontal_Open" V 1680 2150 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/keystone-electronics/4628/36-4628-ND/2137316" H 1750 2150 50  0001 C CNN
	1    1750 2150
	0    1    1    0   
$EndComp
Text Label 2250 2550 2    50   ~ 0
VinSense
Text Label 2750 4550 2    50   ~ 0
VIN
$Comp
L Device:C C2
U 1 1 5ED5FBE7
P 2850 2700
F 0 "C2" H 2735 2654 50  0000 R CNN
F 1 ".1uF" H 2735 2745 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2888 2550 50  0001 C CNN
F 3 "~" H 2850 2700 50  0001 C CNN
	1    2850 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	1350 2150 1350 2200
$Comp
L Device:R R5
U 1 1 5ED6243E
P 2450 2350
F 0 "R5" H 2520 2396 50  0000 L CNN
F 1 "10k" H 2520 2305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2380 2350 50  0001 C CNN
F 3 "~" H 2450 2350 50  0001 C CNN
	1    2450 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5ED62DC0
P 2450 2700
F 0 "R6" H 2520 2746 50  0000 L CNN
F 1 "2.2k" H 2520 2655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2380 2700 50  0001 C CNN
F 3 "~" H 2450 2700 50  0001 C CNN
	1    2450 2700
	1    0    0    -1  
$EndComp
Connection ~ 2450 2550
Wire Wire Line
	2450 2550 2850 2550
Wire Wire Line
	2450 2850 2450 2900
Wire Wire Line
	2850 2900 2850 2850
Wire Wire Line
	2450 2150 2450 2200
Wire Wire Line
	2450 2500 2450 2550
Connection ~ 2450 2150
Wire Wire Line
	2450 2550 2250 2550
$Comp
L Device:C C1
U 1 1 5ED6642C
P 1350 2350
F 0 "C1" H 1235 2304 50  0000 R CNN
F 1 "1uF" H 1235 2395 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1388 2200 50  0001 C CNN
F 3 "~" H 1350 2350 50  0001 C CNN
	1    1350 2350
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5ED66788
P 1350 2550
F 0 "#PWR0106" H 1350 2300 50  0001 C CNN
F 1 "GND" H 1350 2400 50  0001 C CNN
F 2 "" H 1350 2550 50  0001 C CNN
F 3 "" H 1350 2550 50  0001 C CNN
	1    1350 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2250 3550 2150
$Comp
L Device:R R7
U 1 1 5ED69532
P 3750 2150
F 0 "R7" V 3650 2150 50  0000 C CNN
F 1 "0.01" V 3750 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3680 2150 50  0001 C CNN
F 3 "~" H 3750 2150 50  0001 C CNN
	1    3750 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 2150 3550 2150
Connection ~ 3550 2150
Wire Wire Line
	3900 2150 3950 2150
Wire Wire Line
	3950 2150 3950 2250
Text Label 2200 2300 0    50   ~ 0
VIN
Wire Wire Line
	950  2150 1350 2150
Connection ~ 1350 2150
Wire Wire Line
	2200 2150 2200 2300
Connection ~ 2200 2150
Text Label 3600 5600 0    50   ~ 0
VinSense
Text Label 3600 5700 0    50   ~ 0
ISense
Wire Wire Line
	3600 5600 3550 5600
Wire Wire Line
	3600 5700 3550 5700
Wire Wire Line
	3550 6000 3600 6000
Wire Wire Line
	3550 6100 3600 6100
Text Label 3600 6000 0    50   ~ 0
SDA
Text Label 3600 6100 0    50   ~ 0
SCL
$Comp
L Connector:Conn_01x04_Male J3
U 1 1 5ED77E59
P 4550 5900
F 0 "J3" H 4522 5874 50  0000 R CNN
F 1 "I2C Display" H 4522 5783 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4550 5900 50  0001 C CNN
F 3 "~" H 4550 5900 50  0001 C CNN
	1    4550 5900
	-1   0    0    -1  
$EndComp
Text Label 4350 6100 2    50   ~ 0
SCL
Text Label 4350 6000 2    50   ~ 0
SDA
Text Label 4350 5900 2    50   ~ 0
5V
$Comp
L Device:LED D1
U 1 1 5ED80389
P 1650 5300
F 0 "D1" H 1650 5400 50  0000 C CNN
F 1 "Green_On" H 1650 5150 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 1650 5300 50  0001 C CNN
F 3 "~" H 1650 5300 50  0001 C CNN
	1    1650 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5ED81380
P 1650 5800
F 0 "D2" H 1650 5950 50  0000 C CNN
F 1 "Yellow_Buck" H 1650 5650 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 1650 5800 50  0001 C CNN
F 3 "~" H 1650 5800 50  0001 C CNN
	1    1650 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5ED81BF4
P 1650 6300
F 0 "D3" H 1650 6400 50  0000 C CNN
F 1 "Red_Off" H 1650 6150 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 1650 6300 50  0001 C CNN
F 3 "~" H 1650 6300 50  0001 C CNN
	1    1650 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 5ED84D1D
P 1650 6800
F 0 "D4" H 1650 6900 50  0000 C CNN
F 1 "Blue_PWR" H 1650 6650 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 1650 6800 50  0001 C CNN
F 3 "~" H 1650 6800 50  0001 C CNN
	1    1650 6800
	1    0    0    -1  
$EndComp
Text Label 1800 6800 0    50   ~ 0
5V
Wire Wire Line
	1800 6300 1900 6300
Wire Wire Line
	1900 6300 1900 6200
Wire Wire Line
	1800 5800 1900 5800
Wire Wire Line
	1900 5800 1900 6100
Wire Wire Line
	1800 5300 1950 5300
Wire Wire Line
	1950 5300 1950 6000
Wire Wire Line
	1900 6200 2550 6200
Wire Wire Line
	1900 6100 2550 6100
$Comp
L Device:R_Small R3
U 1 1 5ED91279
P 1300 6300
F 0 "R3" V 1250 6200 39  0000 C CNN
F 1 "330" V 1300 6300 35  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1300 6300 50  0001 C CNN
F 3 "~" H 1300 6300 50  0001 C CNN
	1    1300 6300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5ED91793
P 1300 6800
F 0 "R4" V 1250 6700 39  0000 C CNN
F 1 "330" V 1300 6800 35  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1300 6800 50  0001 C CNN
F 3 "~" H 1300 6800 50  0001 C CNN
	1    1300 6800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5ED91C77
P 1300 5300
F 0 "R1" V 1250 5200 39  0000 C CNN
F 1 "330" V 1300 5300 35  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1300 5300 50  0001 C CNN
F 3 "~" H 1300 5300 50  0001 C CNN
	1    1300 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 5300 1500 5300
Wire Wire Line
	1400 5800 1500 5800
Wire Wire Line
	1400 6300 1500 6300
Wire Wire Line
	1400 6800 1500 6800
$Comp
L power:GND #PWR0108
U 1 1 5ED97987
P 1100 6350
F 0 "#PWR0108" H 1100 6100 50  0001 C CNN
F 1 "GND" H 1100 6200 50  0001 C CNN
F 2 "" H 1100 6350 50  0001 C CNN
F 3 "" H 1100 6350 50  0001 C CNN
	1    1100 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5ED97EA3
P 1100 5350
F 0 "#PWR0110" H 1100 5100 50  0001 C CNN
F 1 "GND" H 1100 5200 50  0001 C CNN
F 2 "" H 1100 5350 50  0001 C CNN
F 3 "" H 1100 5350 50  0001 C CNN
	1    1100 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 5350 1100 5300
Wire Wire Line
	1100 5300 1200 5300
Wire Wire Line
	1200 6300 1100 6300
Wire Wire Line
	1100 6300 1100 6350
Wire Wire Line
	1200 6800 1100 6800
Wire Wire Line
	1950 6000 2550 6000
Connection ~ 3950 2150
Text Label 950  2250 0    50   ~ 0
PV-
$Comp
L Device:CP1 C5
U 1 1 5EDBA36F
P 4950 2400
F 0 "C5" H 5065 2446 50  0000 L CNN
F 1 "100uF" H 5065 2355 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.9" H 4950 2400 50  0001 C CNN
F 3 "~" H 4950 2400 50  0001 C CNN
	1    4950 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2150 4950 2150
Wire Wire Line
	4950 2250 4950 2150
Text Label 4850 2600 2    50   ~ 0
PV-
Wire Wire Line
	4950 2600 4950 2550
Wire Wire Line
	4850 2600 4950 2600
Wire Wire Line
	7150 4750 6350 4750
$Comp
L Driver_FET:IR2104 U2
U 1 1 5ED7C5C0
P 6050 4450
F 0 "U2" H 6050 4450 50  0000 C CNN
F 1 "IR2104" H 6050 4550 50  0000 C CNN
F 2 "Package_BGA:IR2104SPBF" H 6050 4450 50  0001 C CIN
F 3 "https://www.infineon.com/dgdl/ir2104.pdf?fileId=5546d462533600a4015355c7c1c31671" H 6050 4450 50  0001 C CNN
	1    6050 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 2150 7700 2600
$Comp
L Device:C C6
U 1 1 5EDF532D
P 5150 4450
F 0 "C6" H 5035 4404 50  0000 R CNN
F 1 ".1uF" H 5035 4495 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5188 4300 50  0001 C CNN
F 3 "~" H 5150 4450 50  0001 C CNN
	1    5150 4450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5EDFE7A2
P 6050 5050
F 0 "#PWR0111" H 6050 4800 50  0001 C CNN
F 1 "GND" H 6050 4900 50  0001 C CNN
F 2 "" H 6050 5050 50  0001 C CNN
F 3 "" H 6050 5050 50  0001 C CNN
	1    6050 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 5050 6050 5000
Connection ~ 6050 5000
Wire Wire Line
	6050 5000 6050 4950
Text Label 5750 4550 2    50   ~ 0
PWM_EN
Wire Wire Line
	5150 3550 5150 4300
Wire Wire Line
	5150 5000 6050 5000
Wire Wire Line
	5150 4600 5150 5000
$Comp
L power:GND #PWR0112
U 1 1 5EE458E0
P 4950 2700
F 0 "#PWR0112" H 4950 2450 50  0001 C CNN
F 1 "GND" H 4950 2550 50  0001 C CNN
F 2 "" H 4950 2700 50  0001 C CNN
F 3 "" H 4950 2700 50  0001 C CNN
	1    4950 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2700 4950 2600
Connection ~ 4950 2600
$Comp
L Device:Fuse F2
U 1 1 5EE70996
P 10350 3100
F 0 "F2" V 10153 3100 50  0000 C CNN
F 1 "10A" V 10244 3100 50  0000 C CNN
F 2 "Fuse:Fuseholder_Cylinder-5x20mm_Stelvio-Kontek_PTF78_Horizontal_Open" V 10280 3100 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/keystone-electronics/4628/36-4628-ND/2137316" H 10350 3100 50  0001 C CNN
	1    10350 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	10050 3100 10200 3100
Wire Wire Line
	6350 4650 7100 4650
Wire Wire Line
	4100 5800 4100 5850
Wire Wire Line
	4100 5800 4350 5800
Text Label 3550 5800 0    50   ~ 0
VoutSense
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5EEF2F90
P 750 2250
F 0 "J1" H 668 1925 50  0000 C CNN
F 1 "PV Connection" H 668 2016 50  0000 C CNN
F 2 "Connector_Wire:SolderWirePad_1x02_P5.08mm_Drill1.5mm" H 750 2250 50  0001 C CNN
F 3 "~" H 750 2250 50  0001 C CNN
	1    750  2250
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5EEF83BE
P 10800 3100
F 0 "J2" H 10750 3200 50  0000 L CNN
F 1 "12V Out" H 10750 2850 50  0000 L CNN
F 2 "Connector_Wire:SolderWirePad_1x02_P5.08mm_Drill1.5mm" H 10800 3100 50  0001 C CNN
F 3 "~" H 10800 3100 50  0001 C CNN
	1    10800 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 3100 10600 3100
Wire Wire Line
	10550 3250 10550 3200
Wire Wire Line
	10550 3200 10600 3200
Text Notes 8450 2400 0    50   ~ 0
Buck Converter\n\n
Text Notes 5350 4000 0    50   ~ 0
Mosfet Driver\n\n
NoConn ~ 3550 5400
NoConn ~ 3550 5900
NoConn ~ 3550 6200
NoConn ~ 3550 6300
NoConn ~ 2550 6300
NoConn ~ 2550 5600
NoConn ~ 2550 5300
NoConn ~ 2550 5400
NoConn ~ 2550 5000
NoConn ~ 2550 5100
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5EF5F9BA
P 2200 2150
F 0 "#FLG0101" H 2200 2225 50  0001 C CNN
F 1 "PWR_FLAG" H 2200 2323 50  0000 C CNN
F 2 "" H 2200 2150 50  0001 C CNN
F 3 "~" H 2200 2150 50  0001 C CNN
	1    2200 2150
	1    0    0    -1  
$EndComp
NoConn ~ 2550 5500
NoConn ~ 2550 5700
$Comp
L power:GND #PWR0118
U 1 1 5EF771D7
P 10550 3250
F 0 "#PWR0118" H 10550 3000 50  0001 C CNN
F 1 "GND" H 10550 3100 50  0001 C CNN
F 2 "" H 10550 3250 50  0001 C CNN
F 3 "" H 10550 3250 50  0001 C CNN
	1    10550 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4600 2750 4600
Wire Wire Line
	2750 4600 2750 4550
$Comp
L power:GND #PWR0105
U 1 1 5EF80687
P 2450 2900
F 0 "#PWR0105" H 2450 2650 50  0001 C CNN
F 1 "GND" H 2450 2750 50  0001 C CNN
F 2 "" H 2450 2900 50  0001 C CNN
F 3 "" H 2450 2900 50  0001 C CNN
	1    2450 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4450 2900 4450
$Comp
L power:GND #PWR0102
U 1 1 5EF8504D
P 2900 4450
F 0 "#PWR0102" H 2900 4200 50  0001 C CNN
F 1 "GND" H 2900 4300 50  0001 C CNN
F 2 "" H 2900 4450 50  0001 C CNN
F 3 "" H 2900 4450 50  0001 C CNN
	1    2900 4450
	1    0    0    -1  
$EndComp
NoConn ~ 2550 5200
Wire Wire Line
	1350 2550 1350 2500
$Comp
L Device:R_Small R2
U 1 1 5EFA0A3A
P 1300 5800
F 0 "R2" V 1250 5700 39  0000 C CNN
F 1 "330" V 1300 5800 35  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1300 5800 50  0001 C CNN
F 3 "~" H 1300 5800 50  0001 C CNN
	1    1300 5800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5EFA0D5E
P 1100 5850
F 0 "#PWR0109" H 1100 5600 50  0001 C CNN
F 1 "GND" H 1100 5700 50  0001 C CNN
F 2 "" H 1100 5850 50  0001 C CNN
F 3 "" H 1100 5850 50  0001 C CNN
	1    1100 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 5850 1100 5800
Wire Wire Line
	1100 5800 1200 5800
$Comp
L power:GND #PWR0119
U 1 1 5EFA5ED2
P 2850 2900
F 0 "#PWR0119" H 2850 2650 50  0001 C CNN
F 1 "GND" H 2850 2750 50  0001 C CNN
F 2 "" H 2850 2900 50  0001 C CNN
F 3 "" H 2850 2900 50  0001 C CNN
	1    2850 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3550 6200 3550
Wire Wire Line
	2450 2150 3550 2150
Text Label 6050 3700 2    50   ~ 0
VIN
$Comp
L power:GND #PWR0120
U 1 1 5EFB3277
P 3100 6700
F 0 "#PWR0120" H 3100 6450 50  0001 C CNN
F 1 "GND" H 3100 6550 50  0001 C CNN
F 2 "" H 3100 6700 50  0001 C CNN
F 3 "" H 3100 6700 50  0001 C CNN
	1    3100 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 6600 3100 6600
Wire Wire Line
	3100 6600 3100 6700
Connection ~ 3100 6600
Wire Wire Line
	3100 6600 3150 6600
$Comp
L Device:C_Small C10
U 1 1 5EFD6A97
P 6150 3850
F 0 "C10" V 6050 3850 50  0000 C CNN
F 1 ".1uF" V 6250 3850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6150 3850 50  0001 C CNN
F 3 "~" H 6150 3850 50  0001 C CNN
	1    6150 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	6050 3700 6050 3850
Connection ~ 6050 3850
Wire Wire Line
	6050 3850 6050 3950
$Comp
L power:GND #PWR0121
U 1 1 5EFDB1DE
P 6300 3900
F 0 "#PWR0121" H 6300 3650 50  0001 C CNN
F 1 "GND" H 6300 3750 50  0001 C CNN
F 2 "" H 6300 3900 50  0001 C CNN
F 3 "" H 6300 3900 50  0001 C CNN
	1    6300 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3850 6250 3850
Wire Wire Line
	6300 3900 6300 3850
Wire Wire Line
	1350 2150 1600 2150
Wire Wire Line
	2200 2150 2450 2150
Wire Wire Line
	1900 2150 2200 2150
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5F000A32
P 3100 6700
F 0 "#FLG0102" H 3100 6775 50  0001 C CNN
F 1 "PWR_FLAG" V 3100 6828 50  0000 L CNN
F 2 "" H 3100 6700 50  0001 C CNN
F 3 "~" H 3100 6700 50  0001 C CNN
	1    3100 6700
	0    1    1    0   
$EndComp
Connection ~ 3100 6700
Text Label 2550 5900 2    50   ~ 0
PWM
Text Label 5750 4450 2    50   ~ 0
PWM
Text Label 2550 5800 2    50   ~ 0
PWM_EN
Connection ~ 6700 4250
Connection ~ 10050 3100
Wire Wire Line
	6700 4250 6350 4250
Wire Wire Line
	7050 4250 6700 4250
Wire Wire Line
	6500 3550 6500 4150
Wire Wire Line
	6700 4150 6700 4250
Wire Wire Line
	9600 3100 10050 3100
Wire Wire Line
	8400 3100 8400 3150
Wire Wire Line
	9600 3150 9600 3100
Wire Wire Line
	8400 3100 7700 3100
$Comp
L Device:D D7
U 1 1 5EE1616B
P 8400 3300
F 0 "D7" H 8400 3400 50  0000 C CNN
F 1 "1N4148" H 8400 3200 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P10.16mm_Horizontal" H 8400 3300 50  0001 C CNN
F 3 "~" H 8400 3300 50  0001 C CNN
	1    8400 3300
	0    1    1    0   
$EndComp
$Comp
L Device:CP1 C9
U 1 1 5EE1730F
P 9600 3300
F 0 "C9" H 9715 3346 50  0000 L CNN
F 1 "220uF" H 9715 3255 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x6.9" H 9600 3300 50  0001 C CNN
F 3 "~" H 9600 3300 50  0001 C CNN
	1    9600 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5EE1809D
P 9200 2900
F 0 "R10" V 9407 2900 50  0000 C CNN
F 1 "470K" V 9316 2900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P20.32mm_Horizontal" V 9130 2900 50  0001 C CNN
F 3 "~" H 9200 2900 50  0001 C CNN
	1    9200 2900
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C7
U 1 1 5EE192DE
P 8700 2900
F 0 "C7" V 8952 2900 50  0000 C CNN
F 1 ".1uF" V 8861 2900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8738 2750 50  0001 C CNN
F 3 "~" H 8700 2900 50  0001 C CNN
	1    8700 2900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8400 3100 8400 2900
Wire Wire Line
	8400 2900 8550 2900
Wire Wire Line
	8850 2900 9050 2900
$Comp
L Device:L L1
U 1 1 5EE1D514
P 9000 3100
F 0 "L1" V 8950 3100 50  0000 C CNN
F 1 "33uH" V 9100 3100 50  0000 C CNN
F 2 "Inductor_THT:DEP1519b_Inductor" H 9000 3100 50  0001 C CNN
F 3 "~" H 9000 3100 50  0001 C CNN
	1    9000 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8850 3100 8400 3100
Connection ~ 8400 3100
Wire Wire Line
	9350 2900 9600 2900
Wire Wire Line
	9150 3100 9600 3100
Connection ~ 9600 3100
Wire Wire Line
	9600 3100 9600 2900
$Comp
L power:GND #PWR0115
U 1 1 5EE4A07F
P 8400 3450
F 0 "#PWR0115" H 8400 3200 50  0001 C CNN
F 1 "GND" H 8400 3300 50  0001 C CNN
F 2 "" H 8400 3450 50  0001 C CNN
F 3 "" H 8400 3450 50  0001 C CNN
	1    8400 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5EE4A2E6
P 9600 3450
F 0 "#PWR0114" H 9600 3200 50  0001 C CNN
F 1 "GND" H 9600 3300 50  0001 C CNN
F 2 "" H 9600 3450 50  0001 C CNN
F 3 "" H 9600 3450 50  0001 C CNN
	1    9600 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5EE49A84
P 7700 3800
F 0 "#PWR0113" H 7700 3550 50  0001 C CNN
F 1 "GND" H 7700 3650 50  0001 C CNN
F 2 "" H 7700 3800 50  0001 C CNN
F 3 "" H 7700 3800 50  0001 C CNN
	1    7700 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:D D5
U 1 1 5EDDE4D7
P 6350 3550
F 0 "D5" H 6350 3650 50  0000 C CNN
F 1 "1N4148" H 6350 3450 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P10.16mm_Horizontal" H 6350 3550 50  0001 C CNN
F 3 "~" H 6350 3550 50  0001 C CNN
	1    6350 3550
	-1   0    0    1   
$EndComp
Connection ~ 6500 4150
Wire Wire Line
	6500 4150 6700 4150
Wire Wire Line
	7050 2800 7050 4250
Wire Wire Line
	7700 3100 7700 3250
Connection ~ 7700 3100
Wire Wire Line
	7100 3100 7100 4650
Wire Wire Line
	7700 3100 7100 3100
Wire Wire Line
	7700 3000 7700 3100
Wire Wire Line
	6500 4150 6350 4150
Wire Wire Line
	7400 2800 7050 2800
Wire Wire Line
	7150 3450 7150 4750
Wire Wire Line
	7400 3450 7150 3450
Wire Wire Line
	7700 3650 7700 3800
$Comp
L Transistor_FET:IRFIZ44N Q2
U 1 1 5EDAC6A3
P 7600 2800
F 0 "Q2" H 7804 2846 50  0000 L CNN
F 1 "IRFIZ44N" H 7804 2755 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 7600 2800 50  0001 C CIN
F 3 "https://www.infineon.com/dgdl/irf6613pbf.pdf?fileId=5546d462533600a4015355e82b9b1a0d" H 7600 2800 50  0001 L CNN
	1    7600 2800
	1    0    0    -1  
$EndComp
Connection ~ 7050 2800
Connection ~ 4950 2150
$Comp
L Device:D D6
U 1 1 5EDC8750
P 6750 2800
F 0 "D6" H 6750 2900 50  0000 C CNN
F 1 "1N4148" H 6750 2700 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P10.16mm_Horizontal" H 6750 2800 50  0001 C CNN
F 3 "~" H 6750 2800 50  0001 C CNN
	1    6750 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2800 6150 2800
Wire Wire Line
	7050 2800 6900 2800
Connection ~ 6150 2800
Wire Wire Line
	4950 2150 5650 2150
Wire Wire Line
	6350 2150 7700 2150
Connection ~ 5650 2150
Wire Wire Line
	6150 2800 6150 2450
Wire Wire Line
	5650 2800 6150 2800
Wire Wire Line
	5650 2650 5650 2800
Wire Wire Line
	5650 2150 5950 2150
Wire Wire Line
	5650 2350 5650 2150
$Comp
L Device:R R8
U 1 1 5ED6DAE9
P 5650 2500
F 0 "R8" H 5720 2546 50  0000 L CNN
F 1 "470K" H 5720 2455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P20.32mm_Horizontal" V 5580 2500 50  0001 C CNN
F 3 "~" H 5650 2500 50  0001 C CNN
	1    5650 2500
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Current:AD8212 U1
U 1 1 5ED45CD6
P 3750 2650
F 0 "U1" H 3750 2261 50  0000 C CNN
F 1 "AD8212" H 3750 2170 50  0000 C CNN
F 2 "Package_SO:MSOP-8_3x3mm_P0.65mm" H 3750 2650 50  0001 L CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8212.pdf" H 4400 1950 50  0001 C CNN
	1    3750 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3200 4150 2850
$Comp
L power:GND #PWR0122
U 1 1 5EFD5D96
P 4300 2950
F 0 "#PWR0122" H 4300 2700 50  0001 C CNN
F 1 "GND" H 4300 2800 50  0001 C CNN
F 2 "" H 4300 2950 50  0001 C CNN
F 3 "" H 4300 2950 50  0001 C CNN
	1    4300 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5EFD1110
P 4300 2800
F 0 "R12" V 4200 2800 50  0000 C CNN
F 1 "100K" V 4300 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4230 2800 50  0001 C CNN
F 3 "~" H 4300 2800 50  0001 C CNN
	1    4300 2800
	-1   0    0    1   
$EndComp
Text Notes 3300 3350 0    50   ~ 0
Current Sensing Op-Amp
Wire Wire Line
	4150 2650 4300 2650
Text Label 4300 2650 0    50   ~ 0
ISense
Wire Wire Line
	3200 2650 3350 2650
Wire Wire Line
	3200 2700 3200 2650
$Comp
L power:GND #PWR0107
U 1 1 5ED6BA65
P 3200 2700
F 0 "#PWR0107" H 3200 2450 50  0001 C CNN
F 1 "GND" H 3200 2550 50  0001 C CNN
F 2 "" H 3200 2700 50  0001 C CNN
F 3 "" H 3200 2700 50  0001 C CNN
	1    3200 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3200 4150 3200
Wire Wire Line
	3350 2750 3350 3200
$Comp
L Transistor_FET:IRFIZ44N Q1
U 1 1 5ED7F974
P 6150 2250
F 0 "Q1" V 6492 2250 50  0000 C CNN
F 1 "IRFIZ44N" V 6401 2250 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 6150 2250 50  0001 C CIN
F 3 "https://www.infineon.com/dgdl/irf6613pbf.pdf?fileId=5546d462533600a4015355e82b9b1a0d" H 6150 2250 50  0001 L CNN
	1    6150 2250
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:IRFIZ44N Q3
U 1 1 5EDAC33C
P 7600 3450
F 0 "Q3" H 7804 3496 50  0000 L CNN
F 1 "IRFIZ44N" H 7804 3405 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 7600 3450 50  0001 C CIN
F 3 "https://www.infineon.com/dgdl/irf6613pbf.pdf?fileId=5546d462533600a4015355e82b9b1a0d" H 7600 3450 50  0001 L CNN
	1    7600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4200 8600 4300
Wire Wire Line
	9000 4000 9000 4200
$Comp
L power:GND #PWR0117
U 1 1 5EEAEF89
P 9000 4650
F 0 "#PWR0117" H 9000 4400 50  0001 C CNN
F 1 "GND" H 9000 4500 50  0001 C CNN
F 2 "" H 9000 4650 50  0001 C CNN
F 3 "" H 9000 4650 50  0001 C CNN
	1    9000 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4350 9000 4400
Connection ~ 9000 4350
Wire Wire Line
	9000 4200 9050 4200
Connection ~ 9000 4200
Wire Wire Line
	9000 4200 9000 4350
Wire Wire Line
	8950 4200 9000 4200
$Comp
L Device:C C8
U 1 1 5EE8010B
P 9000 4500
F 0 "C8" H 9115 4546 50  0000 L CNN
F 1 ".1uF" H 9115 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9038 4350 50  0001 C CNN
F 3 "~" H 9000 4500 50  0001 C CNN
	1    9000 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4200 8600 4200
$Comp
L Device:R R9
U 1 1 5EE80117
P 8800 4200
F 0 "R9" H 8870 4246 50  0000 L CNN
F 1 "2.2k" H 8870 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8730 4200 50  0001 C CNN
F 3 "~" H 8800 4200 50  0001 C CNN
	1    8800 4200
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5EE80111
P 9200 4200
F 0 "R11" H 9270 4246 50  0000 L CNN
F 1 "10k" H 9270 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9130 4200 50  0001 C CNN
F 3 "~" H 9200 4200 50  0001 C CNN
	1    9200 4200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5EE80104
P 8600 4300
F 0 "#PWR0116" H 8600 4050 50  0001 C CNN
F 1 "GND" H 8600 4150 50  0001 C CNN
F 2 "" H 8600 4300 50  0001 C CNN
F 3 "" H 8600 4300 50  0001 C CNN
	1    8600 4300
	1    0    0    -1  
$EndComp
Text Label 9000 4000 0    50   ~ 0
VoutSense
Wire Wire Line
	10050 3100 10050 4200
Wire Wire Line
	9350 4200 10050 4200
Wire Wire Line
	1100 6650 1100 6800
Wire Wire Line
	1100 6800 1100 6850
Connection ~ 1100 6800
$EndSCHEMATC
