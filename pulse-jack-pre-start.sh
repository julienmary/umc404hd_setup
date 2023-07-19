#!/usr/bin/zsh
#
# Author: Julien MARY
# https://github.com/julienmary/umc404hd_setup
# License: GNU GPLv3
#
# Pre action before starting Jack
# This script shall be called by qjackctl

# We suspend PulseAudio (PA suspend method)
# pacmd suspend true

# We completely disable pulseaudio (PA kill method)
systemctl --user stop pulseaudio.socket
systemctl --user stop pulseaudio.service


