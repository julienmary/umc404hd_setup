#!/usr/bin/zsh
#
# Author: Julien MARY
# https://github.com/julienmary/umc404hd_setup
# License: GNU GPLv3
#
# Post action after stopping Jack to re-enable PulseAudio
# This script shall be called by qjackctl

# We unsuspend PulseAudio (PA suspend method)
# pacmd suspend false

# We re-enable pulseaudio (PA kill method)
systemctl --user start pulseaudio.socket
systemctl --user start pulseaudio.service
