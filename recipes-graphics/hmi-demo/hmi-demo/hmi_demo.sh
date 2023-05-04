#!/bin/sh

### BEGIN INIT INFO
# Provides: HMI Demo
### END INIT INFO

HMI_MATRIX_SCRIPT=/etc/init.d/start_hmi_matrix.sh
PIDFILE=/var/run/hmi_demo.pid

start() {
    local HMI_MATRIX_CMD="$HMI_MATRIX_SCRIPT start &"

    eval $HMI_MATRIX_CMD
    local HMI_MATRIX_PID=$!

    # wait until the hmi_demo is started and quit if not within 10 seconds
    timeout -s SIGKILL 10 bash -c "until [ -e $PIDFILE ]; do sleep 0.1; done"

    if [ -e $PIDFILE ]; then
        exit 0
    else
        # kill start_hmi_matrix.sh script and exit with error
        kill -9 $HMI_MATRIX_PID
        exit 1
    fi
}

stop() {
    local HMI_MATRIX_CMD="$HMI_MATRIX_SCRIPT stop"
    eval $HMI_MATRIX_CMD
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

