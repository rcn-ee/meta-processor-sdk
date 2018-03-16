require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.10.inc

PR_append = ".tisdk1"

# opencl-monitor does not distinguish between am57xx-evm and dra7xx-evm and thus
# requires the am57xx-evm CSL libraries for both devices.
TI_PDK_LIMIT_SOCS_append_dra7xx = " am574x"

