# Donat un número per l'usuari
# Hem de veure si és major que 0 i sigui enter
# Mostrar per pantalla tots els números imparells que el precedeixen separats per "," i espais.

# Demanam el número al usuari
[int]$number = Read-Host "Elegeix un número major que 0 i enter (no decimal)";

# Comprovam que el número es major que 0
while ($number -le 0) {
    $number = Read-Host "El número no pot ser menor o igual a 0";
}

# Concatenam els números en una frase
[string]$even = "";

for ($i=1; $i -le $number; $i = $i + 2) {
    $even = $even + $i + ", "
}

# Mostram la frase per pantalla
Write-Host $even