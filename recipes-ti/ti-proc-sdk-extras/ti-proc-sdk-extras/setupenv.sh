#!/bin/bash
# ******************************************************************************
# * FILE PURPOSE: Environment Setup for building Processor SDK components
# ******************************************************************************
# * FILE NAME: setupenv.sh
# *
# * DESCRIPTION: 
# *  Configures and sets up the Build Environment for Processor SDK. 
# *
# *  The script file expects an argument specifying the SOC for which the
# *  environment will be configured
# *  valid inputs: am335x / am437x / am57xx
# *
# * USAGE:
# *  ./pdksetupenv.sh <soc>
# *
# * Copyright (C) 2015, Texas Instruments, Inc.
# *****************************************************************************

# *******************************************************************************
# ********************** GET PARAMETERS PASSED THROUGH ARGUMENT   ***************
# *******************************************************************************
# Parameter Validation: Check if the argument was passed to the batch file and
# if so we use that else we throw error

soc_list=("am335x" "am437x" "am57xx")

tempVar=$1
if [ ! -z $tempVar ]; then
    SOC=$tempVar
else
    echo "ERROR: SOC was not specified"
    echo "Exiting..."
    echo "*******************************************************************************"
    return 1
fi

in_list=0
for item in "${soc_list[@]}"
do
    if [ "$SOC" = "$item" ]; then
        in_list=1
        break
    fi
done

if [ $in_list -eq 0 ]; then
    echo "ERROR: SOC ($SOC) is invalid"
    echo "Exiting..."
    echo "*******************************************************************************"
    return 1
fi

# TI SDK root directory
if [ -z $SDK_INSTALL_PATH ]; then
    export SDK_INSTALL_PATH=~/ti
fi

# Version of PDK
PDK_VERSION=${SOC}_1_0_0

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

echo "PROCESSOR SDK BUILD ENVIRONMENT CONFIGURED"
echo "*******************************************************************************"
