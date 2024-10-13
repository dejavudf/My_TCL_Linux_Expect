#!/usr/bin/expect
### 100% working ###

#declaracao de variaveis
set timeout 3
set ip [lindex $argv 0]
#set name [lindex $argv 1]
#set port [lindex $argv 2]
#set user [lindex $argv 3]
#set password [lindex $argv 4]
set password xpto
set user xpto
set server ip_hostname
set date 03012018

#inicio do script
spawn telnet $ip
sleep 2;
expect "Username:";
send "$user\r";
expect "Password:";
send "$password\r";
expect ">";
send "backup startup-configuration to $server $ip.cfg\r";
sleep 2;
expect ">";
send "backup fabric current-configuration to $server $ip.cfg\r";
sleep 2;
expect ">";
send "quit\r";

#interact

