# Els alumnes d'un curs s'han dividit en A i B
# Però els hem dividit per sexe i per nom
# En el grup A poden entrar dones amb la inicial del nom anterior a la M (A-M)
# i els homes amb la inicial del nom posterior a la N (A-N).
# La resta anirà al grup B

Write-Host "Quin grup entraràs?";

# Demanam les dades al usuari
[string]$name = Read-Host "Introdueix el teu nom";
[string]$gender = Read-Host "Introdueix el teu gènere (H/D)";

# Comprovam si les dades que ens dona el usuari son correctes
while ($gender -ne "H" -and $gender -ne "D") {
    $gender = Read-Host "No has indicat el genère correcte, si ets home introdueix 'H', si ets dona introdueix 'D'";
}

# Comprovam el gènere i l'inicial del nom
if ( ($gender -eq "d" -and $name -lt "m") -or ($gender -eq "h" -and $name -lt "n") ) {
    Write-Host "Estàs en el grup A";
} else {
    Write-Host "Estàs en el grup B";
}