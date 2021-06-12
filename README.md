# Behringer UMC404HD

This is the implementation of what is explained at https://wiki.archlinux.org/index.php/PulseAudio/Examples#The_shell_script_method with specific improvment related to the Behringer UMC404HD interface.

Everything there has been tested on UbuntuStudio 21.04 with the 4 inputs and Roland RD-88 added as analogic sound source + midi interface.

## Things you can customize

You must have a look at *pulse-jack-post-start.sh* and adapt the bottom to your own keyboard. There is not much to do and it should consist only in changing your keyboard identifier and the naming.