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

ignored_fields = ['timestamp', 'humidity', 'index']

with open(args.filename, mode='r') as csvfile:
    reader = csv.DictReader(csvfile)
    fields = {}

    for field in reader.fieldnames:
        if field:
            fields[field] = []

    for row in reader:
        for field in fields:
            if field != 'timestamp' and field not in ignored_fields:
                fields[field].append(float(row[field]))
            elif field == 'timestamp':
                timestamp = datetime.strptime(row[field], "%Y-%m-%d %H:%M:%S")
                fields[field].append(timestamp)
            else:
                fields[field].append(row[field])

    fig, axarr = plt.subplots(len(fields) - len(ignored_fields), sharex=True)
    count = 0
    for field in fields:
        if field in ignored_fields:
            continue
        axarr[count].plot(fields['timestamp'], fields[field])
        axarr[count].set_ylabel(field)
        count += 1

    plt.show()
