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

if not defined SDK_INSTALL_PATH (
    set SDK_INSTALL_PATH="C:/ti"
)

@REM Version of PDK
set PDK_VERSION=%SOC%_1_0_0

@REM Set PDK_PATH so path to PDK is known.  PDK_PATH is different from
@REM PDK_INSTALL_PATH so as to not conflict when configuring environment
set PDK_PATH="%SDK_INSTALL_PATH%/pdk_%PDK_VERSION%"

set PDK_PATH=%PDK_PATH:\=/%

call %PDK_PATH%/packages/pdksetupenv.bat

@echo PROCESSOR SDK BUILD ENVIRONMENT CONFIGURED
:ENDSCRIPT
@echo **************************************************************************
