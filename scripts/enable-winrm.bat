winrm quickconfig -quiet
netsh advfirewall firewall add rule name="WinRM HTTP Port 5595" dir=in action=allow protocol=TCP localport=5595
netsh advfirewall firewall add rule name="WinRM HTTPS Port 5596" dir=in action=allow protocol=TCP localport=5596
powershell -command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned"