EESchema Schematic File Version 4
LIBS:nucleo-cache
EELAYER 26 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Nucleo Weather Breakout"
Date "2018-12-28"
Rev "0.3"
Comp "@alvaroprieto"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_Small R3
U 1 1 5BA98024
P 2500 4350
F 0 "R3" V 2400 4350 50  0000 C CNN
F 1 "1k" V 2500 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2500 4350 50  0001 C CNN
F 3 "~" H 2500 4350 50  0001 C CNN
F 4 "311-1.00KHRCT-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "RC0603FR-071KL " H 0   0   50  0001 C CNN "MPN"
	1    2500 4350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5BA980D8
P 2500 4450
F 0 "R4" V 2400 4500 50  0000 R CNN
F 1 "1k" V 2500 4500 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2500 4450 50  0001 C CNN
F 3 "~" H 2500 4450 50  0001 C CNN
F 4 "311-1.00KHRCT-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "RC0603FR-071KL " H 0   0   50  0001 C CNN "MPN"
	1    2500 4450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5BA98119
P 2500 4850
F 0 "R5" V 2450 5000 50  0000 C CNN
F 1 "1k" V 2500 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2500 4850 50  0001 C CNN
F 3 "~" H 2500 4850 50  0001 C CNN
F 4 "311-1.00KHRCT-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "RC0603FR-071KL " H 0   0   50  0001 C CNN "MPN"
	1    2500 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R6
U 1 1 5BA98159
P 2500 4950
F 0 "R6" V 2450 5100 50  0000 C CNN
F 1 "1k" V 2500 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2500 4950 50  0001 C CNN
F 3 "~" H 2500 4950 50  0001 C CNN
F 4 "311-1.00KHRCT-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "RC0603FR-071KL " H 0   0   50  0001 C CNN "MPN"
	1    2500 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5BA98175
P 2500 5150
F 0 "R1" V 2550 5050 50  0000 R CNN
F 1 "1k" V 2500 5200 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2500 5150 50  0001 C CNN
F 3 "~" H 2500 5150 50  0001 C CNN
F 4 "311-1.00KHRCT-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "RC0603FR-071KL " H 0   0   50  0001 C CNN "MPN"
	1    2500 5150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5BA981DC
P 2500 5050
F 0 "R2" V 2450 5250 50  0000 R CNN
F 1 "1k" V 2500 5100 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2500 5050 50  0001 C CNN
F 3 "~" H 2500 5050 50  0001 C CNN
F 4 "311-1.00KHRCT-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "RC0603FR-071KL " H 0   0   50  0001 C CNN "MPN"
	1    2500 5050
	0    1    1    0   
$EndComp
NoConn ~ 2100 4150
NoConn ~ 2100 4250
NoConn ~ 2100 4550
NoConn ~ 2100 4650
NoConn ~ 2100 4750
NoConn ~ 2100 5250
Wire Wire Line
	2100 4350 2400 4350
Wire Wire Line
	2400 4850 2100 4850
Wire Wire Line
	2100 4950 2400 4950
Wire Wire Line
	2100 5050 2400 5050
$Comp
L power:GND #PWR02
U 1 1 5BA989BE
P 2750 4450
F 0 "#PWR02" H 2750 4200 50  0001 C CNN
F 1 "GND" H 2755 4277 50  0000 C CNN
F 2 "" H 2750 4450 50  0001 C CNN
F 3 "" H 2750 4450 50  0001 C CNN
	1    2750 4450
	0    -1   -1   0   
$EndComp
Text Label 2950 4350 0    50   ~ 0
RAIN
$Comp
L alvarop:MIC550X U1
U 1 1 5BA99744
P 5850 1550
F 0 "U1" H 5850 2087 60  0000 C CNN
F 1 "MIC550X" H 5850 1981 60  0000 C CNN
F 2 "alvarop:SOT-23(M5)" H 5850 1550 60  0001 C CNN
F 3 "" H 5850 1550 60  0000 C CNN
F 4 "576-4764-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "MIC5504-3.3YM5-TR" H 0   0   50  0001 C CNN "MPN"
	1    5850 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR023
U 1 1 5BA99856
P 6550 1150
F 0 "#PWR023" H 6550 1000 50  0001 C CNN
F 1 "+3.3V" H 6565 1323 50  0000 C CNN
F 2 "" H 6550 1150 50  0001 C CNN
F 3 "" H 6550 1150 50  0001 C CNN
	1    6550 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 1300 6400 1300
Wire Wire Line
	6550 1300 6550 1150
NoConn ~ 6250 1400
$Comp
L power:GND #PWR022
U 1 1 5BA99C01
P 5850 1850
F 0 "#PWR022" H 5850 1600 50  0001 C CNN
F 1 "GND" H 5855 1677 50  0000 C CNN
F 2 "" H 5850 1850 50  0001 C CNN
F 3 "" H 5850 1850 50  0001 C CNN
	1    5850 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1850 5850 1800
Wire Wire Line
	5400 1300 5450 1300
Wire Wire Line
	5400 1300 5400 1400
Wire Wire Line
	5400 1400 5450 1400
Wire Wire Line
	5400 1300 5200 1300
Connection ~ 5400 1300
$Comp
L Device:C_Small C2
U 1 1 5BA9A53F
P 5200 1500
F 0 "C2" H 5292 1546 50  0000 L CNN
F 1 "1uF" H 5292 1455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5200 1500 50  0001 C CNN
F 3 "~" H 5200 1500 50  0001 C CNN
F 4 "490-1536-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "GRM188R61C105KA93D" H 0   0   50  0001 C CNN "MPN"
	1    5200 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5BA9A5CD
P 6400 1500
F 0 "C5" H 6492 1546 50  0000 L CNN
F 1 "1uF" H 6492 1455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6400 1500 50  0001 C CNN
F 3 "~" H 6400 1500 50  0001 C CNN
F 4 "490-1536-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "GRM188R61C105KA93D" H 0   0   50  0001 C CNN "MPN"
	1    6400 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1400 6400 1300
Connection ~ 6400 1300
Wire Wire Line
	6400 1300 6550 1300
Wire Wire Line
	5200 1400 5200 1300
Connection ~ 5200 1300
Wire Wire Line
	5200 1800 5850 1800
Wire Wire Line
	5200 1600 5200 1800
Connection ~ 5850 1800
Wire Wire Line
	5850 1800 5850 1750
Wire Wire Line
	5850 1800 6400 1800
Wire Wire Line
	6400 1800 6400 1600
Wire Wire Line
	3150 9550 3750 9550
Text Label 3750 9550 2    50   ~ 0
GPS_PPS
Text Label 2650 10900 1    50   ~ 0
GPS_TXD
Text Label 2750 10900 1    50   ~ 0
GPS_RXD
$Comp
L power:+3.3V #PWR05
U 1 1 5BAA1873
P 6350 8100
F 0 "#PWR05" H 6350 7950 50  0001 C CNN
F 1 "+3.3V" H 6365 8273 50  0000 C CNN
F 2 "" H 6350 8100 50  0001 C CNN
F 3 "" H 6350 8100 50  0001 C CNN
	1    6350 8100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5BAA4B12
P 6350 8550
F 0 "#PWR06" H 6350 8300 50  0001 C CNN
F 1 "GND" H 6355 8377 50  0000 C CNN
F 2 "" H 6350 8550 50  0001 C CNN
F 3 "" H 6350 8550 50  0001 C CNN
	1    6350 8550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 8400 7650 8400
Wire Wire Line
	7300 8300 7650 8300
Text Label 7650 8400 2    50   ~ 0
SCL
Text Label 7650 8300 2    50   ~ 0
SDA
$Comp
L Device:R_Small R8
U 1 1 5BAA5FBB
P 6650 7000
F 0 "R8" H 6591 6954 50  0000 R CNN
F 1 "4.7k" V 6750 7050 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6650 7000 50  0001 C CNN
F 3 "~" H 6650 7000 50  0001 C CNN
F 4 "311-4.7KGRCT-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 " RC0603JR-074K7L" H 0   0   50  0001 C CNN "MPN"
	1    6650 7000
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 5BAA6039
P 6950 7000
F 0 "R9" H 6891 6954 50  0000 R CNN
F 1 "4.7k" V 7050 7050 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6950 7000 50  0001 C CNN
F 3 "~" H 6950 7000 50  0001 C CNN
F 4 "311-4.7KGRCT-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 " RC0603JR-074K7L" H 0   0   50  0001 C CNN "MPN"
	1    6950 7000
	-1   0    0    1   
$EndComp
Wire Wire Line
	6650 6900 6650 6800
Wire Wire Line
	6650 6800 6800 6800
Wire Wire Line
	6950 6800 6950 6900
Wire Wire Line
	6800 6800 6800 6750
Connection ~ 6800 6800
Wire Wire Line
	6800 6800 6950 6800
Wire Wire Line
	6650 7100 6650 7300
Wire Wire Line
	6650 7300 7100 7300
Wire Wire Line
	6950 7100 6950 7200
Wire Wire Line
	6950 7200 7100 7200
Text Label 7100 7200 0    50   ~ 0
SDA
Text Label 7100 7300 0    50   ~ 0
SCL
$Comp
L power:+3.3V #PWR08
U 1 1 5BAA9081
P 6800 6750
F 0 "#PWR08" H 6800 6600 50  0001 C CNN
F 1 "+3.3V" H 6815 6923 50  0000 C CNN
F 2 "" H 6800 6750 50  0001 C CNN
F 3 "" H 6800 6750 50  0001 C CNN
	1    6800 6750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 5BAA91C0
P 6650 9400
F 0 "J6" H 6570 9717 50  0000 C CNN
F 1 "Light" H 6570 9626 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6650 9400 50  0001 C CNN
F 3 "~" H 6650 9400 50  0001 C CNN
	1    6650 9400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6850 9400 7150 9400
Wire Wire Line
	7150 9400 7150 9500
Wire Wire Line
	6850 9500 7000 9500
Wire Wire Line
	7000 9500 7000 9600
$Comp
L power:+3.3V #PWR09
U 1 1 5BAABE26
P 7000 9600
F 0 "#PWR09" H 7000 9450 50  0001 C CNN
F 1 "+3.3V" H 7015 9773 50  0000 C CNN
F 2 "" H 7000 9600 50  0001 C CNN
F 3 "" H 7000 9600 50  0001 C CNN
	1    7000 9600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5BAABEB2
P 7150 9500
F 0 "#PWR010" H 7150 9250 50  0001 C CNN
F 1 "GND" H 7155 9327 50  0000 C CNN
F 2 "" H 7150 9500 50  0001 C CNN
F 3 "" H 7150 9500 50  0001 C CNN
	1    7150 9500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 9300 7150 9300
Text Label 7150 9300 2    50   ~ 0
LIGHT
$Comp
L Connector_Generic:Conn_01x04 J7
U 1 1 5BAAE247
P 8500 8300
F 0 "J7" H 8420 8617 50  0000 C CNN
F 1 "AM2315" H 8420 8526 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 8500 8300 50  0001 C CNN
F 3 "~" H 8500 8300 50  0001 C CNN
	1    8500 8300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8700 8200 9000 8200
Wire Wire Line
	8700 8300 9000 8300
Wire Wire Line
	8700 8400 9100 8400
Wire Wire Line
	9100 8400 9100 8300
Wire Wire Line
	8700 8500 9100 8500
Wire Wire Line
	9100 8500 9100 8550
$Comp
L power:+3.3V #PWR013
U 1 1 5BAB2902
P 9100 8300
F 0 "#PWR013" H 9100 8150 50  0001 C CNN
F 1 "+3.3V" H 9115 8473 50  0000 C CNN
F 2 "" H 9100 8300 50  0001 C CNN
F 3 "" H 9100 8300 50  0001 C CNN
	1    9100 8300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5BAB2955
P 9100 8550
F 0 "#PWR014" H 9100 8300 50  0001 C CNN
F 1 "GND" H 9105 8377 50  0000 C CNN
F 2 "" H 9100 8550 50  0001 C CNN
F 3 "" H 9100 8550 50  0001 C CNN
	1    9100 8550
	1    0    0    -1  
$EndComp
Text Label 9000 8300 2    50   ~ 0
SDA
Text Label 9000 8200 2    50   ~ 0
SCL
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 5BAB4149
P 3550 2350
F 0 "J5" H 3470 2667 50  0000 C CNN
F 1 "Power" H 3470 2576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3550 2350 50  0001 C CNN
F 3 "~" H 3550 2350 50  0001 C CNN
	1    3550 2350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3750 2350 4100 2350
Wire Wire Line
	4100 2350 4100 2450
Wire Wire Line
	3750 2250 4100 2250
Wire Wire Line
	4100 2250 4100 2150
Wire Wire Line
	3750 2450 4000 2450
Text Label 4000 2450 2    50   ~ 0
5V
$Comp
L power:+3.3V #PWR011
U 1 1 5BAB8AA0
P 4100 2150
F 0 "#PWR011" H 4100 2000 50  0001 C CNN
F 1 "+3.3V" H 4115 2323 50  0000 C CNN
F 2 "" H 4100 2150 50  0001 C CNN
F 3 "" H 4100 2150 50  0001 C CNN
	1    4100 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5BAB8AD3
P 4100 2450
F 0 "#PWR012" H 4100 2200 50  0001 C CNN
F 1 "GND" H 4105 2277 50  0000 C CNN
F 2 "" H 4100 2450 50  0001 C CNN
F 3 "" H 4100 2450 50  0001 C CNN
	1    4100 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 4250 10700 4050
Wire Wire Line
	12000 5150 11600 5150
Wire Wire Line
	11600 5150 11600 5250
$Comp
L power:GND #PWR021
U 1 1 5BABEBCB
P 11600 5250
F 0 "#PWR021" H 11600 5000 50  0001 C CNN
F 1 "GND" H 11605 5077 50  0000 C CNN
F 2 "" H 11600 5250 50  0001 C CNN
F 3 "" H 11600 5250 50  0001 C CNN
	1    11600 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	12000 4450 11650 4450
Wire Wire Line
	11650 4350 12000 4350
Text Label 11650 4350 0    50   ~ 0
XB_TX
Text Label 11650 4450 0    50   ~ 0
XB_RX
$Comp
L power:+3.3V #PWR017
U 1 1 5BAC41ED
P 10700 4050
F 0 "#PWR017" H 10700 3900 50  0001 C CNN
F 1 "+3.3V" H 10715 4223 50  0000 C CNN
F 2 "" H 10700 4050 50  0001 C CNN
F 3 "" H 10700 4050 50  0001 C CNN
	1    10700 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5BAC4222
P 10700 4450
F 0 "C1" H 10792 4496 50  0000 L CNN
F 1 "1uF" H 10792 4405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10700 4450 50  0001 C CNN
F 3 "~" H 10700 4450 50  0001 C CNN
F 4 "490-1536-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "GRM188R61C105KA93D" H 0   0   50  0001 C CNN "MPN"
	1    10700 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 4550 10700 4650
$Comp
L power:GND #PWR018
U 1 1 5BACD3AA
P 10700 4750
F 0 "#PWR018" H 10700 4500 50  0001 C CNN
F 1 "GND" H 10705 4577 50  0000 C CNN
F 2 "" H 10700 4750 50  0001 C CNN
F 3 "" H 10700 4750 50  0001 C CNN
	1    10700 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5BACD3E1
P 11000 4450
F 0 "C3" H 11092 4496 50  0000 L CNN
F 1 "8.2pF" H 11092 4405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 11000 4450 50  0001 C CNN
F 3 "~" H 11000 4450 50  0001 C CNN
F 4 "1276-2350-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "CL10C8R2DB8NNNC" H 0   0   50  0001 C CNN "MPN"
	1    11000 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5BAD2D9C
P 11400 4450
F 0 "C4" H 11492 4496 50  0000 L CNN
F 1 "10uF" H 11492 4405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 11400 4450 50  0001 C CNN
F 3 "~" H 11400 4450 50  0001 C CNN
F 4 "490-3896-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "GRM188R60J106ME47D" H 0   0   50  0001 C CNN "MPN"
	1    11400 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 4350 11000 4250
Connection ~ 11000 4250
Wire Wire Line
	11000 4250 10700 4250
Wire Wire Line
	11000 4550 11000 4650
Wire Wire Line
	11000 4650 10700 4650
Connection ~ 10700 4650
Wire Wire Line
	10700 4650 10700 4750
Wire Wire Line
	11000 4650 11400 4650
Wire Wire Line
	11400 4650 11400 4550
Connection ~ 11000 4650
$Comp
L alvarop:NUCLEO_L476RG U2
U 1 1 5BAE1EA5
P 10050 1450
F 0 "U2" H 10650 1740 60  0000 C CNN
F 1 "NUCLEO_L476RG" H 10650 1634 60  0000 C CNN
F 2 "alvarop:NUCLEO_L476RG" H 10050 1450 50  0001 C CNN
F 3 "" H 10050 1450 50  0001 C CNN
F 4 "SAM1086-19-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 " CES-119-01-T-D " H 0   0   50  0001 C CNN "MPN"
	1    10050 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	11250 2350 11550 2350
Wire Wire Line
	11550 2350 11550 2450
Wire Wire Line
	11550 2450 11250 2450
Wire Wire Line
	11550 2350 11850 2350
Wire Wire Line
	11850 2350 11850 2450
Connection ~ 11550 2350
Wire Wire Line
	11250 1750 11850 1750
Wire Wire Line
	11850 1750 11850 1850
Wire Wire Line
	10050 2350 9600 2350
Wire Wire Line
	9250 2350 9250 2450
Wire Wire Line
	12700 1850 12300 1850
Wire Wire Line
	12300 1850 12300 1950
Wire Wire Line
	13700 2350 14300 2350
Wire Wire Line
	14300 2350 14300 2450
$Comp
L power:GND #PWR020
U 1 1 5BAF5FBA
P 9250 2450
F 0 "#PWR020" H 9250 2200 50  0001 C CNN
F 1 "GND" H 9255 2277 50  0000 C CNN
F 2 "" H 9250 2450 50  0001 C CNN
F 3 "" H 9250 2450 50  0001 C CNN
	1    9250 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5BAF5FF9
P 11850 1850
F 0 "#PWR024" H 11850 1600 50  0001 C CNN
F 1 "GND" H 11855 1677 50  0000 C CNN
F 2 "" H 11850 1850 50  0001 C CNN
F 3 "" H 11850 1850 50  0001 C CNN
	1    11850 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5BAF6052
P 11850 2450
F 0 "#PWR025" H 11850 2200 50  0001 C CNN
F 1 "GND" H 11855 2277 50  0000 C CNN
F 2 "" H 11850 2450 50  0001 C CNN
F 3 "" H 11850 2450 50  0001 C CNN
	1    11850 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5BAF6091
P 12300 1950
F 0 "#PWR026" H 12300 1700 50  0001 C CNN
F 1 "GND" H 12305 1777 50  0000 C CNN
F 2 "" H 12300 1950 50  0001 C CNN
F 3 "" H 12300 1950 50  0001 C CNN
	1    12300 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 5BAF60EA
P 14300 2450
F 0 "#PWR027" H 14300 2200 50  0001 C CNN
F 1 "GND" H 14305 2277 50  0000 C CNN
F 2 "" H 14300 2450 50  0001 C CNN
F 3 "" H 14300 2450 50  0001 C CNN
	1    14300 2450
	1    0    0    -1  
$EndComp
Text Label 11650 2250 2    50   ~ 0
5V
Wire Wire Line
	11650 2250 11450 2250
NoConn ~ 10050 2550
NoConn ~ 10050 2650
NoConn ~ 10050 2750
NoConn ~ 10050 2050
NoConn ~ 10050 2150
NoConn ~ 12700 1950
Wire Wire Line
	11250 2850 11650 2850
Text Label 11650 2850 2    50   ~ 0
WDIR
Wire Wire Line
	10050 1550 9650 1550
Wire Wire Line
	11250 1550 11600 1550
Text Label 9650 1550 0    50   ~ 0
WSPEED
Text Label 11600 1550 2    50   ~ 0
RAIN
Wire Wire Line
	10050 1450 9650 1450
Wire Wire Line
	11250 1450 11600 1450
Text Label 9650 1450 0    50   ~ 0
XB_RX
Text Label 11600 1450 2    50   ~ 0
XB_TX
Wire Wire Line
	12700 2450 12300 2450
Wire Wire Line
	12700 3050 12300 3050
Text Label 12300 2450 0    50   ~ 0
GPS_RXD
Text Label 12300 3050 0    50   ~ 0
GPS_TXD
Wire Wire Line
	11250 2950 11650 2950
Text Label 11650 2950 2    50   ~ 0
LIGHT
Wire Wire Line
	12700 1550 12300 1550
Wire Wire Line
	12700 1650 12300 1650
Text Label 12300 1650 0    50   ~ 0
SDA
Text Label 12300 1550 0    50   ~ 0
SCL
Wire Wire Line
	11400 4250 11000 4250
Wire Wire Line
	12000 4250 11400 4250
Connection ~ 11400 4250
Wire Wire Line
	11400 4350 11400 4250
Connection ~ 10700 4250
Wire Wire Line
	10700 4350 10700 4250
$Comp
L power:+3.3V #PWR019
U 1 1 5BB7DE83
P 11000 4950
F 0 "#PWR019" H 11000 4800 50  0001 C CNN
F 1 "+3.3V" H 11015 5123 50  0000 C CNN
F 2 "" H 11000 4950 50  0001 C CNN
F 3 "" H 11000 4950 50  0001 C CNN
	1    11000 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R10
U 1 1 5BB7DEC2
P 11000 5150
F 0 "R10" H 10941 5104 50  0000 R CNN
F 1 "10k" V 11100 5200 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11000 5150 50  0001 C CNN
F 3 "~" H 11000 5150 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "RC0603FR-0710KL" H 0   0   50  0001 C CNN "MPN"
	1    11000 5150
	-1   0    0    1   
$EndComp
Wire Wire Line
	11000 5050 11000 4950
Wire Wire Line
	11000 5250 11000 5350
Wire Wire Line
	11200 5350 11200 4750
Wire Wire Line
	11200 4750 11700 4750
Wire Wire Line
	11700 4750 11700 4650
Wire Wire Line
	11700 4650 12000 4650
Wire Wire Line
	11000 5350 11200 5350
Wire Wire Line
	11000 5350 10600 5350
Connection ~ 11000 5350
Text Label 10600 5350 0    50   ~ 0
XB_nRST
Text Label 14100 1550 2    50   ~ 0
XB_nRST
Wire Wire Line
	12800 4950 13200 4950
Text Label 13200 4950 2    50   ~ 0
XB_ON
Wire Wire Line
	12700 1450 12300 1450
NoConn ~ 10050 1650
NoConn ~ 10050 1750
NoConn ~ 10050 2450
NoConn ~ 10050 2850
NoConn ~ 10050 2950
NoConn ~ 10050 3050
NoConn ~ 11250 3050
NoConn ~ 11250 2750
NoConn ~ 11250 2550
NoConn ~ 11250 2150
NoConn ~ 11250 2050
NoConn ~ 11250 1950
NoConn ~ 12700 1750
NoConn ~ 12700 2050
NoConn ~ 12700 2150
NoConn ~ 12700 2250
NoConn ~ 12700 2350
NoConn ~ 12700 3250
NoConn ~ 13700 2950
NoConn ~ 13700 2650
NoConn ~ 13700 2550
NoConn ~ 13700 2450
NoConn ~ 13700 2250
NoConn ~ 13700 2150
NoConn ~ 13700 2050
NoConn ~ 13700 1950
NoConn ~ 13700 1750
NoConn ~ 13700 1650
NoConn ~ 11250 3150
NoConn ~ 11250 1650
NoConn ~ 10050 2250
NoConn ~ 12000 4550
NoConn ~ 12000 4750
NoConn ~ 12000 4850
NoConn ~ 12800 5150
NoConn ~ 12800 5050
NoConn ~ 12800 4750
NoConn ~ 12800 4650
NoConn ~ 12800 4550
NoConn ~ 12800 4450
NoConn ~ 12800 4350
NoConn ~ 12800 4250
Wire Wire Line
	10050 3250 9650 3250
Text Label 9650 3150 0    50   ~ 0
GPS_PPS
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5BC7DA90
P 11450 2250
F 0 "#FLG0101" H 11450 2325 50  0001 C CNN
F 1 "PWR_FLAG" H 11450 2424 50  0000 C CNN
F 2 "" H 11450 2250 50  0001 C CNN
F 3 "~" H 11450 2250 50  0001 C CNN
	1    11450 2250
	1    0    0    -1  
$EndComp
Connection ~ 11450 2250
Wire Wire Line
	11450 2250 11250 2250
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5BC7DCAA
P 9600 2350
F 0 "#FLG0102" H 9600 2425 50  0001 C CNN
F 1 "PWR_FLAG" H 9600 2524 50  0000 C CNN
F 2 "" H 9600 2350 50  0001 C CNN
F 3 "~" H 9600 2350 50  0001 C CNN
	1    9600 2350
	1    0    0    -1  
$EndComp
Connection ~ 9600 2350
Wire Wire Line
	9600 2350 9250 2350
$Comp
L Device:C_Small C10
U 1 1 5BE7FE9B
P 2800 4150
F 0 "C10" H 2892 4196 50  0000 L CNN
F 1 "0.01 uF" H 2892 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2800 4150 50  0001 C CNN
F 3 "~" H 2800 4150 50  0001 C CNN
F 4 "311-1085-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "CC0603KRX7R9BB103" H 0   0   50  0001 C CNN "MPN"
	1    2800 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 4050 2800 4000
$Comp
L power:GND #PWR0101
U 1 1 5BE8D006
P 2800 4000
F 0 "#PWR0101" H 2800 3750 50  0001 C CNN
F 1 "GND" H 2805 3827 50  0000 C CNN
F 2 "" H 2800 4000 50  0001 C CNN
F 3 "" H 2800 4000 50  0001 C CNN
	1    2800 4000
	-1   0    0    1   
$EndComp
$Comp
L alvarop:XBEE_S2C U3
U 1 1 5BABB5CF
P 12400 4750
F 0 "U3" H 12400 5515 50  0000 C CNN
F 1 "XBEE_S2C" H 12400 5424 50  0000 C CNN
F 2 "alvarop:XBEE_S2C_TH" H 12400 4750 50  0001 C CNN
F 3 "" H 12400 4750 50  0001 C CNN
F 4 "1528-1392-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "366" H 0   0   50  0001 C CNN "MPN"
	1    12400 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	12000 5050 11650 5050
Text Label 11650 5050 0    50   ~ 0
XB_nSBY
Wire Wire Line
	13700 1550 14100 1550
Text Label 14100 1450 2    50   ~ 0
XB_nSBY
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5C200DAC
P 4800 1050
F 0 "J2" V 4766 862 50  0000 R CNN
F 1 "Conn_01x02" V 4675 862 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4800 1050 50  0001 C CNN
F 3 "~" H 4800 1050 50  0001 C CNN
	1    4800 1050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4900 1300 4900 1250
Wire Wire Line
	4900 1300 5200 1300
Wire Wire Line
	4800 1250 4800 1300
Wire Wire Line
	4800 1300 4600 1300
Text Label 4600 1300 2    50   ~ 0
5V
$Comp
L Connector_Generic:Conn_01x12 J1
U 1 1 5C20BE5F
P 1900 4650
F 0 "J1" H 1820 5367 50  0000 C CNN
F 1 "windrain" H 1820 5276 50  0000 C CNN
F 2 "alvarop:043814-6621" H 1900 4650 50  0001 C CNN
F 3 "~" H 1900 4650 50  0001 C CNN
F 4 "WM4232-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "0438146621" H 0   0   50  0001 C CNN "MPN"
	1    1900 4650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2600 4350 2800 4350
Wire Wire Line
	2800 4250 2800 4350
Connection ~ 2800 4350
Wire Wire Line
	2800 4350 2950 4350
Wire Wire Line
	2100 4450 2400 4450
Wire Wire Line
	2600 4450 2750 4450
Wire Wire Line
	2100 5150 2400 5150
$Comp
L alvarop:M10578-A2 U4
U 1 1 5C2DC759
P 2600 9600
F 0 "U4" H 2150 10000 60  0000 L CNN
F 1 "M10578-A2" H 1800 10100 60  0000 L CNN
F 2 "alvarop:M10578-A2" H 2050 9750 50  0001 C CNN
F 3 "" H 2050 9750 50  0001 C CNN
F 4 "627-1073-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "M10578-A2" H 0   0   50  0001 C CNN "MPN"
	1    2600 9600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5C3063FF
P 3200 9450
F 0 "#PWR0104" H 3200 9200 50  0001 C CNN
F 1 "GND" H 3205 9277 50  0000 C CNN
F 2 "" H 3200 9450 50  0001 C CNN
F 3 "" H 3200 9450 50  0001 C CNN
	1    3200 9450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5C30650F
P 2750 9000
F 0 "#PWR0105" H 2750 8750 50  0001 C CNN
F 1 "GND" H 2755 8827 50  0000 C CNN
F 2 "" H 2750 9000 50  0001 C CNN
F 3 "" H 2750 9000 50  0001 C CNN
	1    2750 9000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5C31B15B
P 2450 9000
F 0 "#PWR0106" H 2450 8750 50  0001 C CNN
F 1 "GND" H 2455 8827 50  0000 C CNN
F 2 "" H 2450 9000 50  0001 C CNN
F 3 "" H 2450 9000 50  0001 C CNN
	1    2450 9000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5C31B2E4
P 2000 9450
F 0 "#PWR0107" H 2000 9200 50  0001 C CNN
F 1 "GND" H 2005 9277 50  0000 C CNN
F 2 "" H 2000 9450 50  0001 C CNN
F 3 "" H 2000 9450 50  0001 C CNN
	1    2000 9450
	0    1    1    0   
$EndComp
Wire Wire Line
	3200 9450 3150 9450
Wire Wire Line
	2750 9050 2750 9000
Wire Wire Line
	2450 9050 2450 9000
Wire Wire Line
	2000 9450 2050 9450
Wire Wire Line
	2550 9050 2450 9050
Connection ~ 2450 9050
$Comp
L power:+3.3V #PWR0108
U 1 1 5C3410BE
P 1200 9400
F 0 "#PWR0108" H 1200 9250 50  0001 C CNN
F 1 "+3.3V" H 1215 9573 50  0000 C CNN
F 2 "" H 1200 9400 50  0001 C CNN
F 3 "" H 1200 9400 50  0001 C CNN
	1    1200 9400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 9550 1650 9550
Wire Wire Line
	1200 9550 1200 9400
Wire Wire Line
	3150 9650 3200 9650
Wire Wire Line
	3150 9750 3350 9750
Text Label 3750 9650 2    50   ~ 0
GPS_nRST
Text Label 3750 9750 2    50   ~ 0
GPS_SBY
Wire Wire Line
	2050 9750 1700 9750
Text Label 1700 9750 0    50   ~ 0
GPS_FIX
$Comp
L Device:C_Small C13
U 1 1 5C36B783
P 3200 9950
F 0 "C13" H 3000 10000 50  0000 L CNN
F 1 "22pF" H 2950 9900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3200 9950 50  0001 C CNN
F 3 "~" H 3200 9950 50  0001 C CNN
F 4 "1276-2228-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "CL10C220JB8NFNC" H 0   0   50  0001 C CNN "MPN"
	1    3200 9950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C15
U 1 1 5C371D98
P 3350 9950
F 0 "C15" H 3442 9996 50  0000 L CNN
F 1 "22pF" H 3442 9905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3350 9950 50  0001 C CNN
F 3 "~" H 3350 9950 50  0001 C CNN
F 4 "1276-2228-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "CL10C220JB8NFNC" H 0   0   50  0001 C CNN "MPN"
	1    3350 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 9850 3200 9650
Connection ~ 3200 9650
Wire Wire Line
	3200 9650 3750 9650
Wire Wire Line
	3350 9850 3350 9750
Connection ~ 3350 9750
Wire Wire Line
	3350 9750 3750 9750
$Comp
L Device:C_Small C6
U 1 1 5C38BEC3
P 1200 9750
F 0 "C6" H 1000 9800 50  0000 L CNN
F 1 "22pF" H 950 9700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1200 9750 50  0001 C CNN
F 3 "~" H 1200 9750 50  0001 C CNN
F 4 "1276-2228-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "CL10C220JB8NFNC" H 0   0   50  0001 C CNN "MPN"
	1    1200 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 9650 1200 9550
Connection ~ 1200 9550
$Comp
L Device:C_Small C7
U 1 1 5C3ADDB4
P 1350 9750
F 0 "C7" H 1400 9800 50  0000 L CNN
F 1 "2.2uF" H 1400 9700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1350 9750 50  0001 C CNN
F 3 "~" H 1350 9750 50  0001 C CNN
F 4 "1276-1085-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "CL10A225KP8NNNC" H 0   0   50  0001 C CNN "MPN"
	1    1350 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 9650 1350 9550
Connection ~ 1350 9550
Wire Wire Line
	1350 9550 1200 9550
$Comp
L Device:R_Small R11
U 1 1 5C3D08F8
P 2250 10200
F 0 "R11" H 2191 10154 50  0000 R CNN
F 1 "10k" V 2350 10250 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2250 10200 50  0001 C CNN
F 3 "~" H 2250 10200 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "RC0603FR-0710KL" H 0   0   50  0001 C CNN "MPN"
	1    2250 10200
	0    -1   -1   0   
$EndComp
NoConn ~ 2550 10150
Wire Wire Line
	2450 10150 2450 10200
Wire Wire Line
	2450 10200 2350 10200
$Comp
L power:GND #PWR0109
U 1 1 5C4094BA
P 2000 10200
F 0 "#PWR0109" H 2000 9950 50  0001 C CNN
F 1 "GND" H 2005 10027 50  0000 C CNN
F 2 "" H 2000 10200 50  0001 C CNN
F 3 "" H 2000 10200 50  0001 C CNN
	1    2000 10200
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 10200 2150 10200
$Comp
L Device:L_Small L2
U 1 1 5C41F42C
P 2750 10300
F 0 "L2" H 2798 10346 50  0000 L CNN
F 1 "47nH" H 2798 10255 50  0000 L CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 2750 10300 50  0001 C CNN
F 3 "~" H 2750 10300 50  0001 C CNN
F 4 " ‎L-14C47NJV4T" H 2750 10300 50  0001 C CNN "MPN"
F 5 "712-1442-1-ND‎" H 2750 10300 50  0001 C CNN "DKPN"
	1    2750 10300
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Small L1
U 1 1 5C41F6C3
P 2650 10300
F 0 "L1" H 2550 10350 50  0000 L CNN
F 1 "47nH" H 2450 10250 50  0000 L CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 2650 10300 50  0001 C CNN
F 3 "~" H 2650 10300 50  0001 C CNN
F 4 " ‎L-14C47NJV4T" H 2650 10300 50  0001 C CNN "MPN"
F 5 "712-1442-1-ND‎" H 2650 10300 50  0001 C CNN "DKPN"
	1    2650 10300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 10200 2650 10150
Wire Wire Line
	2750 10150 2750 10200
$Comp
L power:GND #PWR0110
U 1 1 5C43D38D
P 1350 9900
F 0 "#PWR0110" H 1350 9650 50  0001 C CNN
F 1 "GND" H 1355 9727 50  0000 C CNN
F 2 "" H 1350 9900 50  0001 C CNN
F 3 "" H 1350 9900 50  0001 C CNN
	1    1350 9900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 9900 1350 9850
$Comp
L power:GND #PWR0111
U 1 1 5C44C598
P 1200 9900
F 0 "#PWR0111" H 1200 9650 50  0001 C CNN
F 1 "GND" H 1205 9727 50  0000 C CNN
F 2 "" H 1200 9900 50  0001 C CNN
F 3 "" H 1200 9900 50  0001 C CNN
	1    1200 9900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 9900 1200 9850
$Comp
L power:GND #PWR0112
U 1 1 5C453FB6
P 3200 10100
F 0 "#PWR0112" H 3200 9850 50  0001 C CNN
F 1 "GND" H 3205 9927 50  0000 C CNN
F 2 "" H 3200 10100 50  0001 C CNN
F 3 "" H 3200 10100 50  0001 C CNN
	1    3200 10100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 10100 3200 10050
$Comp
L power:GND #PWR0113
U 1 1 5C45BAD3
P 3350 10100
F 0 "#PWR0113" H 3350 9850 50  0001 C CNN
F 1 "GND" H 3355 9927 50  0000 C CNN
F 2 "" H 3350 10100 50  0001 C CNN
F 3 "" H 3350 10100 50  0001 C CNN
	1    3350 10100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 10100 3350 10050
Wire Wire Line
	2650 10400 2650 10500
Wire Wire Line
	2750 10400 2750 10500
$Comp
L Device:C_Small C8
U 1 1 5C49A0FB
P 2450 10500
F 0 "C8" H 2250 10550 50  0000 L CNN
F 1 "22pF" H 2200 10450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2450 10500 50  0001 C CNN
F 3 "~" H 2450 10500 50  0001 C CNN
F 4 "1276-2228-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "CL10C220JB8NFNC" H 0   0   50  0001 C CNN "MPN"
	1    2450 10500
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C11
U 1 1 5C49A200
P 2950 10500
F 0 "C11" H 2750 10550 50  0000 L CNN
F 1 "22pF" H 2700 10450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2950 10500 50  0001 C CNN
F 3 "~" H 2950 10500 50  0001 C CNN
F 4 "1276-2228-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "CL10C220JB8NFNC" H 0   0   50  0001 C CNN "MPN"
	1    2950 10500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2850 10500 2750 10500
Connection ~ 2750 10500
Wire Wire Line
	2750 10500 2750 10900
Wire Wire Line
	2650 10500 2550 10500
Connection ~ 2650 10500
Wire Wire Line
	2650 10500 2650 10900
$Comp
L power:GND #PWR0114
U 1 1 5C4AA323
P 2300 10500
F 0 "#PWR0114" H 2300 10250 50  0001 C CNN
F 1 "GND" H 2305 10327 50  0000 C CNN
F 2 "" H 2300 10500 50  0001 C CNN
F 3 "" H 2300 10500 50  0001 C CNN
	1    2300 10500
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 10500 2350 10500
$Comp
L power:GND #PWR0115
U 1 1 5C4BAD54
P 3100 10500
F 0 "#PWR0115" H 3100 10250 50  0001 C CNN
F 1 "GND" H 3105 10327 50  0000 C CNN
F 2 "" H 3100 10500 50  0001 C CNN
F 3 "" H 3100 10500 50  0001 C CNN
	1    3100 10500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3050 10500 3100 10500
Wire Wire Line
	2050 9650 1650 9650
Wire Wire Line
	1650 9650 1650 9550
Connection ~ 1650 9550
Wire Wire Line
	1650 9550 1350 9550
$Comp
L Device:L_Small L3
U 1 1 5C4EE212
P 2850 8350
F 0 "L3" H 2750 8400 50  0000 L CNN
F 1 "12nH" V 2900 8250 50  0000 L CNN
F 2 "Inductor_SMD:L_0402_1005Metric" H 2850 8350 50  0001 C CNN
F 3 "~" H 2850 8350 50  0001 C CNN
F 4 "‎LQG15HS12NJ02D‎" H 2850 8350 50  0001 C CNN "MPN"
F 5 "490-2624-1-ND‎" H 2850 8350 50  0001 C CNN "DKPN"
	1    2850 8350
	0    -1   -1   0   
$EndComp
$Comp
L Device:L_Small L4
U 1 1 5C508406
P 2850 8650
F 0 "L4" H 2750 8700 50  0000 L CNN
F 1 "DNP" V 2900 8550 50  0000 L CNN
F 2 "Inductor_SMD:L_0402_1005Metric" H 2850 8650 50  0001 C CNN
F 3 "~" H 2850 8650 50  0001 C CNN
	1    2850 8650
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C9
U 1 1 5C53BC28
P 2650 8500
F 0 "C9" H 2450 8550 50  0000 L CNN
F 1 "1.5pF" H 2350 8450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2650 8500 50  0001 C CNN
F 3 "~" H 2650 8500 50  0001 C CNN
F 4 "‎GJM1555C1H1R5CB01D‎" H 2650 8500 50  0001 C CNN "MPN"
F 5 "490-3087-1-ND‎" H 2650 8500 50  0001 C CNN "DKPN"
	1    2650 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 8600 2650 8650
Wire Wire Line
	2750 8650 2650 8650
Connection ~ 2650 8650
Wire Wire Line
	2650 8650 2650 9050
Wire Wire Line
	2750 8350 2650 8350
Wire Wire Line
	2650 8350 2650 8400
Wire Wire Line
	2650 8350 2650 8100
Connection ~ 2650 8350
$Comp
L power:GND #PWR0116
U 1 1 5C57B0C8
P 3000 8650
F 0 "#PWR0116" H 3000 8400 50  0001 C CNN
F 1 "GND" H 3005 8477 50  0000 C CNN
F 2 "" H 3000 8650 50  0001 C CNN
F 3 "" H 3000 8650 50  0001 C CNN
	1    3000 8650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5C57B1F9
P 3000 8350
F 0 "#PWR0117" H 3000 8100 50  0001 C CNN
F 1 "GND" H 3005 8177 50  0000 C CNN
F 2 "" H 3000 8350 50  0001 C CNN
F 3 "" H 3000 8350 50  0001 C CNN
	1    3000 8350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5C57B258
P 2750 8150
F 0 "#PWR0118" H 2750 7900 50  0001 C CNN
F 1 "GND" H 2900 8100 50  0000 C CNN
F 2 "" H 2750 8150 50  0001 C CNN
F 3 "" H 2750 8150 50  0001 C CNN
	1    2750 8150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5C57B411
P 2550 7250
F 0 "#PWR0119" H 2550 7000 50  0001 C CNN
F 1 "GND" H 2555 7077 50  0000 C CNN
F 2 "" H 2550 7250 50  0001 C CNN
F 3 "" H 2550 7250 50  0001 C CNN
	1    2550 7250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5C5A007A
P 2750 7250
F 0 "#PWR0120" H 2750 7000 50  0001 C CNN
F 1 "GND" H 2755 7077 50  0000 C CNN
F 2 "" H 2750 7250 50  0001 C CNN
F 3 "" H 2750 7250 50  0001 C CNN
	1    2750 7250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 7250 2550 7300
Wire Wire Line
	2750 7250 2750 7300
Wire Wire Line
	2750 8100 2750 8150
Wire Wire Line
	2950 8350 3000 8350
Wire Wire Line
	2950 8650 3000 8650
$Comp
L alvarop:SR4G008 ANT1
U 1 1 5C5E4A22
P 2650 7700
F 0 "ANT1" H 2881 7753 60  0000 L CNN
F 1 "SR4G008" H 2881 7647 60  0000 L CNN
F 2 "alvarop:SR4G008" H 2250 7700 50  0001 C CNN
F 3 "" H 2250 7700 50  0001 C CNN
F 4 "627-1063-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "SR4G008" H 0   0   50  0001 C CNN "MPN"
	1    2650 7700
	1    0    0    -1  
$EndComp
$Comp
L alvarop:BMP280 U5
U 1 1 5C5E4B31
P 6900 8350
F 0 "U5" H 6875 8790 60  0000 C CNN
F 1 "BMP280" H 6875 8684 60  0000 C CNN
F 2 "alvarop:BMP280" H 6450 8500 50  0001 C CNN
F 3 "" H 6450 8500 50  0001 C CNN
F 4 "828-1064-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "BMP280" H 0   0   50  0001 C CNN "MPN"
	1    6900 8350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 8500 6350 8500
Wire Wire Line
	6350 8500 6350 8550
Wire Wire Line
	6350 8500 6350 8400
Wire Wire Line
	6350 8400 6450 8400
Connection ~ 6350 8500
Wire Wire Line
	6450 8300 6350 8300
Wire Wire Line
	6350 8300 6350 8200
Wire Wire Line
	6350 8200 6450 8200
Wire Wire Line
	6350 8100 6350 8200
Connection ~ 6350 8200
Wire Wire Line
	7300 8200 7350 8200
$Comp
L power:+3.3V #PWR0121
U 1 1 5C655A4E
P 7350 8100
F 0 "#PWR0121" H 7350 7950 50  0001 C CNN
F 1 "+3.3V" H 7365 8273 50  0000 C CNN
F 2 "" H 7350 8100 50  0001 C CNN
F 3 "" H 7350 8100 50  0001 C CNN
	1    7350 8100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 8100 7350 8200
$Comp
L power:GND #PWR0122
U 1 1 5C675ABB
P 7350 8550
F 0 "#PWR0122" H 7350 8300 50  0001 C CNN
F 1 "GND" H 7355 8377 50  0000 C CNN
F 2 "" H 7350 8550 50  0001 C CNN
F 3 "" H 7350 8550 50  0001 C CNN
	1    7350 8550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 8500 7300 8500
$Comp
L Device:C_Small C16
U 1 1 5C6AC133
P 6250 8350
F 0 "C16" H 6050 8400 50  0000 L CNN
F 1 "0.1uF" H 5950 8300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6250 8350 50  0001 C CNN
F 3 "~" H 6250 8350 50  0001 C CNN
F 4 "490-1532-1-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 "GRM188R71C104KA01D" H 0   0   50  0001 C CNN "MPN"
	1    6250 8350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 8250 6250 8200
Wire Wire Line
	6250 8200 6350 8200
Wire Wire Line
	6250 8450 6250 8500
Wire Wire Line
	6250 8500 6350 8500
Text Notes 6450 8700 0    50   ~ 0
7-bit I2C Addr: 0x76
Text Notes 8200 8650 0    50   ~ 0
7-bit I2C Addr: 0x5C
Wire Wire Line
	7350 8550 7350 8500
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5C20903C
P 4900 1300
F 0 "#FLG0103" H 4900 1375 50  0001 C CNN
F 1 "PWR_FLAG" H 4900 1474 50  0000 C CNN
F 2 "" H 4900 1300 50  0001 C CNN
F 3 "~" H 4900 1300 50  0001 C CNN
	1    4900 1300
	-1   0    0    1   
$EndComp
Connection ~ 4900 1300
Wire Wire Line
	9650 3150 10050 3150
Text Label 14100 3050 2    50   ~ 0
GPS_FIX
Wire Wire Line
	11250 3250 11650 3250
Wire Wire Line
	13700 3050 14100 3050
Text Label 9650 3250 0    50   ~ 0
GPS_nRST
Text Label 11650 3250 2    50   ~ 0
GPS_SBY
$Comp
L alvarop:NUCLEO_L476RG U2
U 2 1 5BAE1FF6
P 12700 1450
F 0 "U2" H 13200 1740 60  0000 C CNN
F 1 "NUCLEO_L476RG" H 13200 1634 60  0000 C CNN
F 2 "alvarop:NUCLEO_L476RG" H 12700 1450 50  0001 C CNN
F 3 "" H 12700 1450 50  0001 C CNN
F 4 "SAM1086-19-ND" H 0   0   50  0001 C CNN "DKPN"
F 5 " CES-119-01-T-D " H 0   0   50  0001 C CNN "MPN"
	2    12700 1450
	1    0    0    -1  
$EndComp
NoConn ~ 12700 2550
NoConn ~ 12700 2650
NoConn ~ 12700 2750
NoConn ~ 12700 2850
NoConn ~ 12700 2950
NoConn ~ 12700 3150
Wire Wire Line
	13700 1450 14100 1450
Text Label 12300 1450 0    50   ~ 0
XB_ON
NoConn ~ 13700 2750
NoConn ~ 13700 2850
$Comp
L power:GND #PWR?
U 1 1 5C27B36D
P 2850 4750
F 0 "#PWR?" H 2850 4500 50  0001 C CNN
F 1 "GND" H 2855 4577 50  0000 C CNN
F 2 "" H 2850 4750 50  0001 C CNN
F 3 "" H 2850 4750 50  0001 C CNN
	1    2850 4750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 4850 2850 4850
Wire Wire Line
	2850 4850 2850 4950
Wire Wire Line
	2600 4950 2850 4950
Wire Wire Line
	2600 5050 3100 5050
Text Label 3250 5050 2    50   ~ 0
WSPEED
$Comp
L Device:C_Small C?
U 1 1 5C290FD9
P 3100 5200
F 0 "C?" H 3150 5250 50  0000 L CNN
F 1 "0.01 uF" H 3150 5150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3100 5200 50  0001 C CNN
F 3 "~" H 3100 5200 50  0001 C CNN
F 4 "311-1085-1-ND" H 0   100 50  0001 C CNN "DKPN"
F 5 "CC0603KRX7R9BB103" H 0   100 50  0001 C CNN "MPN"
	1    3100 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5300 3100 5350
$Comp
L power:GND #PWR?
U 1 1 5C290FE1
P 3100 5350
F 0 "#PWR?" H 3100 5100 50  0001 C CNN
F 1 "GND" H 3105 5177 50  0000 C CNN
F 2 "" H 3100 5350 50  0001 C CNN
F 3 "" H 3100 5350 50  0001 C CNN
	1    3100 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5100 3100 5050
Connection ~ 3100 5050
Wire Wire Line
	3100 5050 3250 5050
$Comp
L Device:R_Small R?
U 1 1 5C2B14C1
P 3600 5350
F 0 "R?" H 3541 5304 50  0000 R CNN
F 1 "4.7k" V 3700 5400 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3600 5350 50  0001 C CNN
F 3 "~" H 3600 5350 50  0001 C CNN
F 4 "311-4.7KGRCT-ND" H 250 800 50  0001 C CNN "DKPN"
F 5 " RC0603JR-074K7L" H 250 800 50  0001 C CNN "MPN"
	1    3600 5350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 5450 3600 5650
$Comp
L power:+3.3V #PWR?
U 1 1 5C2B14C9
P 3600 5200
F 0 "#PWR?" H 3600 5050 50  0001 C CNN
F 1 "+3.3V" H 3615 5373 50  0000 C CNN
F 2 "" H 3600 5200 50  0001 C CNN
F 3 "" H 3600 5200 50  0001 C CNN
	1    3600 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 5200 3600 5250
Text Label 3700 5650 0    50   ~ 0
WDIR
$Comp
L Device:C_Small C?
U 1 1 5C2B14D3
P 3600 5900
F 0 "C?" H 3692 5946 50  0000 L CNN
F 1 "0.01 uF" H 3692 5855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3600 5900 50  0001 C CNN
F 3 "~" H 3600 5900 50  0001 C CNN
F 4 "311-1085-1-ND" H 250 800 50  0001 C CNN "DKPN"
F 5 "CC0603KRX7R9BB103" H 250 800 50  0001 C CNN "MPN"
	1    3600 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 6000 3600 6050
$Comp
L power:GND #PWR?
U 1 1 5C2B14DB
P 3600 6050
F 0 "#PWR?" H 3600 5800 50  0001 C CNN
F 1 "GND" H 3605 5877 50  0000 C CNN
F 2 "" H 3600 6050 50  0001 C CNN
F 3 "" H 3600 6050 50  0001 C CNN
	1    3600 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 5800 3600 5650
Connection ~ 3600 5650
Wire Wire Line
	3600 5650 3700 5650
Wire Wire Line
	2850 5650 3600 5650
Wire Wire Line
	2850 5650 2850 5150
Wire Wire Line
	2850 5150 2600 5150
Connection ~ 2850 4850
Wire Wire Line
	2850 4850 2850 4750
$EndSCHEMATC
