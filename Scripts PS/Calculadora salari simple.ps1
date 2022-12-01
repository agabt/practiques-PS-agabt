# Realitzar un script que demani al usuari un 
# número d'hores que ha fet feina i a quant cobra les hores.

# Mostrar per pantalla quant li he de pagar.

# Demanam al usuari les hores treballades i el salari per hora
[int]$hours = Read-Host "Quantes hores de feina has fet?"
[float]$salaryph = Read-Host "Quant cobres PER HORA? (un número incl. decimal)"

# Calculam el salari total a pagar
[float]$salary = $hours * $salaryph

# Mostram al usuari quan cobrarà
Write-Host "Cobraràs" $salary "€"