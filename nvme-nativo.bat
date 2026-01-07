@echo off
title NVMe Driver Tool
color 0A

:: ---- Check admin ----
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Ejecuta este script como Administrador.
    pause
    exit /b
)

:MENU
cls
echo ==========================================
echo        NVMe Driver Tool - Windows
echo ==========================================
echo.
echo 1 - Habilitar NVMe nativo (stornvme)
echo 2 - Restaurar configuracion por defecto
echo 3 - Respaldar claves del registro
echo 4 - Salir
echo.
set /p choice=Selecciona una opcion [1-4]: 

if "%choice%"=="1" goto ENABLE
if "%choice%"=="2" goto DISABLE
if "%choice%"=="3" goto BACKUP
if "%choice%"=="4" exit
goto MENU

:ENABLE
cls
echo Habilitando NVMe nativo...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorPort" /v EnableNVMeMode /t REG_DWORD /d 1 /f
echo.
echo NVMe nativo habilitado correctamente.
echo Reinicia el sistema para aplicar los cambios.
pause
goto MENU

:DISABLE
cls
echo Restaurando configuracion por defecto...
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\StorPort" /v EnableNVMeMode /f
echo.
echo Configuracion restaurada.
echo Reinicia el sistema.
pause
goto MENU

:BACKUP
cls
set BACKUPDIR=%~dp0backup
if not exist "%BACKUPDIR%" mkdir "%BACKUPDIR%"

echo Respaldando claves del registro...
reg export "HKLM\SYSTEM\CurrentControlSet\Services\stornvme" "%BACKUPDIR%\stornvme.reg" /y
reg export "HKLM\SYSTEM\CurrentControlSet\Control\StorPort" "%BACKUPDIR%\storport.reg" /y

echo.
echo Backup creado en:
echo %BACKUPDIR%
pause
goto MENU
