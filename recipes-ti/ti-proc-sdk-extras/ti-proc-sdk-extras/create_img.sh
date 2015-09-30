#!/bin/bash
#
# (C) Copyright 2015, Texas Instruments, Inc.
#
# Redistribution and use in source and binary forms, with or without 
# modification, are permitted provided that the following conditions 
# are met:
#
#   Redistributions of source code must retain the above copyright 
#   notice, this list of conditions and the following disclaimer.
#
#   Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the 
#   documentation and/or other materials provided with the   
#   distribution.
#
#   Neither the name of Texas Instruments Incorporated nor the names of
#   its contributors may be used to endorse or promote products derived
#   from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# This script was used by TI to make sdcard image from linux to
# be written to sdcard from windows.
# Primary linux use case is to directly write sdcard with
# create-sdcard.sh.  However, users building from linux but writing sdcard
# from windows could also use this script to make an sdcard image.

dd if=/dev/zero of=boot.img bs=512 count=2097152

mkfs.vfat -F 32 -n "boot" ./boot.img

# /mnt is mount point, boot.img is image
sudo mount ./boot.img /mnt 

sudo cp -f $1/* /mnt

sudo umount /mnt

################################################################################
# In order to put boot.img onto an actual SD Card:
#
# Linux:
# [ WARNING: wrong /dev/device entry can erase entire hard drive! ]
# dd if=boot.img of=/dev/<sdcard_device> bs=512
# 
# or use http://sourceforge.net/projects/win32diskimager/ on windows 
# This utility will not overwrie ide/sata hard drive, but will overwrite any
# selected media reader or usb hard drive.
################################################################################

