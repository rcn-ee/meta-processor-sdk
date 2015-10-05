#!/bin/bash
# ******************************************************************************
# * FILE PURPOSE: Environment Setup for building Processor SDK components
# ******************************************************************************
# * FILE NAME: setupenv.sh
# *
# * DESCRIPTION: 
# *  Configures and sets up the Build Environment for Processor SDK.
# *
# * USAGE:
# *  ./setupenv.sh
# *
# * Copyright (C) 2015, Texas Instruments, Inc.
# *
# * Redistribution and use in source and binary forms, with or without 
# * modification, are permitted provided that the following conditions 
# * are met:
# *
# *   Redistributions of source code must retain the above copyright 
# *   notice, this list of conditions and the following disclaimer.
# *
# *   Redistributions in binary form must reproduce the above copyright
# *   notice, this list of conditions and the following disclaimer in the 
# *   documentation and/or other materials provided with the   
# *   distribution.
# *
# *   Neither the name of Texas Instruments Incorporated nor the names of
# *   its contributors may be used to endorse or promote products derived
# *   from this software without specific prior written permission.
# *
# * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
# * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
# * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
# * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
# * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
# * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
# * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
# * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# *****************************************************************************

# SoC for SDK environment
SOC=__SDK_SOC__

# Version of Processor SDK
PROC_SDK_VERSION=${SOC}_2_00_00_00

# Version of PDK
PDK_VERSION=${SOC}_1_0_0

# TI SDK root directory
if [ -z $SDK_INSTALL_PATH ]; then
    export SDK_INSTALL_PATH=~/ti
fi

if [ -z $PROC_SDK_INSTALL_PATH ]; then
    export PROC_SDK_INSTALL_PATH="${SDK_INSTALL_PATH}/processor_sdk_rtos_$PROC_SDK_VERSION"
fi

# Set PDK_PATH so path to PDK is known.  PDK_PATH is different from
# PDK_INSTALL_PATH so as to not conflict when configuring environment
export PDK_PATH=${SDK_INSTALL_PATH}/pdk_$PDK_VERSION

# Unset the input arguments so they're not passed to the sourced script
while (( "$#" )); do
    shift
done

pushd $PDK_PATH/packages > /dev/null
source ./pdksetupenv.sh
popd > /dev/null

# Destroy PDK_PATH since not part of environment
export PDK_PATH=

echo "    PROC_SDK_INSTALL_PATH     : $PROC_SDK_INSTALL_PATH"
echo ""
echo "PROCESSOR SDK BUILD ENVIRONMENT CONFIGURED"
echo "*******************************************************************************"
