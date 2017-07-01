#!/usr/bin/python3
#
# Script to generate lookup table for wind direction sensor
# using reference voltage and resistance
#


VDD = 3.3
R = 10e3

# Direction (degrees), Resistance (ohms), Ideal Voltage, Midpoint Voltage
DIRS = [
    [0, 33e3, 0, 0],
    [22.5, 6.57e3, 0, 0],
    [45, 8.2e3, 0, 0],
    [67.5, 891, 0, 0],
    [90, 1e3, 0, 0],
    [112.5, 688, 0, 0],
    [135, 2.2e3, 0, 0],
    [157.5, 1.41e3, 0, 0],
    [180, 3.9e3, 0, 0],
    [202.5, 3.14e3, 0, 0],
    [225, 16e3, 0, 0],
    [247.5, 14.12e3, 0, 0],
    [270, 120e3, 0, 0],
    [292.5, 42.12e3, 0, 0],
    [315, 64.9e3, 0, 0],
    [337.5, 21.88e3, 0, 0],
]

for direction in DIRS:
    direction[2] = round(VDD * direction[1]/(direction[1] + R), 3)

# Sort by voltage
sd = sorted(DIRS, key=lambda x: x[2])

# Calculate midpoint between adjacent voltages
for i in range(len(sd)-1):
    diff = round(sd[i+1][2]-sd[i][2], 3)
    sd[i][3] = round(sd[i][2] + diff/2, 3)
# Add arbitrary voltage to last one
sd[-1][3] = round(sd[-1][2] + VDD/16, 3)

print('static const wind_dir_t dirs[] = {')
for direction in sd:
    print('    {{{}, {}}},'.format(
        int(direction[3] * 1000), int(direction[0] * 10 )))
print('    {0 ,0}};')
