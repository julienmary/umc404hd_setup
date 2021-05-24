#!/bin/bash
#
# Author: Julien MARY
# https://github.com/julienmary/umc404hd_setup
# License: GNU GPLv3
#
# Post action after stopping Jack to re-enable PulseAudio
# This script shall be called by qjackctl

pacmd suspend false
