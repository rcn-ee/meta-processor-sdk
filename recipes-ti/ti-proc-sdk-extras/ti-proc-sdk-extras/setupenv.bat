@REM ******************************************************************************
@REM * FILE PURPOSE: Environment Setup for building Processor SDK components
@REM ******************************************************************************
@REM * FILE NAME: setupenv.bat
@REM *
@REM * DESCRIPTION: 
@REM *  Configures and sets up the Build Environment for Processor SDK.
@REM *
@REM *  The batch file expects an argument specifying the SOC for which the
@REM *  environment will be configured
@REM *  valid inputs: am335x / am437x / am57xx
@REM *
@REM * USAGE:
@REM *  pdksetupenv.bat <soc>
@REM *
@REM * Copyright (C) 2015, Texas Instruments, Inc.
@REM *****************************************************************************
@echo off
@REM *******************************************************************************
@REM ********************** GET PARAMETERS PASSED THROUGH ARGUMENT   ***************
@REM *******************************************************************************
@REM Parameter Validation: Check if the argument was passed to the batch file and
@REM if so we use that else we throw error

set soc_list=am335x am437x am57xx
set tempVar=%1
if defined tempVar (
    set SOC=%tempVar%
) else (
    echo ERROR: SOC was not specified
    goto CONFIG_ERR
)

for %%a in (%soc_list%) do (
    if %SOC% == %%a (
        goto end_soc_check
    )
)
echo ERROR: SOC (%SOC%) is invalid

:CONFIG_ERR
echo Exiting...
goto ENDSCRIPT

:end_soc_check

@REM *******************************************************************************
@REM ********************** CHECK REQUIRED ENVIRONMENT DEFINES BEGIN ***************
@REM *******************************************************************************

@REM Version of CG-Tools
set CGT_VERSION=8.0.3

@REM Cross compiler prefix
set GCC_CROSS_TOOL_PREFIX=arm-none-eabi-

@REM Version of GCC for ARM A15
set GCC_VERSION_ARM_A15=%GCC_CROSS_TOOL_PREFIX%4_8-2014q3

@REM Version of GCC for ARM A8
set GCC_VERSION_ARM_A8=%GCC_CROSS_TOOL_PREFIX%4_8-2014q3

@REM Version of GCC for ARM A9
set GCC_VERSION_ARM_A9=%GCC_CROSS_TOOL_PREFIX%4_8-2014q3

@REM Version of CG-ARM-Tools for M4
set CGT_M4_VERSION=5.2.5

@REM Version of PDK
set PDK_VERSION=%SOC%_1_0_0

@REM Version of XDC
set XDC_VERSION=3_31_02_38_core

@REM Version of BIOS
set BIOS_VERSION=6_42_02_29

@REM EDMA3 Version
set EDMA_VERSION=02_12_01_22

@REM Version of the NDK
set NDK_VERSION=2_24_03_35

if not defined C6X_GEN_INSTALL_PATH (
    set C6X_GEN_INSTALL_PATH="C:/ti/ccsv6/tools/compiler/ti-cgt-c6000_%CGT_VERSION%"
)
set C6X_GEN_INSTALL_PATH=%C6X_GEN_INSTALL_PATH:\=/%

if not defined TOOLCHAIN_PATH_A15 (
    set TOOLCHAIN_PATH_A15="C:/ti/ccsv6/tools/compiler/gcc-%GCC_VERSION_ARM_A15%"
)
set TOOLCHAIN_PATH_A15=%TOOLCHAIN_PATH_A15:\=/%

if not defined TOOLCHAIN_PATH_A8 (
    set TOOLCHAIN_PATH_A8="C:/ti/ccsv6/tools/compiler/gcc-%GCC_VERSION_ARM_A8%"
)
set TOOLCHAIN_PATH_A8=%TOOLCHAIN_PATH_A8:\=/%

if not defined TOOLCHAIN_PATH_A9 (
    set TOOLCHAIN_PATH_A9="C:/ti/ccsv6/tools/compiler/gcc-%GCC_VERSION_ARM_A9%"
)
set TOOLCHAIN_PATH_A9=%TOOLCHAIN_PATH_A9:\=/%

if not defined TOOLCHAIN_PATH_M4 (
    set TOOLCHAIN_PATH_M4="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_%CGT_M4_VERSION%"
)
set TOOLCHAIN_PATH_M4=%TOOLCHAIN_PATH_M4:\=/%

if not defined CROSS_TOOL_PRFX (
    set CROSS_TOOL_PRFX="%GCC_CROSS_TOOL_PREFIX%"
)
set CROSS_TOOL_PRFX=%CROSS_TOOL_PRFX:\=/%

if not defined PDK_INSTALL_PATH (
    set PDK_INSTALL_PATH="C:/ti/pdk_%PDK_VERSION%"
)
set PDK_INSTALL_PATH=%PDK_INSTALL_PATH:\=/%

if not defined XDC_INSTALL_PATH (
    set XDC_INSTALL_PATH="C:/ti/xdctools_%XDC_VERSION%"
)
set XDC_INSTALL_PATH=%XDC_INSTALL_PATH:\=/%

if not defined BIOS_INSTALL_PATH (
    set BIOS_INSTALL_PATH="C:/ti/bios_%BIOS_VERSION%"
)
set BIOS_INSTALL_PATH=%BIOS_INSTALL_PATH:\=/%

if not defined EDMA3LLD_BIOS6_INSTALLDIR (
    set EDMA3LLD_BIOS6_INSTALLDIR="C:/ti/edma3_lld_%EDMA_VERSION%"
)
set EDMA3LLD_BIOS6_INSTALLDIR=%EDMA3LLD_BIOS6_INSTALLDIR:\=/%

if not defined NDK_INSTALL_PATH (
    set NDK_INSTALL_PATH="C:/ti/ndk_%NDK_VERSION%"
)
set NDK_INSTALL_PATH=%NDK_INSTALL_PATH:\=/%

@REM *******************************************************************************
@REM ********************** CHECK REQUIRED ENVIRONMENT DEFINES END ***************
@REM *******************************************************************************

@REM PDK PARTNO
if not defined PARTNO set PARTNO=AM
if not defined SOC_FAMILY set SOC_FAMILY=AM

set CGTOOLS=%C6X_GEN_INSTALL_PATH%

@REM *******************************************************************************
@REM ** Convert paths to short name and to UNIX STYLE PATH for XDC build **
@REM *******************************************************************************
set PATH=%PATH%;%XDC_INSTALL_PATH%\packages\xdc\services\io\release

@REM *******************************************************************************
@REM This file requires path2dos.exe utility available from XDC tools. If path2dos.exe
@REM is not available in the build environment then short names for paths SHOULD be
@REM provided to environment variables e.g. C:\PROGRA~1\TEXASI~1\PDK_TC~4\packages.
@REM In Windows environment, "dir /x" and "dir /-n" displays the short names generated
@REM for non-8dot3 file and directory names.
@REM *******************************************************************************

@REM for /f "tokens=1* delims=" %%a in ('cmd /q/c path2dos %PDK_INSTALL_PATH%') do set PDK_INSTALL_PATH=%%a
for /f "tokens=1* delims=" %%a in ('cmd /q/c path2dos %C6X_GEN_INSTALL_PATH%') do set C6X_GEN_INSTALL_PATH=%%a
for /f "tokens=1* delims=" %%a in ('cmd /q/c path2dos %TOOLCHAIN_PATH_A15%') do set TOOLCHAIN_PATH_A15=%%a
for /f "tokens=1* delims=" %%a in ('cmd /q/c path2dos %TOOLCHAIN_PATH_A8%') do set TOOLCHAIN_PATH_A8=%%a
for /f "tokens=1* delims=" %%a in ('cmd /q/c path2dos %TOOLCHAIN_PATH_A9%') do set TOOLCHAIN_PATH_A9=%%a
for /f "tokens=1* delims=" %%a in ('cmd /q/c path2dos %TOOLCHAIN_PATH_M4%') do set TOOLCHAIN_PATH_M4=%%a
for /f "tokens=1* delims=" %%a in ('cmd /q/c path2dos %CROSS_TOOL_PRFX%') do set CROSS_TOOL_PRFX=%%a
for /f "tokens=1* delims=" %%a in ('cmd /q/c path2dos %XDC_INSTALL_PATH%') do set XDC_INSTALL_PATH=%%a
for /f "tokens=1* delims=" %%a in ('cmd /q/c path2dos %BIOS_INSTALL_PATH%') do set BIOS_INSTALL_PATH=%%a
for /f "tokens=1* delims=" %%a in ('cmd /q/c path2dos %EDMA3LLD_BIOS6_INSTALLDIR%') do set EDMA3LLD_BIOS6_INSTALLDIR=%%a
for /f "tokens=1* delims=" %%a in ('cmd /q/c path2dos %NDK_INSTALL_PATH%') do set NDK_INSTALL_PATH=%%a

set XDCCGROOT=%C6X_GEN_INSTALL_PATH%

echo **************************************************************************
echo CGTOOL INSTALL Directory  : %C6X_GEN_INSTALL_PATH%
echo TOOLCHAIN A15 Directory   : %TOOLCHAIN_PATH_A15%
echo TOOLCHAIN A8 Directory    : %TOOLCHAIN_PATH_A8%
echo TOOLCHAIN A9 Directory    : %TOOLCHAIN_PATH_A9%
echo TOOLCHAIN M4 Directory    : %TOOLCHAIN_PATH_M4%
echo CROSS_TOOL_PRFX           : %CROSS_TOOL_PRFX%
echo PDK_INSTALL_PATH          : %PDK_INSTALL_PATH%
echo XDC_INSTALL_PATH          : %XDC_INSTALL_PATH%
echo BIOS_INSTALL_PATH         : %BIOS_INSTALL_PATH%
echo EDMA3LLD_BIOS6_INSTALLDIR : %EDMA3LLD_BIOS6_INSTALLDIR%
echo NDK_INSTALL_PATH          : %NDK_INSTALL_PATH%

@echo off
@REM *******************************************************************************
@REM *************************** XDC PATH Configuration ****************************
@REM *******************************************************************************

@REM Ensure that all the components inside PDK are a part of the XDC Path; such
@REM that one component can use another.
set XDCPATH=../../..;%XDC_INSTALL_PATH%/packages;%PDK_INSTALL_PATH%/.
set XDCPATH=%XDCPATH%;%EDMA3LLD_BIOS6_INSTALLDIR%/packages;%BIOS_INSTALL_PATH%/packages;%NDK_INSTALL_PATH%/packages

@REM *******************************************************************************
@REM ************************** Build Tools Configuration **************************
@REM *******************************************************************************

@REM Windows Path
set PATH=C:/Windows/System32

@REM Compiler Tools:
set PATH=%PATH%;%C6X_GEN_INSTALL_PATH%/bin

@REM XDC Tools location:
set PATH=%PATH%;%XDC_INSTALL_PATH%;%XDC_INSTALL_PATH%\bin

@REM Set the Title Window appropiately.
Title Processor SDK Build Environment

@echo PROCESSOR SDK BUILD ENVIRONMENT CONFIGURED
:ENDSCRIPT
@echo **************************************************************************
