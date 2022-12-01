# Crea una funció que operi segons el paràmetre que ens passi el usuari
# Control d'errors: L'usuari ha d'indicar una operació correcte i que no dividi per 0
# Realitzar la operació i mostrar-la per pantalla

# Explicam al usuari que és aquest script
Write-Host "Aquest és un script que fà calculs amb dos números que demanam amb un operador que també demanam"

# Demanam al usuari els números i les operacións
[int]$number1 = Read-Host "Quin vols que sigui el primer número?"
[int]$number2 = Read-Host "Quin vols que sigui el segon número?"
[string]$type_op = Read-Host "Quin vols que sigui la operació (+ - x /)?"

# Control d'errors (operació)
while ($type_op -ne "+" -and $type_op -ne "-" -and $type_op -ne "x" -and $type_op -ne "/") {
    $type_op = Read-Host "Si vols una suma indica +, si vols una resta indica -, si vols una multiplicació indica x, i si vols una divisió indica /"
}

# Control d'errors si es divisió
while ($type_op -eq "/" -and $number2 -eq 0) {
    $number2 = Read-Host "Si fas una divisió, el número pel que divideixes no pot ser 0. Elegeix un altre número per favor"
}

# Feim les operacións
[float]$result = 0

if ($type_op -eq "+") {
    $result = $number1 + $number2
} elseif ($type_op -eq "-") {
    $result = $number1 - $number2
} elseif ($type_op -eq "x") {
    $result = $number1 * $number2
} elseif ($type_op -eq "/") {
    $result = $number1 / $number2
}

Write-Host "El resultat de $number1 $type_op $number2 és $result"