@echo OFF

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if exist "C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\ProduKey32.exe"; "C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\ProduKey.exe"(
if %OS%==32BIT ( powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://hub.datasystems-fl.com/downloads/ProduKey.exe', 'C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\ProduKey.exe') }"
C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\ProduKey32.exe /stab "" >> C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\keys.txt
) else (
if %OS%==64BIT ( powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://hub.datasystems-fl.com/downloads/ProduKey.exe', 'C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\ProduKey.exe') }"
C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\ProduKey.exe /stab "" >> C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\keys.txt
)
type C:\ProgramData\AdvancedMonitoringAgentNetworkManagement\Downloads\keys.txt
exit 0
)

