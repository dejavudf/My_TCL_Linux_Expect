#!/bin/bash
#hostname -I | cut -d" " -f1>myip.txt
#cat myip.txt | read myip
dt=$(date '+%d%m%Y');
echo Starting Scripts...Wait...
cat /scripts/ips_list.txt |  while read output
do
#multi file
expect $1 $output | tee -a /scripts/results/$dt"_"$1"_"$output.txt
#unique file
#expect $1 $output | tee -a /scripts/results/$dt"_"$1.txt
	#echo "#########################################################################">>/scripts/results/$dt"_"$1.txt	
	clear
	echo Starting Next Host...Wait... 
done
