Write-Host "Disabling IE Enhanced Security Configuration (ESC)."
$key = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components"
$AdminKey = "$key\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
$UserKey = "$key\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
if(Test-Path $AdminKey){    
  Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0    
}
if(Test-Path $UserKey) {    
  Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0    
}