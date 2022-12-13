$fileUsersCsv=Read-Host "Introduce el fichero csv de los usuarios:"
$file_Users = Get-Content $fileUsersCsv
foreach($linea in $file_Users)
{
  REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /V $linea /T REG_DWORD /D 0
}
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /V $env:UserName /T REG_DWORD /D 0
