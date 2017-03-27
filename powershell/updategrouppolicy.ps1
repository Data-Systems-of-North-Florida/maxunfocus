' Updates Group Policy and does not restart the machine.

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' You can also try this code too
'VBScript: Updates Group Policy then restarts the machine.
'____________________________________________________
'  Set WshShell = CreateObject("Wscript.Shell")
'  Result = WshShell.Run("gpupdate /force",0,true)
'  Wscript.Quit(Result)
'_____________________________________________________

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

On Error Resume Next

Set WshShell = CreateObject("Wscript.Shell")
If Result = WshShell.Run("cmd /c echo n | gpupdate /force",0,true) Then
    'Wscript.Quit(Result)
    WScript.Echo "Group Policy updated"
Else 
    WScript.Echo "Script Check Failed"
    Wscript.Quit 1001
End If

If err.number<>0 then
        WScript.Echo "Script Check Failed"
        Wscript.Quit 1001
Else 
        WScript.Echo "Script Check Passed"
        Wscript.Quit 0
End If  

