#!/bin/bash
while true 
do 
	echo -n Timestamp: >> system.log
	date >> system.log
	echo -n CPU Load: >> system.log
	uptime| awk '{print $8 $9 $10 }' >> system.log
	echo -n  Memory Consumption Percentage: >> system.log
	free | grep Mem: | awk '{print $3/$2 *100.0}' >> system.log
	echo -n Task Counter Value: >> system.log
	ps -e | wc -l >> system.log
	echo -n  Sum of all PIDs: >> system.log
	ps -e | grep -v PID | awk '{s=s+$1} END {print s}' >> system.log
	echo CPU temperature in degrees Celsius: >>system.log
	paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | awk '{print $1 "     " $2/1000 "   " "Celsius"}'|column -t >> system.log
	echo --------------------------------------------------------------------------------------------------------->> system.log
	sleep 1
	
done
