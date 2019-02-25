#!/bin/bash
### BEGIN INIT INFO
# Provides:          land.sh
# Required-start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts the svnd.sh daemon
# Description:       starts svnd.sh using start-stop-daemon
### END INIT INFO

sudo sslocal -s paladnix.top -p 9999 -b 127.0.0.1 -l 1080 -k www1964878036 -m aes-256-cfb -d start
