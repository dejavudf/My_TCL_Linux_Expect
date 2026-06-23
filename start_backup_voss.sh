#!/bin/bash
#Created by: Alexsandro Farias (gitHub.com/dejavudf)
#Version: 1.0
#Description: script em TCL para backup switches fabric voss
#Linux version supported: Debian, Ubuntu and Mint

if cd /home/netsight/scripts/bckvoss
then
	#variables
	VAR_PASS=$1
	VAR_DIR="/usr/local/Extreme_Networks/NetSight/appdata/InventoryMgr/configs/voss"
	VAR_DT=$(date '+%Y%m%d');
	VAR_FILE="ips.txt"

	#get random
	VAR_RANDOM=$(gpg --batch --passphrase "$VAR_PASS" -d -q ../random.gpg)

	#script start
	if ! [ -d $VAR_DIR/$VAR_DT ]
	then
		mkdir $VAR_DIR/$VAR_DT
	fi
	rm -f ./*.log
	echo Starting Scripts...Wait...
	cat ./$VAR_FILE | while read -r VAR_IP
	do
		expect ./voss.tcl $VAR_IP $VAR_RANDOM $VAR_DT $VAR_DIR
		if cat $VAR_DIR/$VAR_DT/$VAR_DT\_$VAR_IP\_voss.cfg | grep -i "connect to host $VAR_IP port 22"
		then
			echo "$VAR_IP - error" >> ./"$VAR_DT"_failure.log
		else
			echo "$VAR_IP - success" >> ./"$VAR_DT"_sucess.log
		fi
	done
fi
