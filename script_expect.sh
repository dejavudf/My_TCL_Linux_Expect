#!/usr/bin/expect -f
 
# Set variables 
 set hostname [lindex $argv 0]
 set username $env(USER)
 set password [lindex $argv 1]
 set enablepassword [lindex $argv 2]
 
# Log results
 log_file -a ~/results.log
 
# Output current working device
 send_user "\n"
 send_user ">>>>>  Working on $hostname @ [exec date] <<<<<\n"
 send_user "\n"
 
# Don't check keys
 spawn ssh -o StrictHostKeyChecking=no $username\@$hostname
 
# Check for SSH problems
 expect {
 timeout { send_user "\nTimeout Exceeded - Check Host\n"; exit 1 }
 eof { send_user "\nSSH Connection To $hostname Failed\n"; exit 1 }
 "*#" {}
 "*assword:" {
 send "$password\n"
 }
 }
 
# Check if you're in enable mode and enter it you aren't
 expect {
 default { send_user "\nEnable Mode Failed - Check Password\n"; exit 1 }
 "*#" {}
 "*>" {
 send "enable\n"
 expect "*assword"
 send "$enablepassword\n"
 expect "*#"
 }
 }
 
# Enter configuration mode
 send "conf t\n"
 expect "(config)#"
 
# Enter your commands here. Examples listed below
 #send "tacacs-server host 10.0.0.5\n"
 #expect "(config)#"
 #send "tacacs-server directed-request\n"
 #expect "(config)#"
 #send "tacacs-server key 7 0000000000000\n"
 #expect "(config)#"
 #send "ntp server 10.0.0.9\n"
 #expect "(config)#"
 #send "ip domain-name yourdomain.com\n"
 #expect "(config)#"
 
 send "end\n"
 expect "#"
 send "write mem\n"
 expect "#"
 send "exit\n"
 expect ":~\$"
 exit
