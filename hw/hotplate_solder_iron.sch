EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "Hotplate solder iron"
Date "2021-01-26"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:WeMos_D1_mini U1
U 1 1 5E684783
P 1600 1900
F 0 "U1" H 1150 1200 50  0000 C CNN
F 1 "WeMos_D1_mini" H 1100 1100 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 1600 750 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H -250 750 50  0001 C CNN
	1    1600 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5E685B50
P 2100 1050
F 0 "#PWR0101" H 2100 800 50  0001 C CNN
F 1 "GND" H 2105 877 50  0000 C CNN
F 2 "" H 2100 1050 50  0001 C CNN
F 3 "" H 2100 1050 50  0001 C CNN
	1    2100 1050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J2
U 1 1 5E687186
P 3800 2300
F 0 "J2" V 4000 2300 50  0000 R CNN
F 1 "MAX6675_breakout" V 3900 2650 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 3800 2300 50  0001 C CNN
F 3 "~" H 3800 2300 50  0001 C CNN
	1    3800 2300
	0    1    -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0102
U 1 1 5E687942
P 3900 2550
F 0 "#PWR0102" H 3900 2400 50  0001 C CNN
F 1 "+3.3V" V 3900 2800 50  0000 C CNN
F 2 "" H 3900 2550 50  0001 C CNN
F 3 "" H 3900 2550 50  0001 C CNN
	1    3900 2550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5E688CEE
P 4000 2550
F 0 "#PWR0103" H 4000 2300 50  0001 C CNN
F 1 "GND" V 4000 2350 50  0000 C CNN
F 2 "" H 4000 2550 50  0001 C CNN
F 3 "" H 4000 2550 50  0001 C CNN
	1    4000 2550
	1    0    0    -1  
$EndComp
Text Label 3600 2550 3    50   ~ 0
MISO
Text Label 3700 2550 3    50   ~ 0
CS
Text Label 3800 2550 3    50   ~ 0
SCK
Wire Wire Line
	3600 2500 3600 2550
Wire Wire Line
	3700 2500 3700 2550
Wire Wire Line
	3800 2500 3800 2550
Wire Wire Line
	3900 2500 3900 2550
Wire Wire Line
	4000 2500 4000 2550
Wire Wire Line
	2150 1050 2100 1050
$Comp
L power:GND #PWR0104
U 1 1 5E68B7D0
P 1600 2750
F 0 "#PWR0104" H 1600 2500 50  0001 C CNN
F 1 "GND" H 1605 2577 50  0000 C CNN
F 2 "" H 1600 2750 50  0001 C CNN
F 3 "" H 1600 2750 50  0001 C CNN
	1    1600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2700 1600 2750
$Comp
L power:+3.3V #PWR0105
U 1 1 5E68C1E8
P 1750 1050
F 0 "#PWR0105" H 1750 900 50  0001 C CNN
F 1 "+3.3V" H 1765 1223 50  0000 C CNN
F 2 "" H 1750 1050 50  0001 C CNN
F 3 "" H 1750 1050 50  0001 C CNN
	1    1750 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5E68C550
P 1450 1050
F 0 "#PWR0106" H 1450 900 50  0001 C CNN
F 1 "+5V" H 1465 1223 50  0000 C CNN
F 2 "" H 1450 1050 50  0001 C CNN
F 3 "" H 1450 1050 50  0001 C CNN
	1    1450 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1050 1500 1050
Wire Wire Line
	1500 1050 1500 1100
Wire Wire Line
	1750 1050 1700 1050
Wire Wire Line
	1700 1050 1700 1100
$Comp
L Switch:SW_Push SW1
U 1 1 5E690A3F
P 7300 1050
F 0 "SW1" H 7300 1335 50  0000 C CNN
F 1 "SW_Push" H 7300 1244 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_PTS645" H 7300 1250 50  0001 C CNN
F 3 "~" H 7300 1250 50  0001 C CNN
	1    7300 1050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5E69134B
P 5300 2300
F 0 "J3" V 5500 2300 50  0000 R CNN
F 1 "5V_power_supply" V 5400 2550 50  0000 R CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 5300 2300 50  0001 C CNN
F 3 "~" H 5300 2300 50  0001 C CNN
	1    5300 2300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5E692762
P 5400 2550
F 0 "#PWR0107" H 5400 2300 50  0001 C CNN
F 1 "GND" V 5400 2350 50  0000 C CNN
F 2 "" H 5400 2550 50  0001 C CNN
F 3 "" H 5400 2550 50  0001 C CNN
	1    5400 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 5E692A84
P 5300 2550
F 0 "#PWR0108" H 5300 2400 50  0001 C CNN
F 1 "+5V" V 5300 2750 50  0000 C CNN
F 2 "" H 5300 2550 50  0001 C CNN
F 3 "" H 5300 2550 50  0001 C CNN
	1    5300 2550
	-1   0    0    1   
$EndComp
Wire Wire Line
	5300 2500 5300 2550
Wire Wire Line
	5400 2500 5400 2550
$Comp
L power:GND #PWR0109
U 1 1 5E694477
P 7550 1050
F 0 "#PWR0109" H 7550 800 50  0001 C CNN
F 1 "GND" H 7555 877 50  0000 C CNN
F 2 "" H 7550 1050 50  0001 C CNN
F 3 "" H 7550 1050 50  0001 C CNN
	1    7550 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0110
U 1 1 5E694CD3
P 6700 1050
F 0 "#PWR0110" H 6700 900 50  0001 C CNN
F 1 "+3.3V" V 6715 1178 50  0000 L CNN
F 2 "" H 6700 1050 50  0001 C CNN
F 3 "" H 6700 1050 50  0001 C CNN
	1    6700 1050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7550 1050 7500 1050
$Comp
L power:+3.3V #PWR0111
U 1 1 5E6957BB
P 2500 1050
F 0 "#PWR0111" H 2500 900 50  0001 C CNN
F 1 "+3.3V" V 2515 1178 50  0000 L CNN
F 2 "" H 2500 1050 50  0001 C CNN
F 3 "" H 2500 1050 50  0001 C CNN
	1    2500 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 1050 2500 1050
Wire Wire Line
	2000 1400 2300 1400
Wire Wire Line
	2300 1400 2300 1200
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 5E69B969
P 5300 1000
F 0 "J4" V 5500 1050 50  0000 R CNN
F 1 "SSR" V 5400 1050 50  0000 R CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 5300 1000 50  0001 C CNN
F 3 "~" H 5300 1000 50  0001 C CNN
	1    5300 1000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5E69DB83
P 6850 1050
F 0 "R1" V 6654 1050 50  0000 C CNN
F 1 "10k" V 6745 1050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6850 1050 50  0001 C CNN
F 3 "~" H 6850 1050 50  0001 C CNN
	1    6850 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 1050 6750 1050
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 5E69F67B
P 3850 1000
F 0 "J1" V 4050 1000 50  0000 R CNN
F 1 "OLED" V 3950 1050 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3850 1000 50  0001 C CNN
F 3 "~" H 3850 1000 50  0001 C CNN
	1    3850 1000
	0    1    -1   0   
$EndComp
Text Label 3650 1250 3    50   ~ 0
SDA
Text Label 3750 1250 3    50   ~ 0
SCL
$Comp
L power:+3.3V #PWR0112
U 1 1 5E6A20BB
P 3850 1250
F 0 "#PWR0112" H 3850 1100 50  0001 C CNN
F 1 "+3.3V" V 3850 1500 50  0000 C CNN
F 2 "" H 3850 1250 50  0001 C CNN
F 3 "" H 3850 1250 50  0001 C CNN
	1    3850 1250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5E6A20C1
P 3950 1250
F 0 "#PWR0113" H 3950 1000 50  0001 C CNN
F 1 "GND" V 3950 1050 50  0000 C CNN
F 2 "" H 3950 1250 50  0001 C CNN
F 3 "" H 3950 1250 50  0001 C CNN
	1    3950 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1200 3650 1250
Wire Wire Line
	3750 1200 3750 1250
Wire Wire Line
	3850 1200 3850 1250
Wire Wire Line
	3950 1200 3950 1250
$Comp
L Mechanical:MountingHole H1
U 1 1 5E6A3617
P 6750 2100
F 0 "H1" H 6850 2146 50  0000 L CNN
F 1 "MountingHole" H 6850 2055 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6750 2100 50  0001 C CNN
F 3 "~" H 6750 2100 50  0001 C CNN
	1    6750 2100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E6A37EF
P 6750 2300
F 0 "H2" H 6850 2346 50  0000 L CNN
F 1 "MountingHole" H 6850 2255 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6750 2300 50  0001 C CNN
F 3 "~" H 6750 2300 50  0001 C CNN
	1    6750 2300
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5E6A398E
P 6750 2500
F 0 "H3" H 6850 2546 50  0000 L CNN
F 1 "MountingHole" H 6850 2455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6750 2500 50  0001 C CNN
F 3 "~" H 6750 2500 50  0001 C CNN
	1    6750 2500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5E6A3B38
P 6750 2700
F 0 "H4" H 6850 2746 50  0000 L CNN
F 1 "MountingHole" H 6850 2655 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6750 2700 50  0001 C CNN
F 3 "~" H 6750 2700 50  0001 C CNN
	1    6750 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5E6A4C2B
P 5400 1250
F 0 "#PWR0114" H 5400 1000 50  0001 C CNN
F 1 "GND" V 5400 1050 50  0000 C CNN
F 2 "" H 5400 1250 50  0001 C CNN
F 3 "" H 5400 1250 50  0001 C CNN
	1    5400 1250
	1    0    0    -1  
$EndComp
Text Label 5300 1250 3    50   ~ 0
SSR
Wire Wire Line
	5300 1200 5300 1250
Wire Wire Line
	5400 1200 5400 1250
NoConn ~ 1200 1500
NoConn ~ 1200 1800
NoConn ~ 1200 1900
Text Label 2050 1700 0    50   ~ 0
SDA
Text Label 2050 1600 0    50   ~ 0
SCL
NoConn ~ 2000 1500
NoConn ~ 2000 1800
Wire Wire Line
	6950 1050 7050 1050
Text Label 7050 1000 1    50   ~ 0
trigger
Wire Wire Line
	7050 1000 7050 1050
Connection ~ 7050 1050
Wire Wire Line
	7050 1050 7100 1050
Text Label 2050 1900 0    50   ~ 0
trigger
Text Label 2050 2100 0    50   ~ 0
MISO
Text Label 2050 2200 0    50   ~ 0
CS
Text Label 2050 2300 0    50   ~ 0
SSR
Wire Wire Line
	2000 1600 2050 1600
Wire Wire Line
	2000 1700 2050 1700
Wire Wire Line
	2000 1900 2050 1900
Wire Wire Line
	2000 2000 2050 2000
Wire Wire Line
	2000 2100 2050 2100
Wire Wire Line
	2000 2200 2050 2200
Wire Wire Line
	2000 2300 2050 2300
$Comp
L Device:R_Potentiometer RV1
U 1 1 60100A32
P 2300 1050
F 0 "RV1" V 2093 1050 50  0000 C CNN
F 1 "10k" V 2184 1050 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alpha_RD901F-40-00D_Single_Vertical" H 2300 1050 50  0001 C CNN
F 3 "~" H 2300 1050 50  0001 C CNN
	1    2300 1050
	0    1    1    0   
$EndComp
Text Label 2050 2000 0    50   ~ 0
SCK
Text Notes 3000 1800 0    50   ~ 0
MAX6675 HW-550
Text Notes 3050 650  0    50   ~ 0
OLED SSD1306/1315
Text Notes 600  650  0    50   ~ 0
Wemos D1 Mini
Wire Notes Line
	500  500  7850 500 
Wire Notes Line
	7850 500  7850 3050
Wire Notes Line
	7850 3050 500  3050
Wire Notes Line
	500  3050 500  500 
Wire Notes Line
	2950 500  2950 3050
Wire Notes Line
	2950 1650 7850 1650
Wire Notes Line
	4700 500  4700 3050
Wire Notes Line
	6150 500  6150 3050
Text Notes 6250 650  0    50   ~ 0
Trigger button
Text Notes 4800 650  0    50   ~ 0
Connector SSR
Text Notes 4800 1800 0    50   ~ 0
Connector power supply
Text Notes 6500 1800 0    50   ~ 0
Mountingholes NO pad
$EndSCHEMATC
