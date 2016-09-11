@ECHO OFF

IF "%~1"=="" GOTO :argMissing
GOTO START

:argMissing
ECHO Machine role name is required. Install.bat [role]
exit

:start
ECHO Configuring machine role "%1"

where /q choco
IF ERRORLEVEL 1 (
    ECHO Installing Chocolatey
    SET ERRORLEVEL=0
    CALL bin\install-chocolatey.cmd
)

where /q boxstarter
IF ERRORLEVEL 1 (
    ECHO Installing Boxstarter
    SET ERRORLEVEL=0
    cinst boxstarter -y
)

ECHO Downgrading chocolatey to 0.9.10.3, see https://github.com/mwrock/boxstarter/issues/198
choco upgrade chocolatey --version 0.9.10.3 --allow-downgrade

ECHO Running installer script Install-%1.ps1
PowerShell.exe -NoProfile -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Install-%1.ps1""' -Verb RunAs}"
PAUSE
