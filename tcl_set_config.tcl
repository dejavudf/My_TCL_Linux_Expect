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

#inicio do script
spawn telnet $ip
sleep 2;
expect "Username:";
send "$user\r";
expect "Password:";
send "$password\r";
expect ">";
send "system-view\r";
expect "]";
send "undo ip https enable\r";
expect "]";
send "undo ip http enable\r";
expect "]";
send "ssh server enable\r";
expect "]";
send "quit\r";
expect ">";
send "quit\r";

