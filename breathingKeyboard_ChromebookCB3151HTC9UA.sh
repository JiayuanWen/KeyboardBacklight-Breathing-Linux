#!/bin/bash

# This is the script I use for my Chromebook 15 (CB315-1HT-C9UA) laptop.
# You can try run this script if you have the same laptop model but it is
# hightly likely your keyboard backlight uses config file in different 
# path for its brightness. 

CONTINUE="TRUE"

CONTINUE_DESCEND="TRUE"
CONTINUE_ASCEND="FALSE"

SLEEP_TIME=0.01
BRIGHTNESS=100
BRIGHTNESS_DIFF=2;

BRIGHTNESS_MAX=100;
BRIGHTNESS_MIN=0;

#Avoid password prompt from sudo
echo "mypassword" | sudo -S echo "Password bypassed"

while [ "$CONTINUE" == "TRUE" ]
do
	#Lights fade out
	while [ "$CONTINUE_DESCEND" == "TRUE" ]
	do
		sudo /bin/sh -c "echo $BRIGHTNESS > /sys/devices/platform/GOOG0002:00/leds/chromeos::kbd_backlight/brightness"

		BRIGHTNESS=`expr $BRIGHTNESS - $BRIGHTNESS_DIFF`

		sleep $SLEEP_TIME

		if [ "$BRIGHTNESS" == "$BRIGHTNESS_MIN" ]
		then
			CONTINUE_DESCEND="FALSE"
			CONTINUE_ASCEND="TRUE"
		fi
	done

	#Lights fade in
	while [ "$CONTINUE_ASCEND" == "TRUE" ]
	do
		sudo /bin/sh -c "echo $BRIGHTNESS > /sys/devices/platform/GOOG0002:00/leds/chromeos::kbd_backlight/brightness"

		BRIGHTNESS=`expr $BRIGHTNESS + $BRIGHTNESS_DIFF`

		sleep $SLEEP_TIME

		if [ "$BRIGHTNESS" == "$BRIGHTNESS_MAX" ]
		then
			CONTINUE_ASCEND="FALSE"
			CONTINUE_DESCEND="TRUE"
		fi
	done

done
