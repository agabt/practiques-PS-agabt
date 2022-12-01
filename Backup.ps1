# Script que quan s'executi realitzi un backup de la carpeta "tomeu"
# El directori pot estar on sigui peró ha de estar dedins la carpeta "Users"
# Ha de demanar al usuari el directori que vol copiar
# El directori de destí serà dins "Users\Administrador\Backups_tomeu"
# El format del nom ha de ser "dd-mm-aaaa_HH-mm-ss"

# Li deim al usuari que fà aquest script
Write-Host "Backup d'arxius"

# Demanam al usuari quina la direcció de la carpeta a fer backup
[string]$route = Read-Host "Quina és la ruta de la carpeta? (C:\...)"

# Cream la variable del nom de la còpia
$datetime = Get-Date
$date = $datetime.ToString("dd-MM-yyyy_hh:mm:ss")
$destination = "C:\Users\Administrador\backups_tomeu\"+$date

Robocopy $route $destination /e