@REM ******************************************************************************
@REM * FILE PURPOSE: Environment Setup for building Processor SDK components
@REM ******************************************************************************
@REM * FILE NAME: setupenv.bat
@REM *
@REM * DESCRIPTION: 
@REM *  Configures and sets up the Build Environment for Processor SDK.
@REM *
@REM * USAGE:
@REM *  setupenv.bat
@REM *
@REM * Copyright (C) 2015, Texas Instruments, Inc.
@REM *
@REM * Redistribution and use in source and binary forms, with or without 
@REM * modification, are permitted provided that the following conditions 
@REM * are met:
@REM *
@REM *   Redistributions of source code must retain the above copyright 
@REM *   notice, this list of conditions and the following disclaimer.
@REM *
@REM *   Redistributions in binary form must reproduce the above copyright
@REM *   notice, this list of conditions and the following disclaimer in the 
@REM *   documentation and/or other materials provided with the   
@REM *   distribution.
@REM *
@REM *   Neither the name of Texas Instruments Incorporated nor the names of
@REM *   its contributors may be used to endorse or promote products derived
@REM *   from this software without specific prior written permission.
@REM *
@REM * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
@REM * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
@REM * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
@REM * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
@REM * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
@REM * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
@REM * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
@REM * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
@REM * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
@REM * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
@REM * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
@REM *****************************************************************************
@echo off

@REM SoC for SDK environment
set SOC=__SDK_SOC__

@REM Version of Processor SDK
set PROC_SDK_VERSION=%SOC%_2_00_00_00

@REM Version of PDK
set PDK_VERSION=%SOC%_1_0_0

if not defined SDK_INSTALL_PATH (
    set SDK_INSTALL_PATH=C:/ti
)

if not defined PROC_SDK_INSTALL_PATH (
    set PROC_SDK_INSTALL_PATH=%SDK_INSTALL_PATH%/processor_sdk_rtos_%PROC_SDK_VERSION%
)
set PROC_SDK_INSTALL_PATH=%PROC_SDK_INSTALL_PATH:\=/%

@REM Set PDK_PATH so path to PDK is known.  PDK_PATH is different from
@REM PDK_INSTALL_PATH so as to not conflict when configuring environment
set PDK_PATH="%SDK_INSTALL_PATH%/pdk_%PDK_VERSION%"

set PDK_PATH=%PDK_PATH:\=/%

call %PDK_PATH%/packages/pdksetupenv.bat

@REM Destroy PDK_PATH since not part of environment
set PDK_PATH=

for /f "tokens=1* delims=" %%a in ('cmd /q/c path2dos "%PROC_SDK_INSTALL_PATH%"') do set PROC_SDK_INSTALL_PATH=%%a

@echo     PROC_SDK_INSTALL_PATH     : %PROC_SDK_INSTALL_PATH%
@echo **************************************************************************
@echo Changing to short name to support directory names containing spaces
@echo current directory: %PROC_SDK_INSTALL_PATH%

cd %PROC_SDK_INSTALL_PATH%
@echo PROCESSOR SDK BUILD ENVIRONMENT CONFIGURED
@echo **************************************************************************
