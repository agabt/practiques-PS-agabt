# Donat una hora vàlida per l'usuari (hh:mm:ss)
# Crear un script que fassi de rellotge
# Mostrar per pantalla cada segon que passa

Write-Host "Rellotge"

# Inicialitzam les variables
# Demanam al usuari quina hora és
[string]$time_string = Read-Host "Quina hora és? (hh:mm:ss)"
$time = @()

# Separam el "string" que ens ha donat l'usuari i el guardam dedins un array
$time = $time_string.Split(":")

# Guardam cada part en una variable
[int]$hour = $time[0]
[int]$minute = $time[1]
[int]$second = $time[2]

# Controlam els errors
while ($hour -ge 24 -or $minute -gt 59 -or $second -gt 59) {
    $time_string = Read-Host "L'hora no esta ben indicada, el formta es hh:mm:ss (hores:minuts:segons)"
    $time = $time_string.Split(":")

    # Guardam cada part en una variable
    [int]$hour = $time[0]
    [int]$minute = $time[1]
    [int]$second = $time[2]
}

# Cream el rellotge
Write-Host "Pulsa Ctrl + c per sortir del rellotge"
while ($hour -le 24) {
    Start-Sleep -Seconds 1
    $second++
    if ($second -eq 60) {
        $second = 00
        $minute++

        if ($minute -eq 60) {
            $minute = 00
            $hour++

            if ($hour -eq 24) {
                $hour = 00
            }
        }
    }

    Write-Host "${hour}:${minute}:${second}"
}