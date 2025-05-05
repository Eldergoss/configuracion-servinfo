@echo off
:: ==============================================
:: CONFIGURAR IP, ROLES Y PROMOVER A CONTROLADOR DE DOMINIO
:: ==============================================
:: Requiere ejecución como Administrador

:: A. Configurar IP estática
netsh interface ipv4 set address name="Ethernet" static 192.168.1.10 255.255.255.0 192.168.1.1
netsh interface ipv4 set dns name="Ethernet" static 127.0.0.1
netsh interface ipv4 add dns name="Ethernet" 192.168.1.11 index=2

:: B. Instalar roles AD, DNS y DHCP
powershell -command "Install-WindowsFeature AD-Domain-Services, DHCP, DNS -IncludeManagementTools"

:: C. Promover a Controlador de Dominio
powershell -command "Install-ADDSForest -DomainName 'servinfo.local' -DomainNetbiosName 'SERVINFO' -InstallDNS -Force -SafeModeAdministratorPassword (ConvertTo-SecureString 'P@ssw0rd123!' -AsPlainText -Force)"

:: Reiniciar
shutdown /r /t 30 /c "Ejecuta el Script 2 después del reinicio"
