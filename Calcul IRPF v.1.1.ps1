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
[string]$percent = "0%";
[float]$irpf;

# Comprovam quin es el % de IRPF
if ($salary -lt 10000) {
    $percent = "5%"
    $irpf = $salary * 0.05

} elseif ($salary -lt 20000) {
    $percent = "15%"
    $irpf = $salary * 0.15

} elseif ($salary -lt 35000) {
    $percent = "20%"
    $irpf = $salary * 0.2

} elseif ($salary -lt 60000) {
    $percent = "30%"
    $irpf = $salary * 0.3

} elseif ($salary -ge 60000) {
    $percent = "45%"
    $irpf = $salary * 0.45
}

# Calculam la contribució i se la mostram al usuari
Write-Host "La teva contribució és de"$percent "que això és" $irpf;