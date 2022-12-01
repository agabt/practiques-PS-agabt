# Donat una hora vàlida per l'usuari en minuts
# Crear un script que fassi de rellotge
# Mostrar per pantalla cada segon que es resta

Write-Host "Rellotge"

# Inicialitzam les funcions
# La primera funció es per posar un 0 davant d'un nombre si es menor a 10
function zero([int]$number) {
    $result = $number.ToString()
    if($number -lt 10){
        $result = "0$result"
    }
    return $result
}

# La segona funció resta els nombres del rellotge per no passar-mos
function res([int]$hour_f, [int]$minute_f, [int]$second_f){
    # Restam els segons (sempre)
    $second_f--

    # Si els segons baixen de 0, els posam a 59 i restam un minut
    if ($second_f -lt 0) {
        $second_f = 59
        $minute_f--
    }

    # Si els minuts baixen de 0, els posam a 59 i restam una hora
    if ($minute_f -lt 0 -and $hour_f -gt 0) {
        $minute_f = 59
        $hour_f--
    }

    if ($hour_f -eq 0 -and $minute_f -eq 0 -and $second_f -eq 0){
        Start-Sleep -s 1
        Write-Host "00:00:00"
        Write-Host "Has arribat al final"
        exit
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

    # Restam l'hora en 1s
    $newTime = res $hour  $minutes  $seconds 

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
    # Demanam els minuts al usuari
    $time_string = Read-Host "Indica l'hora d'inici del rellotge, ha de ser en minuts"
    [float]$time = $time_string

    # Treim els minuts i les hores
    $minuts = $time % 60
    $hora = $time / 60
    
    # Arredonim les hores cap avall (ja que els decimals son els minuts i ja els tenim)
    $hora = [math]::Round($hora, 0)
}

while( ($hora -lt 0 -or $hora -gt 23) -or ($minuts -lt 0 -or $minuts -gt 59) -or ($segons -lt 0 -or $segons -gt 59) )

# Iniciam rellotge
clock $hora $minuts $segons