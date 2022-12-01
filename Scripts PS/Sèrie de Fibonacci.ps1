# Script que donat un número enter positiu major que 1
# Mostrar per pantalla la sèrie de Fibonacci
# Fibonacci és infinit, hem de mostrar tants de números com el usuari ha indicat

Write-Host "Sèrie de Fibonacci"

# Demanam al usuari quants de números vols
[int]$times = Read-Host "Fins quants de números vols veure?"

# Comprovam els errors
while ($times -lt 1) {
    $times = Read-Host "El número no pot ser menor de 1, indica altre número"
}

# Inicialitzan els números
[int]$number = 1
[int]$number2 = 1
[int]$result = 1

# Mostram el primer número
Write-Host $number

# Si el usuari només vol un número, sortim del script
if ($times -eq 1) {
    exit;
}

# Si el usuari vol més d'un número, li mostram els següents
Write-Host $number2

# Feim la sèrie de Fibonacci
for ([int]$i = 1; $i -le $times - 2; $i++) {
    $result = $number + $number2
    Write-Host $result
    $number2 = $number
    $number = $result
}