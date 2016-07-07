#!/bin/sh

# Based off:
# https://github.com/RobertCNelson/boot-scripts/blob/master/boot/am335x_evm.sh

# Assume some defaults
SERIAL_NUMBER="1234BBBK5678"
PRODUCT="am335x_evm"
manufacturer="ti.com"

# Read serial numberfrom the eerpom
eeprom="/sys/bus/i2c/devices/0-0050/eeprom"
if [ -f ${eeprom} ] ; then
    SERIAL_NUMBER=$(hexdump -e '8/1 "%c"' ${eeprom} -n 28 | cut -b 17-28)
    PRODUCT="BeagleBoneBlack"
    manufacturer="BeagleBoard.org"
fi

echo "SERIAL_NUMBER = ${SERIAL_NUMBER}"
echo "PRODUCT = ${PRODUCT}"


mac_address="/proc/device-tree/ocp/ethernet@4a100000/slave@4a100300/mac-address"
[ -r "$mac_address" ] || exit 0

host_addr=$(/usr/bin/hexdump -v -e '5/1 "%02X:" 1/1 "%02X"' "$mac_address")
echo "host_addr = ${host_addr}"

# Set the g_multi parameters
g_defaults="cdrom=0 ro=1 stall=0 removable=1 nofua=1"

g_product="iSerialNumber=${SERIAL_NUMBER} iManufacturer=${manufacturer} iProduct=${PRODUCT}"

g_network="host_addr=${host_addr}"

g_storage="file=/dev/mmcblk0p1"

modprobe g_multi ${g_storage} ${g_defaults} ${g_product} ${g_network}

# Bring up the USB network interface
ifup usb0
