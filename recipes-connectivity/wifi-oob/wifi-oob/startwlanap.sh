#!/bin/sh

board_model=$(tr -d '\0' </proc/device-tree/model)

if [[ $board_model == *"AM642 SK"* ]]
then
    defapname=AM64xSK-AP

    cd /usr/share/wl18xx

    ./load_wlcore.sh
    sleep 1

    a3=$(iw wlan0 info | grep "addr" | awk '{split($0,a,":"); print a[3]}')

    a4=$(iw wlan0 info | grep "addr" | awk '{split($0,a,":"); print a[4]}')

    a5=$(iw wlan0 info | grep "addr" | awk '{split($0,a,":"); print a[5]}')

    apname="${defapname}_${a3}${a4}${a5}"

    sed -i "s/ssid=.*/ssid=${apname}/g" /usr/share/wl18xx/hostapd.conf

    ./ap_start.sh
    sleep 1

    iperf3 -B 192.168.43.1 -p 6001 -s -i 5 &
fi
