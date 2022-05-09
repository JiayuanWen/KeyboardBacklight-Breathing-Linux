#!/bin/sh

CONTINUE="TRUE"

CONTINUE_DESCEND="TRUE"
CONTINUE_ASCEND="FALSE"

SLEEP_TIME=0.01
BRIGHTNESS=100
BRIGHTNESS_DIFF=2;

BRIGHTNESS_MAX=100;
BRIGHTNESS_MIN=0;

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

