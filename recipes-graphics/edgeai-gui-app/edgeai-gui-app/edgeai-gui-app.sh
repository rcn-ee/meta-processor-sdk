#!/bin/sh

### BEGIN INIT INFO
# Provides: EdgeAI GUI App
### END INIT INFO

EDGEAI_GUI_APP=/usr/bin/edgeai-gui-app
PIDFILE=/var/run/edgeai-gui-app.pid

start() {
    local EDGEAI_GUI_APP_CMD="$EDGEAI_GUI_APP -platform linuxfb &"
    eval $EDGEAI_GUI_APP_CMD
    echo $! > $PIDFILE
}

stop() {
    if [ ! -f "$PIDFILE" ] || ! kill -0 $(cat "$PIDFILE"); then
        echo 'Service not running' >&2
        return 1
    fi
    echo 'Stopping EdgeAI GUI App ..' >&2
    kill -15 $(cat "$PIDFILE") && rm -f "$PIDFILE"
}

case "$1" in
    start )
        start
    ;;
    stop )
        stop
    ;;
    restart )
        stop
        start
    ;;
    * )
        echo "Usage: $0 {start|stop|restart}"
esac

