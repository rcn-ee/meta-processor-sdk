#!/bin/sh
### BEGIN INIT INFO
# Provides:          resize_rootfs
# Required-Start:    
# Required-Stop:     
# Default-Start:     
# Default-Stop:      
# Short-Description: Expand Rootfs of boot device
# Description:       Expand Rootfs (2nd partition) of boot device to full size
### END INIT INFO

. /etc/init.d/functions

start() {
    ROOT_PART=`mount | grep "/ " | cut -f1 -d' ' | cut -d'/' -f3`
    BOOT_DEV=${ROOT_PART%p*}

    if [[ "$BOOT_DEV" != *"mmc"* ]]; then
        # Not booting from EMMC / SD Card. So no need to extend the rootfs.
	exit 0
    fi

    FREE_SPACE=`parted /dev/$BOOT_DEV unit '%' print free | grep 'Free Space' | tail -n1 | awk '{print $3}'`

    if [[ ${FREE_SPACE%.*} -gt 0 ]]; then
        echo "$FREE_SPACE of /dev/$BOOT_DEV is free. Extending partition #2"
        echo ",+" | sfdisk -N 2 /dev/$BOOT_DEV --no-reread
        partprobe
        resize2fs /dev/$ROOT_PART
    fi

    exit 0
}

case "$1" in 
    start)
       start
       ;;
    stop)
       echo "This is a one-time script. Stop is not implemented."
       ;;
    restart)
       echo "This is a one-time script. Stop is not implemented. Starting again .."
       start
       ;;
    status)
       # code to check status of app comes here 
       # example: status program_name
       ;;
    *)
       echo "Usage: $0 {start|stop|status|restart}"
esac
