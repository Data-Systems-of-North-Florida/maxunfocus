
$logpath="C:\Program Files\Carbonite\Carbonite Server Backup(x64)\debug\*Error.txt"

$datasize=((Get-ChildItem $logpath | get-content).Length)

if ( $datasize -gt 0 ) 
  {

    Write-Host "Found Data In Error Files"

    Get-ChildItem $logpath | get-content

    Exit 1001
  }

Write-Host "No error files found in Carbonite debug dir"

Exit 0
