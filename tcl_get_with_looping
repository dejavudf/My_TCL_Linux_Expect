#!/usr/bin/expect
#tcl scripts - pegar vizinhos
### 100% working ###

#declaracao de variaveis
set timeout 3
set count 52
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
while {$count > 0 } {
send "display lldp neighbor-information interface GigabitEthernet 1\/0\/$count\n";
set count [expr $count-1];
}
expect "dejavudf1973";
send "quit\r";
#interact




