# Aquest codi ens mostra per pantalla el nom que el usuari 
# introdueix les vegades que aquest ens ho indiqui.

# Aquesta primera part es per demanar el nom a l'usuari
# i les vegades que aquest vol que es repeteixi

$name = Read-Host "Introdueix el teu nom"
[int]$num = Read-Host "Numero de vegades que vols que es repeteixi"


# Aqui hi ha el bucle de repetició
for ($i=0; $i -lt $num; $i++) {
Write-Host $name;
}