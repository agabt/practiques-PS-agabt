# Algoritme que demani un número enter positiu 2>
# El script ens ha de demanar si es un número primer o no
# (Número divisble per 1 i per ell mateix)

# Demanam el número al usuari
[int]$number = Read-Host "Quin número vols comprovar?"

# Comprovam que el número donat cumpleix les condicions
while ($number -le 2) {
    $number = Read-Host "El número que vols comrpovar no pot ser menor o igual a 2"
}

# Miram si el número es primer o no
[bool]$prime = $true

for ([int]$i = $number/2; $i -ge 2; $i--) {
    [int]$result = $number % $i

    if ($result -eq 0) {
        $prime = $false
        break
    }

}

if ($prime) {
    Write-Host "El número és primer"
} else {
    Write-Host "El número no és primer"
}