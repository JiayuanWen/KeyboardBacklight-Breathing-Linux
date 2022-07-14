# Breathing Effect for Keyboard Backlight
Simple Linux shell script for making keyboard with monochrome backlight fade out and in. \
\
![Keyboard backlight breathing demo](https://i.postimg.cc/ncLrFZhJ/breathing-Keyboard-DEMO.gif)

<sub>Warning: Running this script will wipe your /var/log/auth.log, if you need this log, do not run this script; Running this script comsume about 3.2MB of RAM, take this into consideration if you're low on RAM.</sub>
<br>
<br>
## Instruction
1. Create a .sh script file, copy & paste the code from [here](https://github.com/JiayuanWen/KeyboardBacklight-Breathing-Linux/blob/main/breathingKeyboard_Template.sh)

2. Edit your script according to the comments

3. Move your script somewhere within /usr , script won't run in /home directory. 

4. Depends on your distro, you might have an app that manages startup applications (Ex. Linux Mint has *Startup Application*, Peppermint OS has *Session and Startup*), add a new startup app with full path to your script. If you don't have one, you can follow [this tutorial](https://www.baeldung.com/linux/run-script-on-startup) on how to set up a startup script/application.  
