#!/usr/bin/expect -f

# Set variables 
set VAR_IP [lindex $argv 0]
set VAR_PASS [lindex $argv 1]
set VAR_DT [lindex $argv 2]
set VAR_DIR [lindex $argv 3]
set VAR_USER suportenoc

# connect
spawn ../random -p $VAR_PASS ssh -o KexAlgorithms=+diffie-hellman-group1-sha1,diffie-hellman-group14-sha1,curve25519-sha256 -o StrictHostKeyChecking=accept-new \
-o HostKeyAlgorithms=ssh-dss,ssh-rsa -o PubkeyAcceptedKeyTypes=ssh-rsa,ssh-dss,rsa-sha2-256,rsa-sha2-512 $VAR_USER\@$VAR_IP

# Log results
log_file -noappend $VAR_DIR/$VAR_DT/$VAR_DT\_$VAR_IP\_config.cfg

# expect
sleep 2;
expect ">";
sleep 2;
send "set length 0\r";
expect ">";
sleep 2;
send "show config\r";
expect ">";
sleep 2;
send "exit\r";
exit
