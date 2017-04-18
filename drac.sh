#!/bin/bash

# list of IPs, one in each line
ipfile=ip.txt

# Log
logfile=drac.log

if [ ! -r $ipfile ]; then
	echo "$ipfile not found"
	exit

fi

# Logfile gets overwritten each time the script runs
echo "Starting configuration of iDRAC from file $ipfile" > $logfile

while read line; do

	# Ingnore blank lines
	[ -z "$line" ] && continue

	# Ingnore comments (lines with a ;)
	echo $line | grep "^;" > /dev/null
	[ $? -eq 0 ] && continue

	echo Configuring DRAC with IP: $line

	echo "#############################" >> $logfile
	echo "DRAC = $line" >> $logfile

	echo y | racadm -u <user> -p <password> -r $line <command> >> $logfile 2>&1
	if [ $? -ne 0 ]; then
		echo "ERROR, check drac.log"
	else
		echo "DRAC configured"
	fi

done < $ipfile

echo Done


