# Donat un número per l'usuari enter major que 0
# Ha de mostrar per pantalla un compte enrere fins a 0

Write-Host "Cronòmetre";

# Demanam el número al usuari
[int]$time = Read-Host "Quant de temps vols en el cronòmetre? (en segons)";

# Comprovam els errors
while ($time -le 0) {
    $time = Read-Host "El número no pot ser menor que 0";
}

# Programam el cronòmetre
for ([int]$i = $time; $i -ge 0; $i--) {
    Write-Host $i;
}