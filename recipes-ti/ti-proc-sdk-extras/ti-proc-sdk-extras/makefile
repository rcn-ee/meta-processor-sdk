#*******************************************************************************
#* FILE PURPOSE: Top level makefile for Creating Processor SDK Component
#*               Libraries and binaries
#*******************************************************************************
#* FILE NAME: makefile
#*
#* DESCRIPTION: Makefile for SDK level components
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

all: pdk demo
clean: pdk_clean demo_clean

help:
	@echo "Standard Targets:"
	@echo "    help      - Prints target information"
	@echo "    all       - Builds all Component targets"
	@echo "    clean     - Cleans all Component targets"
	@echo ""
	@echo "Component Targets:"
	@echo "    pdk       - Builds all targets within the PDK top-level makefile"
	@echo "    pdk_clean - Cleans all targets within the PDK top-level makefile"
	@echo ""
	@echo "Demo Targets:"
	@echo "    demo       - Builds image processing demo for AM572x EVM"
	@echo "    demo_clean - Cleans image processing demo for AM572x EVM"
	@echo ""
	@echo "    NOTE: Instructions for rebuilding all other components"
	@echo "          installed with Processor SDK can be found in each"
	@echo "          component's sub-directory"

pdk:
	$(MAKE) -C $(PDK_INSTALL_PATH) all

pdk_clean:
	$(MAKE) -C $(PDK_INSTALL_PATH) clean

demo:
	$(MAKE) -C ./demos/image_processing/ipc/evmam572x all

demo_clean:
	$(MAKE) -C ./demos/image_processing/ipc/evmam572x clean

