#!/bin/bash

while : ; do
	IDLE_TIME=$(/home/aemini/screensaver/getIdle)
	if [ "$IDLE_TIME" -gt 15000 ]; then
		if [ ! -f /tmp/screen_off ]; then
			echo "EKRAN KAPALI"
			touch /tmp/screen_off
		fi
	else
		if [ -f /tmp/screen_off ]; then
			rm -f /tmp/screen_off
			echo "EKRAN ACIK"
		fi
	fi
	#echo $foo
	sleep 3
done
