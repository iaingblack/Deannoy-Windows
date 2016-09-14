setlocal

for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "6.3" echo Windows 8.1 or Server 2012R2
if "%version%" == "6.2" echo Windows 8 or Server 2012
if "%version%" == "6.1" echo Windows 7 or Server 2008R2
if "%version%" == "6.0" echo Windows Vista or Server 2008
if "%version%" == "10.0" echo Windows 10 or Server 2016


cmd /c %~dp0enable-powershell-remote-scripts.bat
cmd /c %~dp0scripts\disable-firewall.bat
cmd /c %~dp0scripts\disable-servermanager-opening.bat
cmd /c %~dp0scripts\enable-rdp.bat
cmd /c %~dp0scripts\enable-winrm.bat
if "%version%" == "6.1" (
  cmd /c %~dp0scripts\6.1\enable-psremoting.bat
) else (
  cmd /c %~dp0scripts\enable-psremoting.bat
)
powershell -command "Set-ExecutionPolicy Unrestricted -Force"
cmd /c powershell -command "%~dp0scripts\sane-windows-explorer-settings.ps1"
cmd /c powershell -command "%~dp0scripts\disable-ie-enhanced-security.ps1"
cmd /c powershell -command "%~dp0scripts\dont-expire-user-passwords.ps1"


endlocal
