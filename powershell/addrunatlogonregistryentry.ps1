$ErrorActionPreference = "SilentlyContinue"

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "Cibecs Continuity" -Value '"<c:\path>" <arguments>'

$a = Get-Date
Write-Host "SUCCESS - $a"

