#!/usr/bin/expect
set timeout 15
set hostname [lindex $argv 0]
set snmpshapass [lindex $argv 1]
set snmpaespass [lindex $argv 2]
set username [lindex $argv 3]
set password [lindex $argv 4]
set enable [lindex $argv 5]
set send_slow {10 .001}
log_user 0

if {[llength $argv] == 0} {
  send_user "Usage: scriptname hostname \'snmpshapass\' \'snmpaespass\' username \'userpassword\' \'enablepassword\'\n"
  send_user "For Cisco Nexus devices just give hostname snmpshapass and snmpaespass if you have ssh keys installed\n"
  exit 1
}

send_user "\n#####\n# $hostname\n#####\n"

if { [info exists $username] } { 
  spawn ssh -q -o StrictHostKeyChecking=no $username@$hostname
} else {
  spawn ssh -q -o StrictHostKeyChecking=no $hostname
}

expect {
  timeout { send_user "\nFailed to get password prompt\n"; exit 1 }
  eof { send_user "\nSSH failure for $hostname\n"; exit 1 }
  "*#" {}
  "*assword:" {
    send "$password\r"
  }
}

send "\r"

expect {
  default { send_user "\nCould not get into enabled mode. Password problem?\n"; exit 1 }
  "*#" {}
  "*>" {
    send "enable\r"
    expect "*assword"
    send "$enable\r"
    expect "*#"
  }
}

send "show ver | inc Cisco\r"

expect {
  default { send_user "\nFailed to determine OS or get back correct prompt while changing pass.\n"; exit 1 }
  "Nexus" {
    send "config t\r"
    expect "*(config)#"
    send snmp-server user snmpUser network-operator auth sha $snmpshapass priv AES-128 $snmpaespass\r"
    expect "*(config)#"
    send "exit\r"
    expect "*#"
    send "copy run start\r"
    expect "100%"
    expect "*#"
  }
  "IOS" {
    send "config t\r"
    expect "*(config)#"
    send snmp-server user snmpUser snmpGroup v3 auth sha $snmpshapass priv AES 128 $snmpaespass\r"
    expect "*(config)#"
    send "exit\r"
    expect "*#"
    send "write mem\r"
    expect "*#"
  }
}

send "exit\r"
send_user "\nSuccessfully changed SNMP password on $hostname\n"
close
