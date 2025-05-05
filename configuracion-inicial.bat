@echo off
REM === CONFIGURAR IP ESTÁTICA Y DNS ===
echo Configurando IP estática...

netsh interface ip set address "Ethernet" static 192.168.1.10 255.255.255.0 192.168.1.1
netsh interface ip set dns "Ethernet" static 192.168.1.10

REM === CAMBIAR NOMBRE DEL EQUIPO ===
echo Cambiando nombre del equipo a SERVER1...
wmic computersystem where name="%computername%" call rename name="SERVER1"

REM === INSTALAR ROLES: AD DS, DNS, DHCP ===
echo Instalando roles de Active Directory, DNS y DHCP...
powershell -Command "Install-WindowsFeature AD-Domain-Services, DNS, DHCP -IncludeManagementTools"

echo Listo. El servidor se reiniciará en 10 segundos...
timeout /t 10

shutdown /r /t 0
