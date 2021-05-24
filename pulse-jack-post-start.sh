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
