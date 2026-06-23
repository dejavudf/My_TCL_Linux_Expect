#!/bin/bash
#Created by: Alexsandro Farias (gitHub.com/dejavudf)
#Version: 1.0
#Description: script em TCL para backup Enterasys Legados (sem suporte para comando direto via ssh)
#Linux version supported: Debian, Ubuntu and Mint

if cd /home/netsight/scripts/bckcores
then
	#variables
	VAR_PASS=$1
	VAR_DIR="/usr/local/Extreme_Networks/NetSight/appdata/InventoryMgr/configs/cores"
	VAR_DT=$(date '+%Y%m%d');
	VAR_FILE="legados.txt"

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
		expect ./entersys.tcl $VAR_IP $VAR_RANDOM $VAR_DT $VAR_DIR
		if ! cat $VAR_DIR/$VAR_DT/$VAR_DT\_$VAR_IP\_config.cfg | grep -i "extreme"
		then
			echo "$VAR_IP - error" >> ./"$VAR_DT"_failure.log
		else
			echo "$VAR_IP - success" >> ./"$VAR_DT"_success.log
		fi
	done
fi
