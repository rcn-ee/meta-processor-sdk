PR_append = ".tisdk0"

require ocl_1.1.8.0.inc

COMPATIBLE_MACHINE_append = "|k2g-evm"

DEPENDS_append_k2g-evm = " mpm-transport multiprocmgr"
DEPENDS_remove_k2g-evm = " libulm"

OCL_BUILD_TARGET_k2g-evm  = "ARM_K2G"

ENABLE_ULM = "1"
ENABLE_ULM_k2g-evm = "0"

EXTRA_OECMAKE += "-DENABLE_ULM=${ENABLE_ULM}"
