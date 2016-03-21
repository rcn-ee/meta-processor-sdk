PR_append = ".tisdk0"

require ocl_1.1.8.0.inc

COMPATIBLE_MACHINE_append = "|k2g-evm"

S_k2g-evm = "${WORKDIR}/git/monitor_vayu"

BUILD_TARGET_dra7xx = "ARM_AM57"
BUILD_TARGET_k2g-evm = "ARM_K2G"
