#!/bin/bash

IDLE_TIME=$(/usr/local/getIdle/getIdle)

if [[ "$IDLE_TIME" =~ ^-?[0-9]+$ ]]; then
	if [ "$IDLE_TIME" -gt 600000 ]; then
		if [ ! -f /tmp/screen_off ]; then
			/usr/bin/xset dpms force off
			touch /tmp/screen_off
		fi
	else
		if [ -f /tmp/screen_off ]; then
			rm -f /tmp/screen_off
		fi
	fi
fi
