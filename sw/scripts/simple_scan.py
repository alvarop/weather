#!/usr/bin/env python

import argparse
import serial
import struct
import time
from bglib import bglib

last_index = -1

eddystone_types = {
    0x00: 'uid',
    0x10: 'url',
    0x20: 'tlm',
    0x30: 'eid'
}


def decode_eddystone_data(data):
    """ Basic eddystone packet decoder
    Used data from:
    https://github.com/google/eddystone/blob/master/protocol-specification.md
    """
    if len(data) < 4:
        return None

    data_len, data_type, uuid = struct.unpack_from('<BBH', data, 0)

    if data_len != 3:
        return None

    if data_type != 3:
        return None

    if uuid != 0xFEAA:
        return None

    data_len, data_type, uuid = struct.unpack_from('<BBH', data, 4)

    if data_type != 0x16:
        return None

    if uuid != 0xFEAA:
        return None

    eddystone_type = data[8]

    if eddystone_type not in eddystone_types:
        return {'type': 'unknown', 'data': data[8:(8+data_len)]}

    if eddystone_types[eddystone_type] == 'uid':
        return {'type': 'uid', 'uid': data[10:26]}

    return {'type': eddystone_types[eddystone_type], 'uid': data[8:8+data_len]}


def process_weather_packet(packet, rssi):
    global last_index

    (magic, index, temperature, light, pressure, wind, rain) = \
        struct.unpack('<HHhhfHH', packet)

    if magic != 0xDA7A:
        return

    if index != last_index:
        last_index = index

        data = {}
        data['timestamp'] = time.strftime(
            '%Y-%m-%d %H:%M:%S', time.localtime())
        data['index'] = index
        data['temperature'] = temperature/100.0
        data['humidity'] = 'N/A'
        data['pressure'] = pressure/1000.0
        data['light'] = light
        data['rain'] = (rain & 0xFFF)/1000.0
        data['wind_speed'] = wind/1000.0
        # Currently packing wind direction on top 4 bits of rain data
        data['wind_dir'] = ((rain >> 12) & 0xF) * 22.5

        if args.filename:
            save_data(data)

        print_data(data)


data_columns = ['timestamp', 'index', 'temperature', 'humidity',
                'pressure', 'light', 'rain', 'wind_speed', 'wind_dir']


def save_data(data):
    line = ''

    for item in data_columns:
        line += str(data[item]) + ','

    csvfile.write(line + '\n')
    csvfile.flush()


def write_header():
    header = ''
    for item in data_columns:
        header += str(item) + ','
    csvfile.write(header + '\n')


def print_data(data):
    print('{}'.format(data['timestamp']))
    print('index: {}'.format(data['index']))
    print('Temperature: {} C'.format(data['temperature']))
    print('Light: {}'.format(data['light']))
    print('Pressure {:0.7} kPa'.format(data['pressure']))
    print('Rain: {} mm'.format(data['rain']))
    print('Wind: {} kph @{}'.format(data['wind_speed'], data['wind_dir']))


def to_hex_str(data):
    hex_str = ''
    for byte in data:
        hex_str += '{:02X}'.format(byte)
    return hex_str


def timeout(sender, args):
    raise IOError('BGLib timeut :(')


def process_scan_response(sender, args):
    eddystone_data = decode_eddystone_data(args['data'])
    if eddystone_data and eddystone_data['type'] == 'uid':
        process_weather_packet(eddystone_data['uid'], args['rssi'])


parser = argparse.ArgumentParser()

parser.add_argument('--baud_rate',
                    default=115200,
                    type=int,
                    help='BLED112 baud rate')

parser.add_argument('--port',
                    required=True,
                    help='BLED112 device to connect to')

parser.add_argument('--filename',
                    help='Output filename (csv format)')

args = parser.parse_args()

if args.filename:
    csvfile = open(args.filename, mode='w')

    write_header()


ble = bglib.BGLib()
ble.packet_mode = False

ble.on_timeout += timeout

ble.ble_evt_gap_scan_response += process_scan_response

ser = serial.Serial(port=args.port, baudrate=args.baud_rate, timeout=1)
ser.flushInput()
ser.flushOutput()

# disconnect if we are connected already
ble.send_command(ser, ble.ble_cmd_connection_disconnect(0))
ble.check_activity(ser, 1)

# stop advertising if we are advertising already
ble.send_command(ser, ble.ble_cmd_gap_set_mode(0, 0))
ble.check_activity(ser, 1)

# stop scanning if we are scanning already
ble.send_command(ser, ble.ble_cmd_gap_end_procedure())
ble.check_activity(ser, 1)

# set scan parameters
ble.send_command(ser, ble.ble_cmd_gap_set_scan_parameters(0xC8, 0xC8, 1))
ble.check_activity(ser, 1)

# start scanning now
ble.send_command(ser, ble.ble_cmd_gap_discover(2))
ble.check_activity(ser, 1)

while (1):
    # check for all incoming data (no timeout, non-blocking)
    ble.check_activity(ser)

    # don't burden the CPU
    time.sleep(0.01)
