get-command -module ssh-sessions

New-SSHSession -ComputerName 192.168.0.2 -Username admin -Password Broad-band92@

$Query = Invoke-SshCommand -ComputerName 192.168.0.2 -Command "no cli pager session"

$Query = Invoke-SshCommand -ComputerName 192.168.0.2 -Command "show current-config"

$Query | Out-File "C:\programdata\AdvancedMonitoringAgentNetworkManagement\firewallconfig.txt"

