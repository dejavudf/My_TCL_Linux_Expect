#!/usr/bin/expect
### 100% working ###

#declaracao de variaveis
set timeout 300
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
send "system-view\r";
expect "]";
while {$count > 0 } {
send "interface GigabitEthernet 1\/0\/$count\n";
expect "]";
send "undo qos trust\n";
expect "]";
send "undo priority\n";
expect "]";
send "interface Ethernet 1\/0\/$count\n";
expect "]";
send "undo priority\n";
expect "]";
set count [expr $count-1];
}
send "quit\n";
expect "]";
send "quit\n";
expect ">";
send "quit\r";

