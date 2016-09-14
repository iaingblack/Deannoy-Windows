%~dp0enable-powershell-remote-scripts.bat
%~dp0\scripts\disable-firewall.bat
%~dp0\scripts\disable-servermanager-opening.bat
%~dp0\scripts\enable-rdp.bat
%~dp0\scripts\enable-winrm.bat
%~dp0\scripts\enable-psremoting.bat
powershell -command "%~dp0\scripts\sane-windows-explorer-settings.ps1"
powershell -command "%~dp0\scripts\disable-ie-enhanced-security.ps1"
pause