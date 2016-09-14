$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
if(Test-Path -Path $Key) {
  Set-ItemProperty $Key Hidden 1
  Set-ItemProperty $Key HideFileExt 0
  Set-ItemProperty $Key ShowSuperHidden 1
}
