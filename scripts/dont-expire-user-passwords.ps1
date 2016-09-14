$Computername = $env:COMPUTERNAME
$adsi = [ADSI]"WinNT://$Computername"
$Users = $adsi.Children  | where {$_.SchemaClassName  -eq 'user'}
foreach ($user in $Users) {
  $user.UserFlags.value = $user.UserFlags.value -bor 0x10000
  $user.CommitChanges()
}
