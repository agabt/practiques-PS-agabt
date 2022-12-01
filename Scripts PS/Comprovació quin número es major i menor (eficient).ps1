# Donat 4 números per l'usuari enters
# Mostrar per pantalla quin es el més petit i quin es el més gros

# Mostram al usuari que fà aquest script
Write-Host "Donat 4 números, indicarém quin és el més gran i quin és el més petit"

# Demanam al usuari els números
[string]$exit = "n"
$numbers = @()

while ($exit -ne "y") {
    # Demanam un número al usuari
    [int]$number = Read-Host "Indica un número"

    # El guardam a dedins un array
    $numbers = $numbers + $number

    # Demanam al usuari si vol sortir del bucle
    $exit = Read-Host "Vols sortir del bucle? (y/n)"
}

# Miram quin es el més gran i el més petit
[int]$smaller = $numbers[0]
[int]$bigger = $numbers[0]

foreach ($number in $numbers) {

    if ($number -gt $bigger) {
        $bigger = $number

    } elseif ($number -lt $smaller) {
        $smaller = $number
    }
}

# Li deim al usuari quin es el més gran i el més petit
Write-Host "El número més gran és $bigger i el més petit és $smaller"