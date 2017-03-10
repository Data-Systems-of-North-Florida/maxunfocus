$today = Get-Date -format yyyy-MM-dd
$linestart = "$today"
$carboniteloglocation = "C:\ProgramData\Carbonite\Carbonite Backup\Carbonite.log"
$carboniteuiloglocation = "C:\ProgramData\Carbonite\Carbonite Backup\CarboniteUI.log"

Write-host "Click for log details"
Write-host " "
Write-host " "
Write-host "Carbonite log entries beginning with $linestart "
Write-host "From log at: $carboniteloglocation"
Write-host " "
Get-Content $carboniteloglocation | Select-String "$linestart"

Write-host "Carbonite UI log entries beginning with $linestart "
Write-host "From log at: $carboniteuiloglocation"
Write-host " "
Get-Content $carboniteloglocation | Select-String "$linestart"
Exit 0


