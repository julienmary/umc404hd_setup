#!/bin/bash
#
# Author: Julien MARY
# https://github.com/julienmary/umc404hd_setup
# License: GNU GPLv3
#
# Post action after starting Jack
# This script shall be called by qjackctl

pactl load-module module-jack-sink channels=2
pactl load-module module-jack-source channels=4
pacmd set-default-sink jack_out
pacmd set-default-source jack_in

# Bridging Alsa Midi and Jack Midi
/usr/bin/a2j_control --ehw && /usr/bin/a2j_control --start

# Enabling Audio via USB from Roland RD-88
# The device will appear as RD-88 Sound in Ardour
RD88_DEVICE_ID=$(cat /proc/asound/cards | grep RD88 | cut -d' ' -f 2)
if [ -n $RD88_DEVICE_ID ]; then
    alsa_in -d hw:${RD88_DEVICE_ID} -j "RD-88 Sound"
fi

# The command :
# amixer -c${n} contents
# allows to see the state of all I/O for the device n

# Behringer UMC404HD
# We ensure all input interfaces are enabled and gain is 0dB
interface="UMC404HD"
device_number=$(aplay -l | grep $interface | cut -d':' -f1 | cut -d' ' -f 2)

if [ -n "$(amixer -c${device_number} contents | grep UMC404HD)" ]; then
    # Enabling Input 3 and 4
    string_mic="$(amixer -c${device_number} contents | egrep "iface=MIXER,name='Mic Capture Switch'$")"
    amixer -c${device_number} cset ${string_mic} on,on,on,on

    # Set input Volume to 0dB
    string_micvol="$(amixer -c${device_number} contents | egrep "iface=MIXER,name='Mic Capture Volume'$")"
    amixer -c${device_number} cset ${string_micvol} 127,127,127,127
fi
