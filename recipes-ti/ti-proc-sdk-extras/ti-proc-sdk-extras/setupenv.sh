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

# TI component root directory
TIROOT=~/ti

# Output directory for generated libraries
export LIBDIR=./lib

# *******************************************************************************
# ********************** CHECK REQUIRED ENVIRONMENT DEFINES BEGIN ***************
# *******************************************************************************

# Version of CG-Tools
CGT_VERSION=8.0.3

# Cross compiler prefix
GCC_CROSS_TOOL_PREFIX=arm-none-eabi-

# Version of GCC for ARM A15
GCC_VERSION_ARM_A15=${GCC_CROSS_TOOL_PREFIX}4_8-2014q3

# Version of GCC for ARM A8
GCC_VERSION_ARM_A8=${GCC_CROSS_TOOL_PREFIX}4_8-2014q3

# Version of GCC for ARM A9
GCC_VERSION_ARM_A9=${GCC_CROSS_TOOL_PREFIX}4_8-2014q3

# Version of CG-ARM-Tools for M4
CGT_M4_VERSION=5.2.5

# Version of FPULIB for ARM
GCC_VERSION_FPULIB=4.8.4

# Version of PDK
PDK_VERSION=${SOC}_1_0_0

# Version of XDC
XDC_VERSION=3_31_02_38

# Version of BIOS
BIOS_VERSION=6_42_02_29

# EDMA3 Version
EDMA_VERSION=02_12_01_22

# Version of the NDK
NDK_VERSION=2_24_03_35

if [ -z $C6X_GEN_INSTALL_PATH ]; then
    export C6X_GEN_INSTALL_PATH="${TIROOT}/ccsv6/tools/compiler/ti-cgt-c6000_$CGT_VERSION"
fi

if [ -z $TOOLCHAIN_PATH_A15 ]; then
    export TOOLCHAIN_PATH_A15="${TIROOT}/ccsv6/tools/compiler/gcc-$GCC_VERSION_ARM_A15"
fi

if [ -z $TOOLCHAIN_PATH_A8 ]; then
    export TOOLCHAIN_PATH_A8="${TIROOT}/ccsv6/tools/compiler/gcc-$GCC_VERSION_ARM_A8"
fi

if [ -z $TOOLCHAIN_PATH_A9 ]; then
    export TOOLCHAIN_PATH_A9="${TIROOT}/ccsv6/tools/compiler/gcc-$GCC_VERSION_ARM_A9"
fi

if [ -z $TOOLCHAIN_PATH_M4 ]; then
    export TOOLCHAIN_PATH_M4="${TIROOT}/ccsv6/tools/compiler/ti-cgt-arm_$CGT_M4_VERSION"
fi

if [ -z $FPULIB_PATH ]; then
    export FPULIB_PATH="$TOOLCHAIN_PATH_A9/lib/gcc/arm-none-eabi/$GCC_VERSION_FPULIB/fpu/"
fi

if [ -z $CROSS_TOOL_PRFX ]; then
    export CROSS_TOOL_PRFX="$GCC_CROSS_TOOL_PREFIX"
fi

if [ -z $PDK_INSTALL_PATH ]; then
    export PDK_INSTALL_PATH="${TIROOT}/pdk_$PDK_VERSION"
fi

if [ -z $XDC_INSTALL_PATH ]; then
    export XDC_INSTALL_PATH="${TIROOT}/xdctools_$XDC_VERSION"
fi

if [ -z $BIOS_INSTALL_PATH ]; then
    export BIOS_INSTALL_PATH="${TIROOT}/bios_$BIOS_VERSION"
fi

if [ -z $EDMA3LLD_BIOS6_INSTALLDIR ]; then
    export EDMA3LLD_BIOS6_INSTALLDIR="${TIROOT}/edma3_lld_$EDMA_VERSION"
fi

if [ -z $NDK_INSTALL_PATH ]; then
    export NDK_INSTALL_PATH="${TIROOT}/ndk_$NDK_VERSION"
fi

# *******************************************************************************
# ********************** CHECK REQUIRED ENVIRONMENT DEFINES END ***************
# *******************************************************************************

# Keystone 2 AIF2 LLD 
export SOC_FAMILY=KeyStone2
# PDK PARTNO
export PARTNO=am57xx

export CGTOOLS=$C6X_GEN_INSTALL_PATH

# *******************************************************************************
# ** Convert C6X_GEN_INSTALL_PATH and PDK_INSTALL_PATH to short name and to UNIX STYLE PATH  for XDC build **
# *******************************************************************************
export PATH=$PATH:$XDC_INSTALL_PATH/packages/xdc/services/io/release

export XDCCGROOT=$C6X_GEN_INSTALL_PATH

echo "**************************************************************************"
echo "CGTOOL INSTALL Directory  : $C6X_GEN_INSTALL_PATH"
echo "TOOLCHAIN A15 Directory   : $TOOLCHAIN_PATH_A15"
echo "TOOLCHAIN A8 Directory    : $TOOLCHAIN_PATH_A8"
echo "TOOLCHAIN A9 Directory    : $TOOLCHAIN_PATH_A9"
echo "TOOLCHAIN M4 Directory    : $TOOLCHAIN_PATH_M4"
echo "FPULIB_PATH               : $FPULIB_PATH"
echo "CROSS_TOOL_PRFX           : $CROSS_TOOL_PRFX"
echo "PDK_INSTALL_PATH          : $PDK_INSTALL_PATH"
echo "XDC_INSTALL_PATH          : $XDC_INSTALL_PATH"
echo "BIOS_INSTALL_PATH         : $BIOS_INSTALL_PATH"
echo "EDMA3LLD_BIOS6_INSTALLDIR : $EDMA3LLD_BIOS6_INSTALLDIR"
echo "NDK_INSTALL_PATH          : $NDK_INSTALL_PATH"

# *******************************************************************************
# *************************** XDC PATH Configuration ****************************
# *******************************************************************************

# Ensure that all the components inside PDK are a part of the XDC Path; such that
# one component can use another.
export XDCPATH="$XDCPATH;$PDK_INSTALL_PATH;$EDMA3LLD_BIOS6_INSTALLDIR/packages;$BIOS_INSTALL_PATH/packages;$NDK_INSTALL_PATH/packages"

# *******************************************************************************
# ************************** Build Tools Configuration **************************
# *******************************************************************************

# Compiler Tools:
export PATH=$PATH:$C6X_GEN_INSTALL_PATH/bin

# XDC Tools location:
export PATH=$PATH:$XDC_INSTALL_PATH:$XDC_INSTALL_PATH\bin

echo "PROCESSOR SDK BUILD ENVIRONMENT CONFIGURED"
echo "*******************************************************************************"
