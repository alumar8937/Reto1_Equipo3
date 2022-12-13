#Borrado de usuarios de forma masiva.
$usuarios=Import-Csv -Path usuarios.csv
foreach  ($user in $usuarios)
{
	Remove-LocalUser $user.cuenta
}
