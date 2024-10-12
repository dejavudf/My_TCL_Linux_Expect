@echo off

:menu_equip
cls
echo ############ TELNET SCRIPTS - Switches Enterasys ############
echo Selecione o switch/pilha a ser verificada:
echo 1. SPO - Bloco T
echo 2. SPO - Pilha 1 - Bloco M
echo 3. SPO - Pilha 2 - Bloco M
echo 4. SPO - Pilha 1 - Bloco B
echo 5. SPO - Pilha 2 - Bloco B
echo 6. SPO - Auditorio
echo 7. SPO - Sala Situacao
echo 8. SPO - Sala DINFO
echo 9. SIA - 1o. Andar
echo A. SIA - 2o. Andar
echo B. SIA - 3o. Andar
echo C. SIA - Terro e subsolo
echo D. SIA - CORE
echo E. SPO - CORE 1
echo F. SPO - CORE 2
echo G. SPO - Rede Externa 1
echo H. SPO - Rede Externa 2
echo I. SPO - Pilha 1 - Bloco L
echo J. SPO - Pilha 2 - Bloco L
echo K. SPO - Pilha 3 - Bloco L
echo L. SPO - Pilha 4 - Bloco L
echo M. Digitar IP
echo N. Sair
choice /C 123456789ABCDEFGHIJKLMN /M "Digite o numero ou letra da opcao:"
if %errorlevel% == 1 set IP=Bloco_T
if %errorlevel% == 2 set IP=P1_Bloco_M
if %errorlevel% == 3 set IP=P2_Bloco_M
if %errorlevel% == 4 set IP=P1_Bloco_B
if %errorlevel% == 5 set IP=P2_Bloco_B
if %errorlevel% == 6 set IP=Audit
if %errorlevel% == 7 set IP=Sala_Situacao
if %errorlevel% == 8 set IP=Sala_DINFO
if %errorlevel% == 9 set IP=SIA_1AN
if %errorlevel% == 10 set IP=SIA_2AN
if %errorlevel% == 11 set IP=SIA_3AN
if %errorlevel% == 12 set IP=SIA_TSS
if %errorlevel% == 13 set IP=SIA_CORE
if %errorlevel% == 14 set IP=CORE1
if %errorlevel% == 15 set IP=CORE2
if %errorlevel% == 16 set IP=RE_EXT1
if %errorlevel% == 17 set IP=RE_EXT2
if %errorlevel% == 18 set IP=P1_BLOCO_L
if %errorlevel% == 19 set IP=P2_BLOCO_L
if %errorlevel% == 20 set IP=P3_BLOCO_L
if %errorlevel% == 21 set IP=P4_BLOCO_L
if %errorlevel% == 22 goto digitar_IP
if %errorlevel% == 23 goto Sair
goto menu_comando

:digitar_IP
set ip_digitar=digitar
SET /P ip=Digite o IP do equipamento:
set host=%ip%
goto menu_comando

:menu_comando
cls
echo ############ TELNET SCRIPTS ############
echo Selecione o comando a ser executado no %ip%:
echo 1. show port status              - Mostra se porta esta ativa ou inativa (status)
echo 2. show port inlinepower         - Mostra se porta POE está sendo utilizada por algum dispositivo
echo 3. show vlan portinfo            - Mostra VLAN configurada na porta dos usuários (somente switches de borda)
echo 4. show port egress              - Mostra VLANs configuradas nas portas dos Uplinks e dos usuários (VLAN egress)
echo 5. show system utilization       - Mostra a utilizacao de memoria, CPU e storage
echo 6. show spantree stats active    - Mostra a situacao do Multiple Spanning Tree
echo 7. show config                   - Mostra a configuracao do switch
echo 8. show neighbors                - Mostra os switches Enterasys vizinhos (diretamente conectados)
echo 9. show mac                      - Mostra a tabela de MAC Address do switch
echo A. show version                  - Mostra a versão de firmware e hardware
echo B. show switch                   - Mostra a situacao da pilha (Stack)
echo C. show lacp                     - Mostra dados sobre a formacao dos LAGS (link aggregation)
echo D. show system hardware          - Mostra informacoes de hardware do switch
echo E. show spantree spanguardlock   - Mostra porta bloqueada pelo Spamguard (porta de usuario com switch conectado)
echo F. show spantree adminedge       - Mostra se porta e do tipo Edge (usuario) ou NonEdge (Uplink)
echo G. find MAC                      - Pesquisa MAC Address na tabela do switch
echo H. find IP                       - Pesquisa IP Address na tablea ARP do switch(funciona apenas nos switch OSI Layer 3)
echo I. show port cablestatus         - Testa porta para verificar existencia de dispositivo conectado
echo J. show ip route                 - Mostra tabela de rota (funciona apenas nos switch OSI Layer 3)
echo K. show ip vrrp                  - Mostra situacao do VRRP (funciona apenas nos switch OSI Layer 3)
echo L. show ip interface             - Mostra as interfaces de VLAN do switch(funciona apenas nos switch OSI Layer 3)
echo M. show run                      - Mostra a configuracao do roteador (funciona apenas nos switch OSI Layer 3)
echo N. show vlan                     - Mostra as VLANs existentes no switch
echo O. show ip arp                   - Mostra tabela ARP do Switchas (funciona apenas nos switch OSI Layer 3)
echo P. Digitar comando               - Digitar comando para ser executado no switch
echo Q. Voltar                        - Voltar ao Menu Principal
echo R. sair                          - Sair do Programa
choice /C 123456789ABCDEFGHIJKLMNOPQR /M "Digite o numero ou letra da opcao:"
if %errorlevel% == 1 set Comando=show port status
if %errorlevel% == 2 set Comando=show port inlinepower
if %errorlevel% == 3 set Comando=show vlan portinfo
if %errorlevel% == 4 set Comando=show port egress
if %errorlevel% == 5 set Comando=show system utilization
if %errorlevel% == 6 set Comando=show spantree stats active
if %errorlevel% == 7 set Comando=show config
if %errorlevel% == 8 set Comando=show neighbors
if %errorlevel% == 9 set Comando=show mac
if %errorlevel% == 10 set Comando=show version
if %errorlevel% == 11 set Comando=show switch
if %errorlevel% == 12 set Comando=show lacp
if %errorlevel% == 13 set Comando=show system hardware
if %errorlevel% == 14 set Comando=show spantree spanguardlock
if %errorlevel% == 15 set Comando=show spantree adminedge
if %errorlevel% == 16 set Comando=show mac address
if %errorlevel% == 17 set Comando=show ip arp
if %errorlevel% == 18 set Comando=show port cablestatus
if %errorlevel% == 19 set Comando=show ip route
if %errorlevel% == 20 set Comando=show ip vrrp
if %errorlevel% == 21 set Comando=show ip interface
if %errorlevel% == 22 set Comando=show run
if %errorlevel% == 23 set Comando=show vlan
if %errorlevel% == 24 set Comando=show ip arp 
REM o errorlevel 24 possui um espaco no final para diferenciar do errorlevel 17.
if %errorlevel% == 25 goto digitar_comando
if %errorlevel% == 26 goto menu_equip
if %errorlevel% == 27 goto SAIR
goto Checa_Porta

:digitar_comando
SET /P comando=Digite o comando:
goto Checa_Porta

:Checa_Porta
if "%comando%" == "show mac address" goto Find_MAC
if "%comando%" == "show ip arp" goto Find_IP
if "%comando%" == "show system utilization" goto comando
if "%comando%" == "show spantree stats active" goto comando
if "%comando%" == "show config" goto comando
if "%comando%" == "show neighbors" goto comando
if "%comando%" == "show version" goto comando
if "%comando%" == "show switch" goto comando
if "%comando%" == "show system hardware" goto comando
if "%comando%" == "show ip arp" goto Find_IP
if "%comando%" == "show ip route" goto comando
if "%comando%" == "show ip vrrp" goto comando
if "%comando%" == "show ip interface" goto comando
if "%comando%" == "show vlan" goto comando
if "%comando%" == "show run" goto comando
if "%comando%" == "show ip arp " goto comando
if "%ip_digitar%" == "digitar" goto comando
REM este comando "show ip arp " possui um espaço no final para diferencia do "show ip arp" existente mais acima
choice /C SN /M "Deseja especificar a(s) porta(s)?"
if %errorlevel% == 2 goto Comando
if %errorlevel% == 1 SET /P porta=Digite a(s) porta(s):
if "%comando%" == "show port status" set comando=%comando% %porta% 
if "%comando%" == "show port inlinepower" set comando=%comando% %porta% 
if "%comando%" == "show vlan portinfo" set comando=%comando% port %porta% 
if "%comando%" == "show port egress" set comando=%comando% %porta% 
if "%comando%" == "show lacp" set comando=%comando% %porta% 
if "%comando%" == "show spantree spanguardlock" set comando=%comando% %porta% 
if "%comando%" == "show spantree adminedge" set comando=%comando% port %porta% 
if "%comando%" == "show mac" set comando=%comando% port %porta%
if "%comando%" == "show port cablestatus" set comando=%comando% %porta%
goto comando 

:Find_MAC
SET /P mac=Digite o MAC Address (formato: AABB.CCDD.EEFF, AA-BB-CC-DD-EE-FF ou AA:BB:CC:DD:EE:FF):
set comando=%comando% %mac%
goto Comando

:Find_IP
SET /P IP_ARP=Digite o IP:
set comando_arp=%comando% %IP_ARP%
goto Comando

:Comando
if %IP% == Bloco_T set host=10.3.1.51
if %IP% == P1_Bloco_M set host=10.3.1.31
if %IP% == P2_Bloco_M set host=10.3.1.32
if %IP% == P1_Bloco_B set host=10.3.1.21
if %IP% == P2_Bloco_B set host=10.3.1.22
if %IP% == Audit set host=10.3.1.41
if %IP% == Sala_Situacao set host=10.3.1.61
if %IP% == Sala_DINFO set host=10.3.1.81
if %IP% == SIA_1AN set host=10.5.9.11
if %IP% == SIA_2AN set host=10.5.9.12
if %IP% == SIA_3AN set host=10.5.9.13
if %IP% == SIA_TSS set host=10.5.9.10
if %IP% == SIA_CORE set host=10.5.9.1
if %IP% == CORE1 set host=10.3.1.254
if %IP% == CORE2 set host=10.3.1.253
if %IP% == RE_EXT1 set host=172.16.200.1
if %IP% == RE_EXT2 set host=172.16.200.2
if %IP% == P1_BLOCO_L set host=10.3.1.11
if %IP% == P2_BLOCO_L set host=10.3.1.12
if %IP% == P3_BLOCO_L set host=10.3.1.13
if %IP%== P4_BLOCO_L set host=10.3.1.14
if "%comando%" == "show ip arp" goto ComandosL3
if "%comando%" == "show ip route" goto ComandosL3
if "%comando%" == "show ip vrrp" goto ComandosL3
if "%comando%" == "show ip interface" goto ComandosL3
if "%comando%" == "show run" goto ComandosL3
if "%comando%" == "show ip arp " goto ComandosL3
REM este comando "show ip arp " possui um espaço no final para diferencia do "show ip arp" existente mais acima
goto ComandosL2

:ComandosL2
echo %host% 23>%IP%.txt
echo WAIT "?">>%IP%.txt
echo SEND "y\m">>%IP%.txt
echo WAIT "Username:">>%IP%.txt
echo SEND "ro\m">>%IP%.txt
echo WAIT "Password:">>%IP%.txt
echo SEND "anaagencia\m">>%IP%.txt
echo WAIT ")->">>%IP%.txt
echo SEND "set length 512\m">>%IP%.txt
echo WAIT ")->">>%IP%.txt
echo SEND "%comando%\m">>%IP%.txt
echo WAIT ")->">>%IP%.txt
goto telnet

:ComandosL3
if "%comando%" == "show ip route" set comando_arp=%comando%
if "%comando%" == "show ip vrrp" set comando_arp=%comando%
if "%comando%" == "show ip interface" set comando_arp=%comando%
if "%comando%" == "show run" set comando_arp=%comando%
if "%comando%" == "show ip arp " set comando_arp=%comando%
echo %host% 23>%IP%.txt
echo WAIT "?">>%IP%.txt
echo SEND "y\m">>%IP%.txt
echo WAIT "Username:">>%IP%.txt
echo SEND "ro\m">>%IP%.txt
echo WAIT "Password:">>%IP%.txt
echo SEND "anaagencia\m">>%IP%.txt
echo WAIT ")->">>%IP%.txt
echo SEND "set length 512\m">>%IP%.txt
echo WAIT ")->">>%IP%.txt
echo SEND "router\m">>%IP%.txt
echo WAIT ")->">>%IP%.txt
echo SEND "%comando_arp%\m">>%IP%.txt
echo WAIT ")->">>%IP%.txt
goto telnet

:telnet
tst10.exe /r:%IP%.txt /o:%IP%.log
del %ip%.txt
type %IP%.log>>%IP%_Resultado.txt
del %ip%.log
start /max notepad.exe %IP%_Resultado.txt
cls
goto menu_comando

:SAIR
exit
