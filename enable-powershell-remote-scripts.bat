echo ==^> Setting the PowerShell ExecutionPolicy to RemoteSigned
powershell -Command "Set-ExecutionPolicy UnRestricted -Force" <NUL

if exist %SystemRoot%\SysWOW64\cmd.exe (
  %SystemRoot%\SysWOW64\cmd.exe /c powershell -Command "Set-ExecutionPolicy UnRestricted -Force" <NUL
)