#Creación de grupos de manera masiva.

$file_groups=Import-Csv -Path departamentos.csv 
foreach ($group in $file_groups) { 
  New-LocalGroup -Name $group.nombre -Description $group.descripcion
}

# Creación de usuarios de forma masiva, donde se le dice que:
# La cuenta y el password sí expira.
# Debe cambiar la contraseña en el siguiente inicio de sesión

$file_users=Import-Csv -Path usuarios.csv 
foreach ($user in $file_users) { 
  $clave=ConvertTo-SecureString $user.contrasenya -AsPlainText -Force
  New-LocalUser $user.cuenta -Password $clave -FullName $user.nombre_apellidos -Description $user.descripcion -AccountNeverExpires $false -PasswordNeverExpires $false
 
  #Solicitar cambio de contraseña en el siguiente inicio de sesión
  net user $user.cuenta /logonpasswordchg:yes
  
  # Añadimos el usuario a los grupos necesarios, para ello,
  # creamos un array con los grupos a los que hay que añadir el usuario y que son
  # Usuarios del sistema y el grupo asociado al departamento donde trabaja
  
  $grupos-usuario = ("usuarios",$user.departamento)
  foreach ($grupo in $grupos-usuario){
    Add-LocalGroupMember -Group $grupo -Member $user.cuenta
  }
}
