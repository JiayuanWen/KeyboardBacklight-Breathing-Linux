#!/bin/sh

CONTINUE="TRUE"

CONTINUE_DESCEND="TRUE"
CONTINUE_ASCEND="FALSE"

# Adjust this value to control how often your keyboard backlight brightness updates. Value unit is second(s)
SLEEP_TIME=0.01 
# Maximum possible brightness for your keyboard backlight. This depends on your device. Mine is ranged at
# 0 to 100. 
BRIGHTNESS=100 
# Adjust this value to control how much your keyboard backlight brightness changes during each update. 
BRIGHTNESS_DIFF=2; 

# Adjust this value to change your keyboard backlight's maximum shown brightness. The maximum value you can set 
# is the same as the BRIGHTNESS variable above.
BRIGHTNESS_MAX=100; 
# Adjust this value to change your keyboard backlight's minimum shown brightness. The value you set should always
# be smaller than BRIGHTNESS_MAX.
BRIGHTNESS_MIN=0;

while [ "$CONTINUE" == "TRUE" ]
do
	# Lights fade out
	while [ "$CONTINUE_DESCEND" == "TRUE" ]
	do
		# Replace <Path to keyboard backlight brightness conf> with the file path to your keyboard 
		# backlight brightness configuration file.
		#
		# You can find your brightness config file path using the command "find / -name brightness".
		# There will be multiple paths listed, you will have to experiment with each.
		#
		# Warning: Some path will cause screen blackout. This can be fixed by force restarting your pc.
		# Be sure to save all your works before you run the script.
		sudo /bin/sh -c "echo $BRIGHTNESS > <Path to keyboard backlight brightness conf>"

		BRIGHTNESS=`expr $BRIGHTNESS - $BRIGHTNESS_DIFF`

		sleep $SLEEP_TIME

		if [ "$BRIGHTNESS" == "$BRIGHTNESS_MIN" ]
		then
			CONTINUE_DESCEND="FALSE"
			CONTINUE_ASCEND="TRUE"
		fi
	done

	# Lights fade in
	while [ "$CONTINUE_ASCEND" <= "TRUE" ]
	do
		# Replace <Path to keyboard backlight brightness conf> with the file path to your keyboard 
		# backlight brightness configuration file.
		#
		# You can find your brightness config file path using the command "find / -name brightness".
		# There will be multiple paths listed, you will have to experiment with each.
		#
		# Warning: Some path will cause screen blackout. This can be fixed by force restarting your pc.
		# Be sure to save all your works before you run the script.
		sudo /bin/sh -c "echo $BRIGHTNESS > <Path to keyboard backlight brightness file>"

		BRIGHTNESS=`expr $BRIGHTNESS + $BRIGHTNESS_DIFF`

		sleep $SLEEP_TIME

		if [ "$BRIGHTNESS" <= "$BRIGHTNESS_MAX" ]
		then
			CONTINUE_ASCEND="FALSE"
			CONTINUE_DESCEND="TRUE"
		fi
	done

done
