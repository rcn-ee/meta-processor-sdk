PR_append = ".tisdk0"

require ocl-1.1.7.inc

COMPATIBLE_MACHINE_append = "|k2l-evm|k2e-evm"

DEPENDS_remove = " ti-llvm3.3 ti-llvm3.3-native"
DEPENDS_append = " ti-llvm3.6 ti-llvm3.6-native"

DEPENDS_append_keystone = " mpm-transport multiprocmgr"

export WANT_LLVM_RELEASE = "3.6-ti"

OCL_BUILD_TARGET_k2l-evm  = "ARM_K2L"
OCL_BUILD_TARGET_k2e-evm  = "ARM_K2E"
