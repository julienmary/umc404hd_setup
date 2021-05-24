#!/bin/bash
#
# Author: Julien MARY
# https://github.com/julienmary/umc404hd_setup
# License: GNU GPLv3
#
# Pre action before starting Jack
# This script shall be called by qjackctl

# We suspend PulseAudio
pacmd suspend true

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
