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
while {$count > 0 } {
send "display mac-address interface gigabitethernet 1\/0\/$count count\n";
send "display mac-address interface gigabitethernet 1\/0\/$count\n";
send "display mac-address interface ethernet 1\/0\/$count count\n";
send "display mac-address interface ethernet 1\/0\/$count\n";
set count [expr $count-1];
}
send "system-view\n";
expect "]";
send "quit\r";
#interact




