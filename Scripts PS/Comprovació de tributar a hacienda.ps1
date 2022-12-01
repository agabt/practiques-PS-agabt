# Mostrar per pantalla si un usuari tributa o no
# Per tributar, un usuari ha de ser major de 16 anys 
# i els seus ingressos siguin iguals o superiors a 1000€ mensuals.

Write-Host "Tributaràs a hacienda o no?"

# Demanam les dades al usuari
[int]$age = Read-Host "Quants d'anys tens?"
[int]$salary = Read-Host "Quant cobres al més?"

# Comprovam les dades
if ($age -gt 16 -and $salary -ge 1000) {
   Write-Host "Tributes a hacienda"
} else {
   Write-Host "No tributes a hacienda"
}