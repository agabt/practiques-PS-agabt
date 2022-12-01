# Script que demana al usuari un nom i una contrasenya
# Comparam les dades amb les dades del fitxer AGT_Usuaris.txt
# Si el usuari aconsegueix iniciar sessió de manera satisfactoria, hem de guardar un log a AGT_Logins.txt
# Si el usuari no aconseguiex iniciar sessió de manera satisfactoria, hem de guaradr un log a AGT_Logins.txt

# Declaram les funcions
# La primera funció pasarà la contrasenya a hash (SHA 512)
function hash([string]$passwd_h) {
    # HASH TO SHA512
    $hasher = [System.Security.Cryptography.HashAlgorithm]::Create('sha512')
    $hash = $hasher.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($passwd_h))
    $hashString = [System.BitConverter]::ToString($hash)
    $hashString = $hashString.Replace('-', '');

    return $hashString
}

# La segona funció compararà les dades introduides i ens dirà si l'usuari ha iniciat sessió o no
function comparar([string]$user_f, [string]$passwd_f) {
    # Passam el nom d'usuari a tot majuscules per evitar confusions
    $user_f = $user_f.ToUpper()

    # Passam la contrasenya a HASH
    $passwd_hash = hash $passwd_f
    
    # Extreim les dades del fitxer de text"
    $credentials = Get-Content -Path C:\Users\Administrador\practica5\AGT_Usuaris.txt

    # Definim la variable de la verificació
    [bool]$login_success = $true

    # Comparam si el usuari existeix en la base de dades que tenim en el document "AGT_Usuaris.txt"
    foreach ($credential in $credentials) {
        if ($credential -match $user_f) {
            $login_success = $true
            break

        } else {
            $login_success = $false

        }
    }

    # Comprovam si el usuari existeix, si existeix seguim, si no, li deim al usuari que no existeix
    if ($login_success -eq $false) {
        $user_f = $user_f.ToLower()
        Write-Host "L'usuari $user_f no existeix"
        return $login_success
        break
    }

    # Si l'usuari existeix hem de comprovar la contrasenya
    foreach ($credential in $credentials) {
        if ($credential -match $passwd_hash) {
            $login_success = $true
            break

        } else {
            $login_success= $false

        }
    }

    return $login_success
}

# Aquesta funció li dirà al usuari si ha aconseguit iniciar sessió o no i a més farà el log
function login([bool]$log, [string]$user_f) {

    # Generam la data del moment
    $datetime = Get-Date
    $date = $datetime.ToString("yyyy-MM-dd hh:mm:ss")

    # Comprovam si s'ha iniciat sessió segons el que ens indiqui la funció anterior
    if ($log) {
        # Si es correcte, li deim al usuari i introduïm el log corresponent
        Write-Host "Inici de sessió correcte"
        Write-Host "Benvingut $user_f"
        echo "Inici de sessió correcte del usuari $user_f a l'hora $date" >> C:\Users\Administrador\practica5\AGT_Logins.txt

    } else {
        # Si no es correcte, li demanam al usuari que torni a intentar i introduïm el log corresponent
        Write-Host "Inici de sesió incorrecte"
        Write-Host "Revisa les dades i torna a intentar"
        Write-Host "Aquest intent d'inici de sessió quedarà registrat"
        echo "Prova d'inici de sessió incorrecta del usuari $user_f a l'hora $date" >> C:\Users\Administrador\practica5\AGT_Logins.txt
    }
}



####################################################################################################################################
# INICI DEL SCRIPT #

# Li donam la benvinguda al usuari i li deim de que no diferenciam entre majúscules i minuscules
Write-Host "Hola! Inicia sessió per poder continuar"
Write-Host "AVÍS: No diferenciam entre majuscules i minuscules en el nom de usuari"

# Deixam un espai en blanc
Write-Host ""

# Primer demanam les dades al usuari
[string]$user = Read-Host "Introdueix el nom d'usuari"
[string]$passwd = Read-Host "Introdueix la contrasenya"

# Feim la comparació amb les dades que ens ha donat l'usuari i la "base de dades"
[bool]$login = comparar $user $passwd

# Segons el valor de login veiem si l'usuari ha aconseguit iniciar sessió o no
login $login $user