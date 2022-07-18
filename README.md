# Behringer UMC404HD

This is the implementation of what is explained at https://wiki.archlinux.org/index.php/PulseAudio/Examples#The_shell_script_method with specific improvment related to the Behringer UMC404HD interface.

Everything there has been tested on UbuntuStudio 22.04 with the 4 inputs and Roland RD-88 added as analogic sound source + midi interface.

## Things you can customize

You must have a look at *pulse-jack-post-start.sh* and read comments. 

## Bugs

In my context the post start script works with zsh as shell.
If you change it to bash, it may not work, as it is the case for me.
I don't know have time to inspect how qjackctl is launching those scripts. My $USER is set up with zsh, and putting #!/bin/bash in the script has no effect on the $SHELL env variable.
After investigating why it was like this, replacing #!/bin/bash with #!/usr/bin/zsh made things work, but there is a mystery.