
$smart=(Get-WmiObject -namespace root\wmi -class MSStorageDriver_FailurePredictStatus -ErrorAction Silentlycontinue |  Select InstanceName, PredictFailure, ReadErrorsTotal, Reason )

if (($smart | Where-Object {$_.PredictFailure -eq 1}).length -gt 0){

Write-Host "S.M.A.R.T. Alert - Drive Failure"

$smart | Format-Table -Autosize

Exit 1001
}

Write-Host "S.M.A.R.T status passed"

$smart | Format-Table -Autosize

Exit 0


