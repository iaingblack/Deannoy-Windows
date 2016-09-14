call winrm quickconfig -q
call winrm quickconfig -transport:http
call winrm set winrm/config @{MaxTimeoutms="1800000"}
call winrm set winrm/config/winrs @{MaxMemoryPerShellMB="300"}
call winrm set winrm/config/service @{AllowUnencrypted="true"}
call winrm set winrm/config/service/auth @{Basic="true"}
call winrm set winrm/config/client/auth @{Basic="true"}
call winrm set winrm/config/listener?Address=*+Transport=HTTP @{Port="5985"}

echo ==^> Restarting winrm service
sc stop winrm
ping 127.0.0.1
sc start winrm
sc config winrm start= auto

netsh advfirewall firewall add rule name="WinRM HTTP Port 5595" dir=in action=allow protocol=TCP localport=5595
netsh advfirewall firewall add rule name="WinRM HTTPS Port 5596" dir=in action=allow protocol=TCP localport=5596
powershell -command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned"