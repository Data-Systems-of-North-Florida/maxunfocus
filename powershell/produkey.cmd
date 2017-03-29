powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://hub.datasystems-fl.com/downloads/ProduKey.exe', 'c:\ProduKey.exe') }"
c:\ProduKey.exe /stab "" >> c:\keys.txt
type c:\keys.txt
exit 0

