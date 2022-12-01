# Donat 4 números per l'usuari enters
# Mostrar per pantalla quin es el més petit i quin es el més gros

# Mostram al usuari que fà aquest script
Write-Host "Donat 4 números, indicarém quin és el més gran i quin és el més petit"

# Demanam al usuari els números
[int]$number1 = Read-Host "Indica el primer número"
[int]$number2 = Read-Host "Indica el segon número"
[int]$number3 = Read-Host "Indica el tercer número"
[int]$number4 = Read-Host "Indica el quart número"

# Miram quin es el més gran i el més petit
[int]$smaller = 0
[int]$bigger = 0

# Comprovam el primer número
if ($number1 -lt $number2 -and $number1 -lt $number3 -and $number1 -lt $number4) {
    $smaller = $number1
} elseif ($number1 -gt $number2 -and $number1 -gt $number3 -and $number1 -gt $number4) {
    $bigger = $number1
}

# Comprovam el segon número
if ($number2 -lt $number1 -and $number2 -lt $number3 -and $number2 -lt $number4) {
    $smaller = $number2
} elseif ($number2 -gt $number1 -and $number2 -gt $number3 -and $number2 -gt $number4) {
    $bigger = $number2
}

# Comprovam el tercer número
if ($number3 -lt $number1 -and $number3 -lt $number2 -and $number3 -lt $number4) {
    $smaller = $number3
} elseif ($number3 -gt $number1 -and $number3 -gt $number2 -and $number3 -gt $number4) {
    $bigger = $number3
}

# Comprovam el quart número
if ($number4 -lt $number1 -and $number4 -lt $number2 -and $number4 -lt $number3) {
    $smaller = $number4
} elseif ($number4 -gt $number1 -and $number4 -gt $number2 -and $number4 -gt $number3) {
    $bigger = $number4
}

# Li deim al usuari quin es el més gran i el més petit
Write-Host "El número més gran és $bigger i el més petit és $smaller"