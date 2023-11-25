#!/bin/bash

threshold=70

Memory_usage=$(df -h | awk '/\/dev\/sda2/{print $5}' | tr -d '%') 

if [ "$Memory_usage" -le "$threshold" ];
then 
echo -e "Memory is in good condition, \nThreshold value is:$threshold \nMemory_usage is:$Memory_usage "
else
echo -e "Memory is not in good condition. \nThreshold value is:$threshold% \nMemory_usage is:$Memory_usage% "
fi
