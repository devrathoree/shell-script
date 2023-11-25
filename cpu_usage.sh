#!/bin/bash

threshold=70

cpu_usage=$(mpstat 1 1 | awk '/Average/ {print 100 - $NF}')

# Compare using awk to handle floating-point numbers
if awk -v cpu_usage="$cpu_usage" -v threshold="$threshold" 'BEGIN { exit !(cpu_usage <= threshold) }'; then
    echo -e "CPU is in good condition.\nThe threshold value is: $threshold%\ncpu_usage is: $cpu_usage%"
else
    echo -e "CPU is not in good condition.\nThe threshold value is: $threshold%\ncpu_usage is: $cpu_usage%"
fi

