#!/bin/sh

### BEGIN INIT INFO
# Provides: HMI Demo
### END INIT INFO

APP=/usr/bin/hmi_demo
MATRIX_LAUNCH_SCRIPT=/etc/init.d/matrix-gui-2.0
DEMO_3D_LAUNCH_SCRIPT="/etc/init.d/start_3d_demo.sh"
PIDFILE=/var/run/hmi_demo.pid
LOGFILE=/var/log/hmi_demo.log

start() {
    # check if hmi-demo is already running
    if [ -f /var/run/$PIDNAME ] && kill -0 $(cat /var/run/$PIDNAME); then
        echo 'Service already running' >&2
        return 1
    fi

    echo 'Starting HMI Demo ..' >&2

    # setup XDG_RUNTIME_DIR if not already done
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

    local HMI_EXIT_CODE=-1

    while [ $HMI_EXIT_CODE -ne 0 ]; do
        # Launch HMI Demo and save the PID
        local CMD="$APP &> $LOGFILE & echo \$!"
        eval $CMD > $PIDFILE

        # wait until hmi exits
        wait `cat $PIDFILE`
        HMI_EXIT_CODE=$?

        # try to stop the hmi_demo to mark the status as stopped
        systemctl stop hmi_demo

        echo "HMI Demo exited with $HMI_EXIT_CODE"
        if [ `printf '%X' $HMI_EXIT_CODE` == "3D" ]; then
            eval $DEMO_3D_LAUNCH_SCRIPT
        else
            # Launch Matrix GUI
            local MATRIX_CMD="$MATRIX_LAUNCH_SCRIPT stop; $MATRIX_LAUNCH_SCRIPT start"
            eval $MATRIX_CMD
        fi
    done
}

stop() {
    if [ ! -f "$PIDFILE" ] || ! kill -0 $(cat "$PIDFILE"); then
        echo 'Service not running' >&2
        return 1
    fi
    echo 'Stopping HMI Demo ..' >&2
    kill -15 $(cat "$PIDFILE") && rm -f "$PIDFILE"
}

case "$1" in
    start )
        start
    ;;
    stop )
        stop
    ;;
    * )
        echo "Usage: $0 {start|stop|restart}"
esac

