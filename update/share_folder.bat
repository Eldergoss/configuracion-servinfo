@echo off
:: ==============================================
:: CREAR CARPETAS COMPARTIDAS CON PERMISOS POR OU
:: ==============================================
:: Ejecutar después del Script 2

set RUTA_BASE=C:\Shares
set SERVER=%COMPUTERNAME%

:: Crear directorio base
if not exist "%RUTA_BASE%" mkdir "%RUTA_BASE%"

:: Obtener OUs
for /f "tokens=*" %%O in ('dsquery OU -name * -limit 0 ^| dsget OU -dn ^| find "OU=SERVINFO"') do (
    set OU_DN=%%O
    for /f "tokens=2 delims=," %%N in ("%%O") do set OU_NAME=%%N
    set OU_NAME=!OU_NAME:OU=!
    set OU_NAME=!OU_NAME:~1!
    
    echo Procesando OU: !OU_NAME!
    
    :: Crear carpeta
    mkdir "%RUTA_BASE%\!OU_NAME!" >nul 2>&1
    
    :: Asignar permisos NTFS (Modify)
    icacls "%RUTA_BASE%\!OU_NAME!" /inheritance:r /grant:r "Administradores:(OI)(CI)F"
    
    :: Asignar permisos a usuarios de la OU
    for /f "tokens=2 delims=," %%U in ('dsquery user -limit 0 -o rdn "%%O"') do (
        set USER=%%U
        set USER=!USER:CN=!
        icacls "%RUTA_BASE%\!OU_NAME!" /grant "!USER!:(OI)(CI)M"
    )
    
    :: Compartir carpeta
    net share !OU_NAME!="%RUTA_BASE%\!OU_NAME!" /GRANT:"Administradores,FULL" /CACHE:None
    
    echo Carpeta compartida: \\!SERVER!\!OU_NAME!
)

echo.
echo Resumen de recursos compartidos:
net share
pause
