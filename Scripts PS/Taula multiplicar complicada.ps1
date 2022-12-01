# Donat un número per l'usuari del 0 al 10 
# Programa que mostri per pantalla la taula de multiplicar de aquest número
# Que l'usuari vol

Write-Host "Taula de multiplicar";

# Demanam el número al usuari
[int]$number1 = Read-Host "Quin número vols? (entre 0 i 10)";
[int]$number2 = Read-Host "Quina taula vols veure? (entre 0 i 10)"
[array]$numbers = $number2;
[string]$compr = Read-Host "Vols algun número més? (y/n)";

while ($numbers.Length -lt 10 -and $compr -eq "y" ) {
    $number2 = -1

    # Comprovam si el número es entre 0 i 10
    while ($number2 -lt 0 -or $number2 -gt 10) {
        $number2 = Read-Host "Quina taula vols veure? (entre 0 i 10)";
        [bool]$exist = $numbers.Contains($number2);

        # Comprovam si el número ja existeix en l'array
        if ($exist) {
            Write-Host "El número ja existeix";
            $number2 = -1
        }
    }

    # Afegim el número dedins l'array
    $numbers += $number2
    [string]$compr = Read-Host "Vols algun número més? (y/n)";
}

if ($numbers.Length -eq 10) {
    Write-Host "Ja has arribat a 10 números"
}

# Comprovam els errors
while ($number1 -lt 0 -or $number1 -gt 10) {
    $number1 = Read-Host "El número no pot ser menor que 0 ni major que 10";
}

# Mostram la taula
[string]$mul = "";

foreach ($int in $numbers) {
    $result = $number1 * $int;
    $mul = "$number1 x $int = $result";
    Write-Host $mul;
}