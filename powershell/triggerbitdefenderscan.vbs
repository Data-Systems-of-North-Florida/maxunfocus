'==============================================================================================================
'vbscript to force MAX RM's Managed Antivirus scan
'This language file is intended for the MAX RemoteManagement Dashboard
'
'Requires MAX RM's Dashboard API as a command line variable
'
'Original Author: Ernest Byrd 
' 
'Author information may be removed, if approved by Original Author
'==============================================================================================================
Const ForReading = 1  

'32 or 64 bit?
Set objShell = Wscript.CreateObject ("Wscript.shell")
If objShell.ExpandEnvironmentStrings("%PROGRAMFILES(x86)%")="%PROGRAMFILES(x86)%" then
    path = objShell.ExpandEnvironmentStrings("%PROGRAMFILES%")
    path2 = Left(path, Len(path) - 13)
    path3 = path2 & "Progra~1\"
Else
    path = objShell.ExpandEnvironmentStrings("%PROGRAMFILES(x86)%")
    path2 = Left(path, Len(path) - 19)
    path3 = path2 & "Progra~2\"
End If

'File Name & Path of settings.ini 
dvcCnfg = "settings.ini"
FileName = path3 & "Advanc~1\" & dvcCnfg

'Variable for API string
DevID = "DEVICEID"

'Verifies that settings.ini exists (looks for settings.ini in path appropriate for platform) 
Set objFSO = CreateObject("Scripting.FileSystemObject") 
If objFSO.FileExists(FileName) Then
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(FileName, ForReading)

    'Reads settings.ini until end of file 
    Do Until objFile.AtEndOfStream 
        'Place configuration file line entry into string
        strText = objFile.ReadLine 

        'Checks to see if DEVICEID is present in settings.ini entry; If there, collects the value 
        If (InStr(strText, DevID)) Then
            'Wscript.Echo strText
            'Trims variable to give value
            DevIDVal = Mid(strText,10)
            'Wscript.Echo DevIDVal
        End If
    Loop
    objFile.Close 
Else 
    Wscript.Echo "'settings.ini' is not detected on this machine." &vbCrLf 
    Wscript.Quit(1001) 
End If


'Verify API given
If Wscript.Arguments.Count > 0 Then
    APITkn = Wscript.Arguments.Item(0)
Else
    Wscript.Echo "MAX RM's Dashboard API string is required for proper functionality of script."
    Wscript.Quit(1001)
End If



'API URL to trigger Managed Antivirus scan on this device
strFileURL = "https://www.systemmonitor.us/api/?apikey=" & APITkn & "&service=mav_scan_start&deviceid=" & DevIDVal

'API call for Managed Antivirus scan
dim xHttp: Set xHttp = createobject("MSXML2.XMLHTTP.3.0")
xHttp.Open "GET", strFileURL, False
xHttp.Send

Wscript.Echo "Managed Antivirus Scan Command has been sent."
Wscript.Quit()

