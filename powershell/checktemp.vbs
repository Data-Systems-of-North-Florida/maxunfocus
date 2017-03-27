strServer = "."  

Set objWMIService = GetObject("winmgmts:\\" & strServer & "\root\cimv2")  
Set colItems = objWMIService.ExecQuery("Select * from Win32_ComputerSystemProduct",,48)  


For Each objItem in colItems  
    VrtlChk = objItem.Name  
    If (InStr(1,VrtlChk,"Virtual",1) > 0) Then  
        wscript.echo "This is a Virtual Machine - No Thermal Zone Temperature Information to Report" 
    else  
    WScript.Echo "'Thermal Zone Temperature' Information for this Device can be seen below, Collected: " &Date &", " &Time &vbCrLf &vbCrLf 
        Set objWMI = GetObject("winmgmts://" & strServer & "/root\WMI")  
        Set objInstances = objWMI.InstancesOf("MSAcpi_ThermalZoneTemperature",48)  
        On Error Resume Next  
        For Each objInstance in objInstances  
                With objInstance  
            CurrTemp = .CurrentTemperature  
            CelTemp = (CurrTemp-2732)/10.0  
            WScript.Echo .InstanceName &", " &CelTemp &" C"  
                End With  
        On Error Goto 0  
        Next  

    End if  
Next

