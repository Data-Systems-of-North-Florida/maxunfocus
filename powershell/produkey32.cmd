powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://hub.datasystems-fl.com/downloads/ProduKey32.exe', 'C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\ProduKey32.exe') }"
C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\ProduKey32.exe /stab "" >> C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\keys.txt
type C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\keys.txt
exit 0

