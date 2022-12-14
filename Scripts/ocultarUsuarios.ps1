$file_Users =Import-Csv -Path usuarios.csv
foreach($user in $file_Users)
{
  REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /V $user.cuenta /T REG_DWORD /D 0
}
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /V $env:UserName /T REG_DWORD /D 0
