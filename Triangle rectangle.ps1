# Donat un número enter entre 5 i 20 per l'usuari
# Ha de mostrar per pantalla un triangle rectangle
# amb tant de pisos com ens ha indicat l'usuari

Write-Host "Triangle rectangle";

# Demanam el número al usuari
[int]$number = Read-Host "Quants de pisos vols en el trinagle? (entre 5 i 20)";

# Comprovam els errors
while ($number -lt 5 -or $number -gt 20) {
    $number = Read-Host "El número no pot ser menor que 5 ni major que 20";
}

# Feim el triangle
[string]$layers = "";

for ($i = 0; $i -lt $number; $i++) {
    $layers = $layers + "*";
    Write-Host $layers;
}