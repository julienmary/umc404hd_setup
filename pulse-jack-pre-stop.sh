#!/bin/bash
#
# Author: Julien MARY
# https://github.com/julienmary/umc404hd_setup
# License: GNU GPLv3
#
# Pre action before stopping Jack
# This script shall be called by qjackctl

# Killing alsa_in
PID=$(ps -C alsa_in -o pid= | sed -e 's/ //g')
if [ "$PID" != "" ];then
    kill $PID
else
    echo 'false'
fi

# Unbridging Jack Midi and Alsa Midi
/usr/bin/a2j_control --stop && /usr/bin/a2j_control --dhw  

# Unloading Modules
SINKID=$(LANG=C pactl list | grep -B 1 "Name: module-jack-sink" | grep Module | sed 's/[^0-9]//g')
SOURCEID=$(LANG=C pactl list | grep -B 1 "Name: module-jack-source" | grep Module | sed 's/[^0-9]//g')
pactl unload-module $SINKID
pactl unload-module $SOURCEID
sleep 5
