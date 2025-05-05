@echo off
:: ==============================================
:: CREAR USUARIOS EN CADA OU (CONTRASEÑA = NOMBRE)
:: ==============================================
:: Ejecutar después del Script 1

set DOMINIO=servinfo.local
set OU_BASE=OU=SERVINFO,DC=servinfo,DC=local

:: Lista de OUs
set OUS=GERENCIA PROYECTOS RRHH CONTABILIDAD INFORMATICA

for %%O in (%OUS%) do (
    echo Creando usuarios en OU %%O...
    for /L %%i in (1,1,4) do (
        set USUARIO=%%O%%i
        set USUARIO=!USUARIO,,!  :: Convertir a minúsculas
        
        dsadd user "CN=!USUARIO!,OU=%%O,!OU_BASE!" ^
            -samid !USUARIO! ^
            -upn !USUARIO!@%DOMINIO% ^
            -fn !USUARIO! ^
            -ln %%O ^
            -pwd !USUARIO! ^
            -mustchpwd yes ^
            -disabled no
        
        if errorlevel 1 (
            echo Error al crear !USUARIO!
        ) else (
            echo Usuario creado: !USUARIO! (Contraseña: !USUARIO!)
        )
    )
)

:: Mostrar resumen
echo.
echo Resumen de usuarios:
dsquery user -limit 0 | dsget user -samid -dn
pause
