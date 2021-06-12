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

# The command :
# amixer -c${n} contents
# allows to see the state of all I/O for the device n

# Behringer UMC404HD
# We ensure all input interfaces are enabled and gain is 0dB
interface="UMC404HD"
device_number=$(aplay -l | grep $interface | cut -d':' -f1 | cut -d' ' -f 2)

if [ -n "$(amixer -c${device_number} contents | grep UMC404HD)" ]; then
    # Make sure Input 3 and 4 are enabled.
    string_mic="$(amixer -c${device_number} contents | egrep "iface=MIXER,name='Mic Capture Switch'$")"
    amixer -c${device_number} cset ${string_mic} on,on,on,on

    # Set input Volume to 0dB
    string_micvol="$(amixer -c${device_number} contents | egrep "iface=MIXER,name='Mic Capture Volume'$")"
    amixer -c${device_number} cset ${string_micvol} 127,127,127,127
fi

# Bridging Alsa Midi and Jack Midi. This is standard and doesn't require customization.
/usr/bin/a2j_control --ehw && /usr/bin/a2j_control --start

# What is below needs to be adapted to your case. It aims at enabling your keyboard as analogic source if it is not only a midi interface.
# The command :
# $ cat /proc/asound/cards 
# will list all your available devices, and you may find your keyboard descriptor there.
# You can then adapt the lines below.
# Enabling Audio via USB from Roland RD-88
# The option -j will make the device appear as "RD-88 Sound" in Ardour sources.
KEYBOARD_ID="RD88"
RD88_DEVICE_ID=$(cat /proc/asound/cards | grep "$KEYBOARD_ID" | cut -d' ' -f 2)
if [ -n $RD88_DEVICE_ID ]; then
    alsa_in -d hw:${RD88_DEVICE_ID} -j "RD-88 Sound" > /dev/null 2>&1 &
fi


