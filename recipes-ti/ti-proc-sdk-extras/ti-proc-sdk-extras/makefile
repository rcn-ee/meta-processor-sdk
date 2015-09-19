#*******************************************************************************
#* FILE PURPOSE: Top level makefile for Creating Processor SDK Component 
#*               Libraries and binaries
#*******************************************************************************
#* FILE NAME: makefile
#*
#* DESCRIPTION: Defines Compiler tools paths, libraries , Build Options
#*
#*
#*******************************************************************************
#*
# (Mandatory) Specify where various tools are installed.

ifndef MAKE
export MAKE = make
endif

ifndef ECHO
export ECHO = echo
endif

ifndef PDK_SUB_COMP
PDK_SUB_COMP = all
endif

all: pdk
clean: pdk_clean

pdk:
	$(MAKE) -C $(PDK_INSTALL_PATH)/packages $(PDK_SUB_COMP)

pdk_clean:
	$(MAKE) -C $(PDK_INSTALL_PATH)/packages $(PDK_SUB_COMP)_clean
