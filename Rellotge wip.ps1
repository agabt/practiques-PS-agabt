# Donat una hora vàlida per l'usuari (hh:mm:ss)
# Crear un script que fassi de rellotge
# Mostrar per pantalla cada segon que passa

Write-Host "Rellotge"

# Inicialitzam les funcions
# La primera funció es per posar un 0 davant d'un nombre si es menor a 10
function zero([string]$number) {
    $result = $number.ToString()
    if($number -lt 10){
        $result = "0$result"
    }
    return $result
}

# La segona funció suma els nombres del rellotge per no passar-mos
function sum([int]$hour_f, [int]$minute_f, [int]$second_f){
    # Sumam els segons (sempre)
    $second_f++

    # Si els segons passen de 60, els posam a 0 i sumam un minut
    if ($second_f -ge 60) {
        $second_f = 0
        $minute_f++
    }

    # Si els minuts passen de 60, els posam a 0 i sumam una hora
    if ($minute_f -ge 60) {
        $minute_f = 0
        $hour_f++
    }

    # Si les hores passen de 24, les posam a 0
    if ($hour_f -ge 24) {
        $hour_f = 0
    }

    # El guardam dedins una array i la retornam
    [pscustomobject]$time = @{"hour" = $hour_f; "minutes" = $minute_f; "seconds" = $second_f}
    return $time
}

function clock([int]$hour, [int]$minutes, [int]$seconds){
    # Passam el rellotge a string regularitzant els zeros
    [string]$string_hour = zero $hour
    [string]$string_min = zero $minutes
    [string]$string_sec = zero $seconds

    # Mostram l'hora a l'usuari en format hh:mm:ss
    Write-Host  $string_hour":"$string_min":"$string_sec

    # Augmentam l'hora en 1s
    $newTime = sum $hour  $minutes  $seconds 

    # Esperam 1s
    Start-Sleep -s 1
    
    # Tornam llancçar l'script
    clock $newTime["hour"] $newTime["minutes"] $newTime["seconds"]
}


# Inicialitzam les variables
[int]$hora = 0
[int]$minuts = 0
[int]$segons = 0
[string]$time = "";

# Demanam l'hora a l'usuari i ens asseguram que sigui correcte
do{
    $time = Read-Host "Indica l'hora d'inici del rellotge, ha de tenir un format hh:mm:ss acceptat"
    $time_array = $time -split ":"
    $hora = $time_array[0]
    $minuts = $time_array[1]
    $segons = $time_array[2]
}

while( ($hora -lt 0 -or $hora -gt 23) -or ($minuts -lt 0 -or $minuts -gt 59) -or ($segons -lt 0 -or $segons -gt 59) )

# Iniciam rellotge
clock $hora $minuts $segons