# Donat un número enter per l'usuari MAJOR que 0
# Mostrar per pantalla si es un número parell o imparell

# Demanam el número al usuari
Write-Host "Descobreix si un número es parell o senar/imparell!"
[int]$number = Read-Host "Elegeix un número"

# Calculam el residu
[int]$result = $number % 2

# Miram si el residu es 1 o 0
# Si es 1 es imparell, si es 0 es parell
if ($result -eq 1) {
    Write-Host "El número" $number "no és parell"
} else {
    Write-Host "El número" $number "és parell"
}
