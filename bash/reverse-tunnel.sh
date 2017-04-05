#!/bin/bash

# Internet accessible machine that script will connect to
REMOTESERVER="hub.datasystems-fl.com"
REMOTEUSER="dsiclient"
KEYFILE="data"
KEYDIR="/client_keys/"

# Local to server
LOCALPORT="80"
LOCALSSH="22"
LOCALAGI="5038"

# Connect to this port on your computer or the publicly available system
REMOTEPORT="7000"
REMOTESSH="7022"
REMOTEAGI="7028"

# Get deviceid from the Maxfocus RM Agent
DEVICEID=$(grep deviceid /usr/local/rmmagent/agentconfig.xml | sed s/\<.deviceid\>//g | sed s/...deviceid.//)
CLIENTID=$(grep clientid /usr/local/rmmagent/.agentcontext.cfg | sed s/\main.clientid=//g)
CLIENTNAME=$(grep clientname /usr/local/rmmagent/.agentcontext.cfg | s/\main.clientname=//g) 

# Default location to retrieve a key
KEYLOCATION=$REMOTESERVER$KEYDIR$DEVICEID/data

# remove current key data and retrieve fresh key
rm -f $KEYFILE
wget $KEYLOCATION --no-check-certificate

chmod 400 $KEYFILE

ssh -oStrictHostKeyChecking=no -i data -fN -R $REMOTEPORT:localhost:$LOCALPORT $REMOTEUSER@$REMOTESERVER
ssh -oStrictHostKeyChecking=no -i data -fN -R $REMOTESSH:localhost:$LOCALSSH $REMOTEUSER@$REMOTESERVER
ssh -oStrictHostKeyChecking=no -i data -fN -R $REMOTEAGI:localhost:$LOCALAGI $REMOTEUSER@$REMOTESERVER


