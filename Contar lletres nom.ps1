# El codi següent demana al usuari un nom
# i ens dirà quantes lletres té aquest nom

# Demanam al usuari el nom
[string]$name = Read-Host "Escriu un nom"

# Comprovam les lletres del nom
[int]$n = 0;
foreach ($char in $name){
$n++;
}

Write-Host $name.Length;
Write-Host $n;