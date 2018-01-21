#!/usr/bin/env python

import argparse
import csv
from datetime import datetime
import time
import matplotlib.pyplot as plt


parser = argparse.ArgumentParser()


parser.add_argument('--filename',
                    required=True,
                    help='Output filename (csv format)')

args = parser.parse_args()

with open(args.filename, mode='r') as csvfile:
    reader = csv.DictReader(csvfile)
    fields = {}

    for field in reader.fieldnames:
        if field:
            fields[field] = []

    for row in reader:
        for field in fields:
            if field != 'timestamp' and field != 'humidity':
                fields[field].append(float(row[field]))
            elif field == 'timestamp':
                timestamp = time.mktime(datetime.strptime(row[field], "%Y-%m-%d %H:%M:%S").timetuple())
                fields[field].append(timestamp)
            else:
                fields[field].append(row[field])

    fig, axarr = plt.subplots(len(fields) - 1, sharex=True)
    count = 0
    for field in fields:
        if field == 'timestamp':
            continue
        axarr[count].plot(fields['timestamp'], fields[field])
        axarr[count].set_ylabel(field)
        count += 1

    plt.show()
