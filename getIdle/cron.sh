#!/bin/bash

export DISPLAY=":0"

/usr/bin/who | /bin/grep tty | /usr/bin/awk {'print $1'} | \
/usr/bin/xargs -I {} sudo -u {} /usr/local/getIdle/run.sh
