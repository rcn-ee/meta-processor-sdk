#!/bin/bash
# Authors:
#    LT Thomas <ltjr@ti.com>
#    Chase Maupin
#    Franklin Cooper Jr.
#
# create-sdcard.sh v0.3

# This distribution contains contributions or derivatives under copyright
# as follows:
#
# Copyright (c) 2010, Texas Instruments Incorporated
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# - Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
# - Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
# - Neither the name of Texas Instruments nor the names of its
#   contributors may be used to endorse or promote products derived
#   from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Force locale language to be set to English. This avoids issues when doing
# text and string processing.
export LANG=C

# Determine the absolute path to the executable
# EXE will have the PWD removed so we can concatenate with the PWD safely
PWD=`pwd`
EXE=`echo $0 | sed s=$PWD==`
EXEPATH="$PWD"/"$EXE"
clear
cat << EOM

################################################################################

This script will create a bootable SD card from custom or pre-built binaries.

The script must be run with root permissions and from the bin directory of
the SDK

Example:
 $ sudo ./create-sdcard.sh

Formatting can be skipped if the SD card is already formatted and
partitioned properly.

################################################################################

EOM

AMIROOT=`whoami | awk {'print $1'}`
if [ "$AMIROOT" != "root" ] ; then

	echo "	**** Error *** must run script with sudo"
	echo ""
	exit
fi

THEPWD=$EXEPATH
PARSEPATH=`echo $THEPWD | grep -o '.*processor_sdk_rtos_am57xx_2_00_00_00/'`

if [ "$PARSEPATH" != "" ] ; then
PATHVALID=1
else
PATHVALID=0
fi

check_for_sdcards()
{
        # find the avaible SD cards
        ROOTDRIVE=`mount | grep 'on / ' | awk {'print $1'} |  cut -c6-8`
        PARTITION_TEST=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>\|\<mmcblk.\>' | grep -n ''`
        if [ "$PARTITION_TEST" = "" ]; then
	        echo -e "Please insert a SD card to continue\n"
	        while [ "$PARTITION_TEST" = "" ]; do
		        read -p "Type 'y' to re-detect the SD card or 'n' to exit the script: " REPLY
		        if [ "$REPLY" = 'n' ]; then
		            exit 1
		        fi
		        ROOTDRIVE=`mount | grep 'on / ' | awk {'print $1'} |  cut -c6-8`
		        PARTITION_TEST=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>\|\<mmcblk.\>' | grep -n ''`
	        done
        fi
}

# find the avaible SD cards
ROOTDRIVE=`mount | grep 'on / ' | awk {'print $1'} |  cut -c6-9`
if [ "$ROOTDRIVE" = "root" ]; then
    ROOTDRIVE=`readlink /dev/root | cut -c1-3`
else
    ROOTDRIVE=`echo $ROOTDRIVE | cut -c1-3`
fi

PARTITION_TEST=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>\|\<mmcblk.\>' | grep -n ''`

# Check for available mounts
check_for_sdcards

echo -e "\nAvailable Drives to write images to: \n"
echo "#  major   minor    size   name "
cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>\|\<mmcblk.\>' | grep -n ''
echo " "

DEVICEDRIVENUMBER=
while true;
do
	read -p 'Enter Device Number or 'n' to exit: ' DEVICEDRIVENUMBER
	echo " "
        if [ "$DEVICEDRIVENUMBER" = 'n' ]; then
                exit 1
        fi

        if [ "$DEVICEDRIVENUMBER" = "" ]; then
                # Check to see if there are any changes
                check_for_sdcards
                echo -e "These are the Drives available to write images to:"
                echo "#  major   minor    size   name "
                cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>\|\<mmcblk.\>' | grep -n ''
                echo " "
               continue
        fi

	DEVICEDRIVENAME=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>\|\<mmcblk.\>' | grep -n '' | grep "${DEVICEDRIVENUMBER}:" | awk '{print $5}'`
	if [ -n "$DEVICEDRIVENAME" ]
	then
	        DRIVE=/dev/$DEVICEDRIVENAME
	        DEVICESIZE=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>\|\<mmcblk.\>' | grep -n '' | grep "${DEVICEDRIVENUMBER}:" | awk '{print $4}'`
		break
	else
		echo -e "Invalid selection!"
                # Check to see if there are any changes
                check_for_sdcards
                echo -e "These are the only Drives available to write images to: \n"
                echo "#  major   minor    size   name "
                cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<sd.\>\|\<mmcblk.\>' | grep -n ''
                echo " "
	fi
done

echo "$DEVICEDRIVENAME was selected"
#Check the size of disk to make sure its under 16GB
if [ $DEVICESIZE -gt 17000000 ] ; then
cat << EOM

################################################################################

		**********WARNING**********

	Selected Device is greater then 16GB
	Continuing past this point will erase data from device
	Double check that this is the correct SD Card

################################################################################

EOM
	ENTERCORRECTLY=0
	while [ $ENTERCORRECTLY -ne 1 ]
	do
		read -p 'Would you like to continue [y/n] : ' SIZECHECK
		echo ""
		echo " "
		ENTERCORRECTLY=1
		case $SIZECHECK in
		"y")  ;;
		"n")  exit;;
		*)  echo "Please enter y or n";ENTERCORRECTLY=0;;
		esac
		echo ""
	done

fi
echo ""

DRIVE=/dev/$DEVICEDRIVENAME
NUM_OF_DRIVES=`df | grep -c $DEVICEDRIVENAME`

# This if statement will determine if we have a mounted sdX or mmcblkX device.
# If it is mmcblkX, then we need to set an extra char in the partition names, 'p',
# to account for /dev/mmcblkXpY labled partitions.
if [[ ${DEVICEDRIVENAME} =~ ^sd. ]]; then
	echo "$DRIVE is an sdx device"
	P=''
else
	echo "$DRIVE is an mmcblkx device"
	P='p'
fi

if [ "$NUM_OF_DRIVES" != "0" ]; then
        echo "Unmounting the $DEVICEDRIVENAME drives"
        for ((c=1; c<="$NUM_OF_DRIVES"; c++ ))
        do
                unmounted=`df | grep '\<'$DEVICEDRIVENAME$P$c'\>' | awk '{print $1}'`
                if [ -n "$unmounted" ]
                then
                     echo " unmounted ${DRIVE}$P$c"
                     sudo umount -f ${DRIVE}$P$c
                fi

        done
fi

# Refresh this variable as the device may not be mounted at script instantiation time
# This will always return one more then needed
NUM_OF_PARTS=`cat /proc/partitions | grep -v $ROOTDRIVE | grep -c $DEVICEDRIVENAME`
for ((c=1; c<"$NUM_OF_PARTS"; c++ ))
do
        SIZE=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<'$DEVICEDRIVENAME$P$c'\>'  | awk '{print $3}'`
        echo "Current size of $DEVICEDRIVENAME$P$c $SIZE bytes"
done

# check to see if the device is already partitioned
for ((  c=1; c<5; c++ ))
do
	eval "SIZE$c=`cat /proc/partitions | grep -v $ROOTDRIVE | grep '\<'$DEVICEDRIVENAME$P$c'\>'  | awk '{print $3}'`"
done

PARTITION="0"
if [ -n "$SIZE1" -a -n "$SIZE2" ] ; then
	if  [ "$SIZE1" -gt "72000" -a "$SIZE2" -gt "700000" ]
	then
		PARTITION=1

		if [ -z "$SIZE3" -a -z "$SIZE4" ]
		then
			#Detected 2 partitions
			PARTS=2

		else
			echo "SD Card is not correctly partitioned"
			PARTITION=0
		fi
	fi
else
	echo "SD Card is not correctly partitioned"
	PARTITION=0
	PARTS=0
fi


#Partition is found
if [ "$PARTITION" -eq "1" ]
then
cat << EOM

################################################################################

   Detected device has $PARTS partitions already

   Re-partitioning will allow the choice of 2 partitions only

################################################################################

EOM

	ENTERCORRECTLY=0
	while [ $ENTERCORRECTLY -ne 1 ]
	do
		read -p 'Would you like to re-partition the drive anyways [y/n] : ' CASEPARTITION
		echo ""
		echo " "
		ENTERCORRECTLY=1
		case $CASEPARTITION in
		"y")  echo "Now partitioning $DEVICEDRIVENAME ...";PARTITION=0;;
		"n")  echo "Skipping partitioning";;
		*)  echo "Please enter y or n";ENTERCORRECTLY=0;;
		esac
		echo ""
	done

fi

#Partition is not found, choose to partition 2 segments
if [ "$PARTITION" -eq "0" ]
then
echo "Now partitioning $DEVICEDRIVENAME with 2 partitions..."
PARTITION=2
echo " "
fi


#Section for partitioning the drive

#create only 2 partitions
if [ "$PARTITION" -eq "2" ]
then

# Set the PARTS value as well
PARTS=2
cat << EOM

################################################################################

		Now making 2 partitions

################################################################################

EOM
dd if=/dev/zero of=$DRIVE bs=1024 count=1024

SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`

echo DISK SIZE - $SIZE bytes

CYLINDERS=`echo $SIZE/255/63/512 | bc`

sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE << EOF
,9,0x0C,*
10,,,-
EOF

cat << EOM

################################################################################

		Partitioning Boot

################################################################################
EOM
	mkfs.vfat -F 32 -n "boot" ${DRIVE}${P}1
cat << EOM

################################################################################

		Partitioning rootfs

################################################################################
EOM
	mkfs.ext3 -L "rootfs" ${DRIVE}${P}2
	sync
	sync
	INSTALLSTARTHERE=n
fi



#Break between partitioning and installing file system
cat << EOM


################################################################################

   Partitioning is now done
   Continue to install filesystem or select 'n' to safe exit

   **Warning** Continuing will erase files any files in the partitions

################################################################################


EOM
ENTERCORRECTLY=0
while [ $ENTERCORRECTLY -ne 1 ]
do
	read -p 'Would you like to continue? [y/n] : ' EXITQ
	echo ""
	echo " "
	ENTERCORRECTLY=1
	case $EXITQ in
	"y") ;;
	"n") exit;;
	*)  echo "Please enter y or n";ENTERCORRECTLY=0;;
	esac
done

#Add directories for images
export START_DIR=$PWD
export PATH_TO_SDBOOT=boot

echo " "
echo "Mount the partitions "
mkdir $PATH_TO_SDBOOT

sudo mount -t vfat ${DRIVE}${P}1 boot/

echo " "
echo "Emptying partitions "
echo " "
sudo rm -rf  $PATH_TO_SDBOOT/*

echo ""
echo "Syncing...."
echo ""
sync
sync
sync

#check that in the right directory

THEEVMSDK=`echo $PARSEPATH | grep -o 'processor_sdk_rtos_am57xx_2_00_00_00'`

if [ $PATHVALID -eq 1 ]; then
echo "now installing:  $THEEVMSDK"
else
echo "no SDK PATH found"
ENTERCORRECTLY=0
	while [ $ENTERCORRECTLY -ne 1 ]
	do
		read -e -p 'Enter path to SDK : '  SDKFILEPATH

		echo ""
		ENTERCORRECTLY=1
		if [ -d $SDKFILEPATH ]
		then
			echo "Directory exists"
			echo ""
			PARSEPATH=`echo $SDKFILEPATH | grep -o '.*processor_sdk_rtos_am57xx_2_00_00_00/'`
			#echo $PARSEPATH

			if [ "$PARSEPATH" != "" ] ; then
			PATHVALID=1
			else
			PATHVALID=0
			fi
			#echo $PATHVALID
			if [ $PATHVALID -eq 1 ] ; then

			THEEVMSDK=`echo $SDKFILEPATH | grep -o 'processor_sdk_rtos_am57xx_2_00_00_00'`
			echo "Is this the correct SDK: $THEEVMSDK"
			echo ""
			read -p 'Is this correct? [y/n] : ' ISRIGHTPATH
				case $ISRIGHTPATH in
				"y") ;;
				"n") ENTERCORRECTLY=0;;
				*)  echo "Please enter y or n";ENTERCORRECTLY=0;;
				esac
			else
			echo "Invalid SDK path make sure to include ti-sdk-xxxx"
			ENTERCORRECTLY=0
			fi

		else
			echo "Invalid path make sure to include complete path"

			ENTERCORRECTLY=0
		fi
	done
fi



#check that files are in SDK
BOOTFILEPATH="$PARSEPATH/demos/image_processing/ipc/evmam572x/sd_card"
MLO=`ls $BOOTFILEPATH | grep MLO | awk {'print $1'}`
APP=`ls $BOOTFILEPATH | grep app | awk {'print $1'}`
TTIMG=`ls $BOOTFILEPATH | grep tiny | grep .bmp | awk {'print $1'}`
SSIMG=`ls $BOOTFILEPATH | grep small | grep .bmp | awk {'print $1'}`
MMIMG=`ls $BOOTFILEPATH | grep medium | grep .bmp | awk {'print $1'}`
LLIMG=`ls $BOOTFILEPATH | grep large | grep .bmp | awk {'print $1'}`

cat << EOM
################################################################################

	Copying files now... will take minutes

################################################################################

Copying boot partition
EOM

echo ""
#copy boot files out of board support
if [ "$MLO" != "" ] ; then
	cp $BOOTFILEPATH/$MLO $PATH_TO_SDBOOT/MLO
	echo "MLO copied"
else
	echo "MLO file not found"
fi
echo ""

if [ "$APP" != "" ] ; then
	cp $BOOTFILEPATH/$APP $PATH_TO_SDBOOT/app
	echo "app copied"
else
	echo "appe not found"
fi
echo ""

if [ "$TTIMG" != "" ] ; then
	cp $BOOTFILEPATH/$TTIMG $PATH_TO_SDBOOT/tiny.bmp
	echo "tiny.bmp copied"
else
	echo "tiny.bmp not found"
fi
echo ""

if [ "$SSIMG" != "" ] ; then
	cp $BOOTFILEPATH/$SSIMG $PATH_TO_SDBOOT/small.bmp
	echo "small.bmp copied"
else
	echo "small.bmp not found"
fi
echo ""

if [ "$MMIMG" != "" ] ; then
	cp $BOOTFILEPATH/$MMIMG $PATH_TO_SDBOOT/medium.bmp
	echo "medium.bmp copied"
else
	echo "medium.bmp not found"
fi
echo ""

if [ "$LLIMG" != "" ] ; then
	cp $BOOTFILEPATH/$LLIMG $PATH_TO_SDBOOT/large.bmp
	echo "large.bmp copied"
else
	echo "large.bmp not found"
fi
echo ""

echo ""
echo ""
echo "Syncing..."
sync
sync
sync
sync
sync
sync
sync
sync

echo " "
echo "Un-mount the partitions "
sudo umount -f $PATH_TO_SDBOOT


echo " "
echo "Remove created temp directories "
sudo rm -rf $PATH_TO_SDBOOT


echo " "
echo "Operation Finished"
echo " "
