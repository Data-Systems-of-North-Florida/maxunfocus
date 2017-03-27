#!/bin/bash
MAXAPIKEY=$(cat /root/.ssh/maxapikey)
APIURL='https://www.systemmonitor.us/api/?apikey='
REQUEST="$APIURL$MAXAPIKEY&service=list_clients" 
echo $REQUEST
curl $REQUEST
