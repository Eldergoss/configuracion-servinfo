# === PROMOCIONAR EL SERVIDOR A CONTROLADOR DE DOMINIO ===
$domain = "servinfo.local"
$domainAdminPassword = ConvertTo-SecureString "Servinfo123*" -AsPlainText -Force
$domainAdminUsername = "Administrator"
$DSRMpassword = ConvertTo-SecureString "Servinfo123*" -AsPlainText -Force

Install-ADDSForest -DomainName $domain -DomainNetbiosName "SERVINFO" -ForestMode Win2016 -DomainMode Win2016 -InstallDNS -SafeModeAdministratorPassword $DSRMpassword -Force

# === CREAR UNIDADES ORGANIZATIVAS (UO) ===
New-ADOrganizationalUnit -Name "GERENCIA" -Path "DC=servinfo,DC=local"
New-ADOrganizationalUnit -Name "PROYECTOS" -Path "DC=servinfo,DC=local"
New-ADOrganizationalUnit -Name "RRHH" -Path "DC=servinfo,DC=local"
New-ADOrganizationalUnit -Name "CONTABILIDAD" -Path "DC=servinfo,DC=local"
New-ADOrganizationalUnit -Name "INFORMATICA" -Path "DC=servinfo,DC=local"

# === CREAR USUARIOS EN CADA UO ===
# GERENCIA
New-ADUser -SamAccountName "gerencia1" -UserPrincipalName "gerencia1@servinfo.local" -Name "Gerencia 1" -GivenName "Gerencia" -Surname "Uno" -Department "Gerencia" -AccountPassword (ConvertTo-SecureString "Gerencia123*" -AsPlainText -Force) -Enabled $true -Path "OU=GERENCIA,DC=servinfo,DC=local"
New-ADUser -SamAccountName "gerencia2" -UserPrincipalName "gerencia2@servinfo.local" -Name "Gerencia 2" -GivenName "Gerencia" -Surname "Dos" -Department "Gerencia" -AccountPassword (ConvertTo-SecureString "Gerencia123*" -AsPlainText -Force) -Enabled $true -Path "OU=GERENCIA,DC=servinfo,DC=local"
New-ADUser -SamAccountName "gerencia3" -UserPrincipalName "gerencia3@servinfo.local" -Name "Gerencia 3" -GivenName "Gerencia" -Surname "Tres" -Department "Gerencia" -AccountPassword (ConvertTo-SecureString "Gerencia123*" -AsPlainText -Force) -Enabled $true -Path "OU=GERENCIA,DC=servinfo,DC=local"
New-ADUser -SamAccountName "gerencia4" -UserPrincipalName "gerencia4@servinfo.local" -Name "Gerencia 4" -GivenName "Gerencia" -Surname "Cuatro" -Department "Gerencia" -AccountPassword (ConvertTo-SecureString "Gerencia123*" -AsPlainText -Force) -Enabled $true -Path "OU=GERENCIA,DC=servinfo,DC=local"

# PROYECTOS
New-ADUser -SamAccountName "proyecto1" -UserPrincipalName "proyecto1@servinfo.local" -Name "Proyecto 1" -GivenName "Proyecto" -Surname "Uno" -Department "Proyectos" -AccountPassword (ConvertTo-SecureString "Proyecto123*" -AsPlainText -Force) -Enabled $true -Path "OU=PROYECTOS,DC=servinfo,DC=local"
New-ADUser -SamAccountName "proyecto2" -UserPrincipalName "proyecto2@servinfo.local" -Name "Proyecto 2" -GivenName "Proyecto" -Surname "Dos" -Department "Proyectos" -AccountPassword (ConvertTo-SecureString "Proyecto123*" -AsPlainText -Force) -Enabled $true -Path "OU=PROYECTOS,DC=servinfo,DC=local"
New-ADUser -SamAccountName "proyecto3" -UserPrincipalName "proyecto3@servinfo.local" -Name "Proyecto 3" -GivenName "Proyecto" -Surname "Tres" -Department "Proyectos" -AccountPassword (ConvertTo-SecureString "Proyecto123*" -AsPlainText -Force) -Enabled $true -Path "OU=PROYECTOS,DC=servinfo,DC=local"
New-ADUser -SamAccountName "proyecto4" -UserPrincipalName "proyecto4@servinfo.local" -Name "Proyecto 4" -GivenName "Proyecto" -Surname "Cuatro" -Department "Proyectos" -AccountPassword (ConvertTo-SecureString "Proyecto123*" -AsPlainText -Force) -Enabled $true -Path "OU=PROYECTOS,DC=servinfo,DC=local"

# RRHH
New-ADUser -SamAccountName "rrhh1" -UserPrincipalName "rrhh1@servinfo.local" -Name "RRHH 1" -GivenName "RRHH" -Surname "Uno" -Department "RRHH" -AccountPassword (ConvertTo-SecureString "RRHH123*" -AsPlainText -Force) -Enabled $true -Path "OU=RRHH,DC=servinfo,DC=local"
New-ADUser -SamAccountName "rrhh2" -UserPrincipalName "rrhh2@servinfo.local" -Name "RRHH 2" -GivenName "RRHH" -Surname "Dos" -Department "RRHH" -AccountPassword (ConvertTo-SecureString "RRHH123*" -AsPlainText -Force) -Enabled $true -Path "OU=RRHH,DC=servinfo,DC=local"
New-ADUser -SamAccountName "rrhh3" -UserPrincipalName "rrhh3@servinfo.local" -Name "RRHH 3" -GivenName "RRHH" -Surname "Tres" -Department "RRHH" -AccountPassword (ConvertTo-SecureString "RRHH123*" -AsPlainText -Force) -Enabled $true -Path "OU=RRHH,DC=servinfo,DC=local"
New-ADUser -SamAccountName "rrhh4" -UserPrincipalName "rrhh4@servinfo.local" -Name "RRHH 4" -GivenName "RRHH" -Surname "Cuatro" -Department "RRHH" -AccountPassword (ConvertTo-SecureString "RRHH123*" -AsPlainText -Force) -Enabled $true -Path "OU=RRHH,DC=servinfo,DC=local"

# CONTABILIDAD
New-ADUser -SamAccountName "conta1" -UserPrincipalName "conta1@servinfo.local" -Name "Contabilidad 1" -GivenName "Contabilidad" -Surname "Uno" -Department "Contabilidad" -AccountPassword (ConvertTo-SecureString "Conta123*" -AsPlainText -Force) -Enabled $true -Path "OU=CONTABILIDAD,DC=servinfo,DC=local"
New-ADUser -SamAccountName "conta2" -UserPrincipalName "conta2@servinfo.local" -Name "Contabilidad 2" -GivenName "Contabilidad" -Surname "Dos" -Department "Contabilidad" -AccountPassword (ConvertTo-SecureString "Conta123*" -AsPlainText -Force) -Enabled $true -Path "OU=CONTABILIDAD,DC=servinfo,DC=local"
New-ADUser -SamAccountName "conta3" -UserPrincipalName "conta3@servinfo.local" -Name "Contabilidad 3" -GivenName "Contabilidad" -Surname "Tres" -Department "Contabilidad" -AccountPassword (ConvertTo-SecureString "Conta123*" -AsPlainText -Force) -Enabled $true -Path "OU=CONTABILIDAD,DC=servinfo,DC=local"
New-ADUser -SamAccountName "conta4" -UserPrincipalName "conta4@servinfo.local" -Name "Contabilidad 4" -GivenName "Contabilidad" -Surname "Cuatro" -Department "Contabilidad" -AccountPassword (ConvertTo-SecureString "Conta123*" -AsPlainText -Force) -Enabled $true -Path "OU=CONTABILIDAD,DC=servinfo,DC=local"

# INFORMATICA
New-ADUser -SamAccountName "info1" -UserPrincipalName "info1@servinfo.local" -Name "Informatica 1" -GivenName "Informatica" -Surname "Uno" -Department "Informatica" -AccountPassword (ConvertTo-SecureString "Info123*" -AsPlainText -Force) -Enabled $true -Path "OU=INFORMATICA,DC=servinfo,DC=local"
New-ADUser -SamAccountName "info2" -UserPrincipalName "info2@servinfo.local" -Name "Informatica 2" -GivenName "Informatica" -Surname "Dos" -Department "Informatica" -AccountPassword (ConvertTo-SecureString "Info123*" -AsPlainText -Force) -Enabled $true -Path "OU=INFORMATICA,DC=servinfo,DC=local"
New-ADUser -SamAccountName "info3" -UserPrincipalName "info3@servinfo.local" -Name "Informatica 3" -GivenName "Informatica" -Surname "Tres" -Department "Informatica" -AccountPassword (ConvertTo-SecureString "Info123*" -AsPlainText -Force) -Enabled $true -Path "OU=INFORMATICA,DC=servinfo,DC=local"
New-ADUser -SamAccountName "info4" -UserPrincipalName "info4@servinfo.local" -Name "Informatica 4" -GivenName "Informatica" -Surname "Cuatro" -Department "Informatica" -AccountPassword (ConvertTo-SecureString "Info123*" -AsPlainText -Force) -Enabled $true -Path "OU=INFORMATICA,DC=servinfo,DC=local"

# === CREAR CARPETAS COMPARTIDAS ===
New-Item -Path "D:\SERVINFO\GERENCIA" -ItemType Directory
New-Item -Path "D:\SERVINFO\PROYECTOS" -ItemType Directory
New-Item -Path "D:\SERVINFO\RRHH" -ItemType Directory
New-Item -Path "D:\SERVINFO\CONTABILIDAD" -ItemType Directory
New-Item -Path "D:\SERVINFO\INFORMATICA" -ItemType Directory

# === ASIGNAR PERMISOS A LAS CARPETAS ===
icacls "D:\SERVINFO\GERENCIA" /grant "GERENCIA:(OI)(CI)F"
icacls "D:\SERVINFO\PROYECTOS" /grant "PROYECTOS:(OI)(CI)F"
icacls "D:\SERVINFO\RRHH" /grant "RRHH:(OI)(CI)F"
icacls "D:\SERVINFO\CONTABILIDAD" /grant "CONT
