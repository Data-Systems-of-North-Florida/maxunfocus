$env:chocolateyVersion='0.10.3'; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex", name: "Install Chocolatey"
$env:Path=$env:Path + ';C:\ProgramData\Chocolatey\bin'
choco install googlechrome -y
choco install firefox -y
choco install git.install -y
#choco install cutepdf -y
choco install notepadplusplus -y
#choco install dotnet4.5 -y
#choco install powershell -force
#choco install sysinternals -y
#choco install procexp -y
#choco install winscp -y
#choco install visualstudiocode -y
#choco install awscli -y
#choco install office365proplus -y

#Kaspersky Virus Removal Tool
#choco install kvrt -y




