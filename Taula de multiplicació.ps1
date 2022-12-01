# Donat un número per l'usuari del 0 al 10 
# Programa que mostri per pantalla la taula de multiplicar de aquest número

Write-Host "Taula de multiplicar";

# Demanam el número al usuari
[int]$number = Read-Host "Quin número vols? (entre 0 i 10)";

# Comprovam els errors
while ($number -lt 0 -or $number -gt 10) {
    $number = Read-Host "El número no pot ser menor que 0 ni major que 10";
}

# Mostram la taula
[string]$mul = "";

for ($i = 0; $i -le 10; $i++) {
    $result = $number * $i;
    $mul = "$number x $i = $result";
    Write-Host $mul;
}