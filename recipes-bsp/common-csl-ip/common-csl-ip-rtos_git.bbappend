PR_append = ".tisdk0"

# opencl-monitor does not distinguish between am57xx-evm and dra7xx-evm and thus
# requires the am57xx-evm CSL libraries for both devices.
TI_PDK_LIMIT_SOCS_append_dra7xx = " am571x am572x am574x"
