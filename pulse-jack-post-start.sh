#!/bin/bash
#
# Author: Julien MARY
# https://github.com/julienmary/umc404hd_setup
# License: GNU GPLv3
#
# Post action after starting Jack
# This script shall be called by qjackctl

pactl load-module module-jack-sink channels=4
pactl load-module module-jack-source channels=4
pacmd set-default-sink jack_out
pacmd set-default-source jack_in

# Bridging Alsa Midi and Jack Midi
/usr/bin/a2j_control --ehw && /usr/bin/a2j_control --start

# Enabling Audio via USB from Roland RD-88
# The device will appear as RD-88 Sound in Ardour
RD88_DEVICE_ID=$(cat /proc/asound/cards | grep RD88 | cut -d' ' -f 1)
if [ -n $RD88_DEVICE_ID]; then
    alsa_in -d hw:${RD88_DEVICE_ID} -j "RD-88 Sound"
fi
