# Simulació de calcul de IRPF
# Menys de 10000€ 5%
# Entre 10000-20000€ 15%
# Entre 20000-35000€ 20%
# Entre 35000-60000€ 30%
# Més de 60000€ 45%
# Dir-li al usuari quin es el % que aporta i quant de € es aquest %.

Write-Host "Quin es el teu % de IRPF i quant es?";

# Demanam el salari al usuari
[int]$salary = Read-Host "Quin es el teu salari anual (sense decimals)?";
[float]$irpf;

# Comprovam quin es el % de IRPF
if ($salary -lt 10000) {
    $irpf = 0.05;
    Write-Host "El teu % de IRPF és del 5%";

} elseif ($salary -ge 10000 -and $salary -lt 20000) {
    $irpf = 0.15;
    Write-Host "El teu % de IRPF és del 15%";

} elseif ($salary -ge 20000 -and $salary -lt 35000) {
    $irpf = 0.2;
    Write-Host "El teu % de IRPF és del 20%";

} elseif ($salary -ge 35000 -and $salary -lt 60000) {
    $irpf = 0.3;
    Write-Host "El teu % de IRPF és del 30%";

} elseif ($salary -ge 60000) {
    $irpf = 0.45;
    Write-Host "El teu % de IRPF és del 45%";
}

# Calculam la contribució i se la mostram al usuari
[float]$irpf_contr = $salary * $irpf;

Write-Host "La teva contribució és de "$irpf_contr;