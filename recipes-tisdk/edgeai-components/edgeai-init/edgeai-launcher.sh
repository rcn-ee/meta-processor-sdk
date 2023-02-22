#!/bin/sh

ENABLE_GUI=1
EDGEAI_INIT_SCRIPT=/opt/edgeai-gst-apps/init_script.sh
EDGEAI_GUI_APP=/usr/bin/edgeai-gui-app
PIDFILE=/var/run/edgeai-gui-app.pid
EDGEAI_WALLPAPER_UPDATE=/opt/edgeai-gst-apps/scripts/setup_wallpaper.sh

start_gui() {
    local EDGEAI_GUI_APP_CMD="$EDGEAI_GUI_APP -platform linuxfb &"
    eval $EDGEAI_GUI_APP_CMD
    echo $! > $PIDFILE
}

stop_gui() {
    if [ ! -f "$PIDFILE" ] || ! kill -0 $(cat "$PIDFILE"); then
        echo 'Service not running' >&2
        return 1
    fi
    echo 'Stopping EdgeAI GUI App ..' >&2
    kill -15 $(cat "$PIDFILE") && rm -f "$PIDFILE"
}

# Use this to wait for weston to be ready & kill it as it comes up
kill_weston() {
    for i in `seq 1 50`; do
        weston-info
        if [ $? -eq 0 ]; then
            break
        fi
        sleep 0.1
    done
    killall weston
}

case "$1" in
    start )
        source $EDGEAI_INIT_SCRIPT
        if [ $ENABLE_GUI -eq 1 ]; then
            echo "Starting edgeai-gui-app..."
            start_gui
        fi
    ;;
    stop )
        if [ $ENABLE_GUI -eq 1 ]; then
            stop_gui
        fi
    ;;
    exit )
        source $EDGEAI_INIT_SCRIPT
        #Set time, wait for network to come up
        if ! ps -ef  | grep -v grep | grep -q ntpd
        then
            ntpd -s
        fi
        echo "Applying wallpaper to linux frame buffer"
        $EDGEAI_WALLPAPER_UPDATE
    ;;
    restart )
        if [ $ENABLE_GUI -eq 1 ]; then
            stop_gui
            start_gui
        fi
    ;;
    kill_weston )
        kill_weston
    ;;
    * )
        echo "Usage: $0 {start|stop|restart}"
esac

