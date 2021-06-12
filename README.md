# umc404hd_setup
Behringer UMC404HD Linux set up (+Roland RD-88)

This is the implementation of what is explained at https://wiki.archlinux.org/index.php/PulseAudio/Examples#The_shell_script_method with
specific adaptations related to the Behringer UMC404HD interface. 

Everything there has been tested on UbuntuStudio 21.04 with 4 inputs and an midi controller plugged with MIDI cable straight into the
interface.

Also, this setup works with MIDI coming through USB, and audio signal coming from USB. That means that if you plug a Scene Piano like Roland RD-88, you'll get everything working : MIDI and Direct Audio.

# Behrringer UMC404HD

This is the implementation of what is explained at https://wiki.archlinux.org/index.php/PulseAudio/Examples#The_shell_script_method with specific improvment related to the Behringer UMC404HD interface.

Everything there has been tested on UbuntuStudio 21.04 with the 4 inputs and Roland RD-88 added as analogic sound source + midi interface.

## Things you can customize

You must have a look at *pulse-jack-post-start.sh* and adapt the bottom to your own keyboard. There is not much to do and it should consist only in changing your keyboard identifier and the naming.