set var_sysname_tmp [string map {"-" "_"} $deviceName]
set var_sysname [string map {"." "_"} $var_sysname_tmp]

CLI configure snmp sysname SW_$var_sysname
CLI save config
CLI y
CLI
CLI en
CLI config t
CLI hostname SW_$var_sysname
CLI end
CLI wr
CLI
CLI set system name SW_$var_sysname
CLI set promptSW_$var_sysname
CLI
