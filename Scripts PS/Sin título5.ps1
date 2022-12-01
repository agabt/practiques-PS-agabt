[string]$time_string = Read-Host "hora"
$time = @()
$time = $time_string.Split(":")
[int]$hour = $time[0]
Write-Host $time[0];
Write-Host $hour;
[int]$minute = $time[1]
[int]$second = $time[2]

Write-Host "--------------------";
Write-Host $time
Write-Host $time_string
Write-Host $hour
Write-Host $minute
Write-Host $second