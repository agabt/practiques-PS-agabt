# Script on el script ha de fer una divisó entre dos numeros 
# donats per l'usuari però he de controlar els possibles errors.

# Demanam els números al usuari
Write-Host "Benvingut a la calculadora de divisions!"

[float]$numeral = Read-Host "Quin vols que sigui el primer número?"
[float]$divisor = Read-Host "Quin vols que sigui el segón número?"

# Comprovam els errors
while ($divisor -eq 0) {
Write-Host "No es pot dividir amb 0"

[float]$divisor = Read-Host "Quin vols que sigui el segón número? QUE NO SIGUI 0"

}

# Calculam i mostram el resultat al usuari
[float]$result = $numeral / $divisor

Write-Host "El resultat és:" $result