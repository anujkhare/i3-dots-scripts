#!/bin/bash
while :;
do
	now=$(date +%s)
	e1=$(date +%s --date='11:50 Today')
	m=$[$[$e1-$now]/60]
	#echo "!!DUDE!! $[$m/60] Hours: $[$m%60] minutes remaining!          $(date)"
	echo "$(date)"
	sleep 1
done
