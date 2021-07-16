EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x15_Female J0
U 1 1 60F1837A
P 5600 2350
F 0 "J0" H 5450 3250 50  0000 L CNN
F 1 "Conn_01x15_Female" H 5150 3150 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x15_P2.54mm_Vertical" H 5600 2350 50  0001 C CNN
F 3 "~" H 5600 2350 50  0001 C CNN
	1    5600 2350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x15_Female J1
U 1 1 60F18F6B
P 6300 2350
F 0 "J1" H 6192 3143 50  0000 C CNN
F 1 "Conn_01x15_Female" H 6192 3144 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x15_P2.54mm_Vertical" H 6300 2350 50  0001 C CNN
F 3 "~" H 6300 2350 50  0001 C CNN
	1    6300 2350
	-1   0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U0
U 1 1 60F1E030
P 2600 1650
F 0 "U0" H 2600 1892 50  0000 C CNN
F 1 "L7805" H 2600 1801 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 2625 1500 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 2600 1600 50  0001 C CNN
	1    2600 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR02
U 1 1 60F1E706
P 2050 1450
F 0 "#PWR02" H 2050 1300 50  0001 C CNN
F 1 "+12V" H 2065 1623 50  0000 C CNN
F 2 "" H 2050 1450 50  0001 C CNN
F 3 "" H 2050 1450 50  0001 C CNN
	1    2050 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack J6
U 1 1 60F223F7
P 750 1750
F 0 "J6" H 807 2075 50  0000 C CNN
F 1 "Barrel_Jack" H 807 1984 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 800 1710 50  0001 C CNN
F 3 "~" H 800 1710 50  0001 C CNN
	1    750  1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1450 2050 1650
Connection ~ 2050 1650
Wire Wire Line
	2050 1650 2250 1650
Wire Wire Line
	2050 1850 2050 2100
Wire Wire Line
	2050 2100 2250 2100
Wire Wire Line
	2600 2100 2600 1950
$Comp
L power:GND #PWR00
U 1 1 60F23F2D
P 2600 2200
F 0 "#PWR00" H 2600 1950 50  0001 C CNN
F 1 "GND" H 2605 2027 50  0000 C CNN
F 2 "" H 2600 2200 50  0001 C CNN
F 3 "" H 2600 2200 50  0001 C CNN
	1    2600 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2100 2600 2200
Connection ~ 2600 2100
$Comp
L Device:C C0
U 1 1 60F24701
P 2250 1850
F 0 "C0" H 2365 1896 50  0000 L CNN
F 1 "0.33µf" H 2365 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2288 1700 50  0001 C CNN
F 3 "~" H 2250 1850 50  0001 C CNN
	1    2250 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 60F24D92
P 3000 1850
F 0 "C1" H 3115 1896 50  0000 L CNN
F 1 "0.1µf" H 3115 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3038 1700 50  0001 C CNN
F 3 "~" H 3000 1850 50  0001 C CNN
	1    3000 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1650 2250 1700
Connection ~ 2250 1650
Wire Wire Line
	2250 1650 2300 1650
Wire Wire Line
	2250 2000 2250 2100
Connection ~ 2250 2100
Wire Wire Line
	2250 2100 2600 2100
Wire Wire Line
	2600 2100 3000 2100
Wire Wire Line
	3000 2100 3000 2000
Wire Wire Line
	3000 1700 3000 1650
Wire Wire Line
	3000 1650 2900 1650
$Comp
L power:+5V #PWR01
U 1 1 60F3B3ED
P 3000 1450
F 0 "#PWR01" H 3000 1300 50  0001 C CNN
F 1 "+5V" H 3015 1623 50  0000 C CNN
F 2 "" H 3000 1450 50  0001 C CNN
F 3 "" H 3000 1450 50  0001 C CNN
	1    3000 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1650 3000 1450
Connection ~ 3000 1650
Wire Wire Line
	5300 2750 5300 2950
Wire Wire Line
	5300 2950 5400 2950
Wire Wire Line
	5700 1750 5400 1750
Wire Wire Line
	5750 1650 5400 1650
$Comp
L power:+5V #PWR0101
U 1 1 60F5A381
P 6600 1650
F 0 "#PWR0101" H 6600 1500 50  0001 C CNN
F 1 "+5V" V 6600 1750 50  0000 L CNN
F 2 "" H 6600 1650 50  0001 C CNN
F 3 "" H 6600 1650 50  0001 C CNN
	1    6600 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	6500 1650 6600 1650
$Comp
L power:GND #PWR0102
U 1 1 60F5DC3C
P 6600 1750
F 0 "#PWR0102" H 6600 1500 50  0001 C CNN
F 1 "GND" V 6605 1622 50  0000 R CNN
F 2 "" H 6600 1750 50  0001 C CNN
F 3 "" H 6600 1750 50  0001 C CNN
	1    6600 1750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6600 1750 6500 1750
Wire Wire Line
	5150 2750 5300 2750
Wire Wire Line
	5150 2650 5400 2650
$Comp
L Connector:Conn_01x03_Female J3
U 1 1 60F7889E
P 7300 2100
F 0 "J3" H 7150 2300 50  0000 L CNN
F 1 "Conn_01x03_Female" H 7328 2035 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7300 2100 50  0001 C CNN
F 3 "~" H 7300 2100 50  0001 C CNN
	1    7300 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2650 6600 2650
$Comp
L power:GND #PWR0103
U 1 1 60F877AB
P 7100 2200
F 0 "#PWR0103" H 7100 1950 50  0001 C CNN
F 1 "GND" V 7200 2200 50  0000 R CNN
F 2 "" H 7100 2200 50  0001 C CNN
F 3 "" H 7100 2200 50  0001 C CNN
	1    7100 2200
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 60F87FD7
P 7100 2000
F 0 "#PWR0104" H 7100 1850 50  0001 C CNN
F 1 "+5V" V 7150 2150 50  0000 L CNN
F 2 "" H 7100 2000 50  0001 C CNN
F 3 "" H 7100 2000 50  0001 C CNN
	1    7100 2000
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x03_Female J4
U 1 1 60F8B95C
P 7300 2600
F 0 "J4" H 7150 2800 50  0000 L CNN
F 1 "Conn_01x03_Female" H 7328 2535 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7300 2600 50  0001 C CNN
F 3 "~" H 7300 2600 50  0001 C CNN
	1    7300 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J5
U 1 1 60F8C94C
P 7300 3100
F 0 "J5" H 7150 3300 50  0000 L CNN
F 1 "Conn_01x03_Female" H 7328 3035 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7300 3100 50  0001 C CNN
F 3 "~" H 7300 3100 50  0001 C CNN
	1    7300 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2650 6600 2100
Wire Wire Line
	6600 2100 7100 2100
$Comp
L power:GND #PWR0105
U 1 1 60F9C543
P 7100 3200
F 0 "#PWR0105" H 7100 2950 50  0001 C CNN
F 1 "GND" V 7200 3200 50  0000 R CNN
F 2 "" H 7100 3200 50  0001 C CNN
F 3 "" H 7100 3200 50  0001 C CNN
	1    7100 3200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 60F9D878
P 7100 2700
F 0 "#PWR0106" H 7100 2450 50  0001 C CNN
F 1 "GND" V 7200 2700 50  0000 R CNN
F 2 "" H 7100 2700 50  0001 C CNN
F 3 "" H 7100 2700 50  0001 C CNN
	1    7100 2700
	0    1    1    0   
$EndComp
$Comp
L Device:R R0
U 1 1 60F9E704
P 6850 2600
F 0 "R0" V 6750 2500 50  0000 C CNN
F 1 "10k" V 6750 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6780 2600 50  0001 C CNN
F 3 "~" H 6850 2600 50  0001 C CNN
	1    6850 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 60F9F06D
P 7550 2600
F 0 "R1" V 7450 2500 50  0000 C CNN
F 1 "10k" V 7450 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7480 2600 50  0001 C CNN
F 3 "~" H 7550 2600 50  0001 C CNN
	1    7550 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 60FA04AE
P 6850 3100
F 0 "R2" V 6750 3000 50  0000 C CNN
F 1 "10k" V 6750 3150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6780 3100 50  0001 C CNN
F 3 "~" H 6850 3100 50  0001 C CNN
	1    6850 3100
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 60FA4056
P 7550 3100
F 0 "R3" V 7450 3000 50  0000 C CNN
F 1 "10k" V 7450 3150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7480 3100 50  0001 C CNN
F 3 "~" H 7550 3100 50  0001 C CNN
	1    7550 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	6500 2750 6650 2750
Wire Wire Line
	6650 2750 6650 2600
Wire Wire Line
	6650 2600 6700 2600
Wire Wire Line
	6500 2850 6650 2850
Wire Wire Line
	6650 2850 6650 3100
Wire Wire Line
	6650 3100 6700 3100
Wire Wire Line
	7000 2600 7100 2600
Wire Wire Line
	7100 3100 7400 3100
Wire Wire Line
	7100 2600 7400 2600
Connection ~ 7100 2600
Wire Wire Line
	7700 2700 7700 2600
Wire Wire Line
	7700 3200 7700 3100
Wire Wire Line
	7100 3100 7000 3100
Connection ~ 7100 3100
Wire Wire Line
	7100 3200 7700 3200
Connection ~ 7100 3200
Wire Wire Line
	7100 2700 7700 2700
Connection ~ 7100 2700
$Comp
L Switch:SW_DIP_x01 SW0
U 1 1 60FBE87A
P 1400 1650
F 0 "SW0" H 1400 1917 50  0000 C CNN
F 1 "SW_DIP_x01" H 1400 1826 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_DPDT_CK_JS202011JCQN" H 1400 1650 50  0001 C CNN
F 3 "~" H 1400 1650 50  0001 C CNN
	1    1400 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1650 2050 1650
Wire Wire Line
	1100 1650 1050 1650
Wire Wire Line
	1050 1850 2050 1850
$Comp
L power:+12V #PWR0107
U 1 1 60FD216B
P 7100 2500
F 0 "#PWR0107" H 7100 2350 50  0001 C CNN
F 1 "+12V" V 7200 2500 50  0000 L CNN
F 2 "" H 7100 2500 50  0001 C CNN
F 3 "" H 7100 2500 50  0001 C CNN
	1    7100 2500
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0108
U 1 1 60FD2918
P 7100 3000
F 0 "#PWR0108" H 7100 2850 50  0001 C CNN
F 1 "+12V" V 7200 3000 50  0000 L CNN
F 2 "" H 7100 3000 50  0001 C CNN
F 3 "" H 7100 3000 50  0001 C CNN
	1    7100 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5700 3150 5700 1750
Wire Wire Line
	5750 3200 5750 1650
Wire Wire Line
	5200 3200 5750 3200
Wire Wire Line
	5150 2850 5250 2850
Wire Wire Line
	5200 2950 5150 2950
Wire Wire Line
	5200 2950 5200 3200
Wire Wire Line
	5250 3150 5700 3150
Wire Wire Line
	5250 2850 5250 3150
$Comp
L Connector:Conn_01x04_Female J2
U 1 1 60F49974
P 4950 2850
F 0 "J2" H 4842 2517 50  0000 C CNN
F 1 "Conn_01x04_Female" H 4842 2516 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4950 2850 50  0001 C CNN
F 3 "~" H 4950 2850 50  0001 C CNN
	1    4950 2850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR007
U 1 1 6100AE23
P 4850 2850
F 0 "#PWR007" H 4850 2600 50  0001 C CNN
F 1 "GND" V 4855 2722 50  0000 R CNN
F 2 "" H 4850 2850 50  0001 C CNN
F 3 "" H 4850 2850 50  0001 C CNN
	1    4850 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 2850 5150 2850
Connection ~ 5150 2850
$EndSCHEMATC
