# maxfocus_api.ps1
. "C:\Users\super\.babun\cygwin\home\super\stafford_proj\maxunfocus\secrets.ps1"

$mf_api_url='https://www.systemmonitor.us/api/?apikey='
$mf_service='list_clients'
$mf_client_id=""
$mf_siteid=""
$mf_devicetype=""
$mf_deviceid=""

<#
https://SERVER/api/?apikey=yourAPItoken&service=list_sites&describe=true
https://SERVER/api/?apikey=yourAPItoken&service=list_failing_checks 
https://SERVER/api/?apikey=yourAPItoken&service=list_clients
https://SERVER/api/?apikey=yourAPItoken&service=list_sites&clientid=CLIENTID
https://SERVER/api/?apikey=yourAPItoken&service=list_servers&siteid=SITEID
https://SERVER/api/?apikey=yourAPItoken&service=list_workstations&siteid=SITEID
https://SERVER/api/?apikey=yourAPItoken&service=list_agentless_assets&siteid=SITEID
https://SERVER/api/?apikey=yourAPItoken&service=list_devices_at_client&CLIENTID&devicetype=server
https://SERVER/api/?apikey=yourAPItoken&service=list_device_monitoring_details&deviceid=DEVICEID
https://SERVER/api/?apikey=yourAPItoken&service=add_client&required_parameters=required_parameters[&optional_parameters=optional_parameters]
https://SERVER/api/?apikey=yourAPItoken&service=add_site&required_parameters=required_parameters[&optional_parameters=optional_parameters]
https://SERVER/api/?apikey=yourAPItoken&service=list_checks&required_parameters=required_parameters[&optional_parameters=optional_parameters]
https://SERVER/api/?apikey=yourAPItoken&service=list_check_config&required_parameters=required_parameters[&optional_parameters=optional_parameters]
https://SERVER/api/?apikey=yourAPItoken&service=list_outages&deviceid=DEVICEID
https://SERVER/api/?apikey=yourAPItoken&service=list_performance_history&required_parameters=required_parameters[&optional_parameters=optional_parameters]
https://SERVER/api/?apikey=yourAPItoken&service=list_drive_space_history&required_parameters=required_parameters[&optional_parameters=optional_parameters]

https://SERVER/api/?apikey=yourAPItoken&service=get_take_control_connection&deviceid=DEVICEID
https://SERVER/api/?apikey=yourAPItoken&service=get_take_control_connection_url&deviceid=DEVICEID

https://SERVER/api/?apikey=yourAPItoken&service=task_run_now&checkid=CHECKID
#>

$mf_reponse = New-Object System.Xml.XmlDocument
#$query_string = ("$mf_api_url" + "$max_api_key" + '&service=' + "$mf_service")
$query_string = ("$mf_api_url" + "$max_api_key" + '&service=&describe=true')
write-host("$query_string")
$mf_reponse.Load("$query_string")
#$clients = $mf_reponse.SelectNodes("//client")

#foreach ($client in $clients) {
#$query_string = ("$mf_api_url" + "$max_api_key" + '&service=' + 'list_sites&clientid=' + $client.clientid)
#write-host("$query_string")
#$mf_response.Load($clients)
#$client.appendChild("$client.clientid")
#}

Format-Xml -InputObject $mf_reponse

