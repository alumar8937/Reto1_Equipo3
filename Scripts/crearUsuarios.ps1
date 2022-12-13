$file_users=Import-Csv -Path usuarios.csv 
foreach ($user in $file_users) { 
  $clave=ConvertTo-SecureString $user.contrasenya -AsPlainText -Force
  New-LocalUser $user.cuenta -Password $clave -Description $user.descripcion -FullName $user.nombre -AccountNeverExpires
  #Añadimos la cuenta de usuario en el grupo de Usuarios del sistema
  Add-LocalGroupMember -Group Users -Member $user.cuenta
  Add-LocalGroupMember -Group $user.departamento -Member $user.cuenta
  net user $user.cuenta /logonpasswordchg:yes
}
