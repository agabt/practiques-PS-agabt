# Demanam al usuari una frase
# Demanam al usuari un caràcter a cercar dedins la frase (min 5 car)
# Li hem de dir al usuari quantes vegades apaerix aquest caràcter en la frase
# No distingueix un caràcter en minuscula o majuscula

[string]$frase = Read-Host "Quina frase vols comprovar?"
[string]$caracter = Read-Host "Quin caràcter vols cercar?"

# Comprovam els errors
while ($frase.Length -lt 5) {
    $frase = Read-Host "La frase ha de contenir com a mínim 5 caràcters"
}

while ($caracter.Length -ne 1) {
    $caracter = Read-Host "Només pots cercar un caràcter"
}

# Passam tot a majuscula
[string]$caracter_upp = $caracter.ToUpper();

# Comprovam les vegades que la lletra es repeteix
[int]$num = 0;
for ([int]$i = 0; $i -lt $frase.Length; $i++) {
    [string]$car_frase = $frase[$i];
    [string]$car_frase = $car_frase.ToUpper();
    if ($car_frase -eq $caracter) {
        $num++
    }
}

Write-Host "Hi ha $num $caracter en la frase '$frase'"