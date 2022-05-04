#!/bin/sh

### BEGIN INIT INFO
# Provides: HMI Demo
### END INIT INFO

APP=/usr/bin/hmi_demo

PIDFILE=/var/run/hmi_demo.pid
LOGFILE=/var/log/hmi_demo.log

start() {
    if [ -f /var/run/$PIDNAME ] && kill -0 $(cat /var/run/$PIDNAME); then
        echo 'Service already running' >&2
        return 1
    fi
    echo 'Starting HMI Demo ..' >&2

    if test -z "$XDG_RUNTIME_DIR"; then
        export XDG_RUNTIME_DIR=/tmp/`id -u`-runtime-dir
        if ! test -d "$XDG_RUNTIME_DIR"; then
            mkdir --parents $XDG_RUNTIME_DIR
            chmod 0700 $XDG_RUNTIME_DIR
        fi
    fi

    # wait for weston
    while [ ! -e  $XDG_RUNTIME_DIR/wayland-0 ] ; do sleep 0.1; done
    export DISPLAY=:0.0

    local CMD="$APP &> $LOGFILE & echo \$!"
    eval $CMD > $PIDFILE
    echo 'Service started' >&2
}

stop() {
    if [ ! -f "$PIDFILE" ] || ! kill -0 $(cat "$PIDFILE"); then
        echo 'Service not running' >&2
        return 1
    fi
    echo 'Stopping HMI Demo ..' >&2
    kill -15 $(cat "$PIDFILE") && rm -f "$PIDFILE"
    echo 'Service stopped' >&2
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

