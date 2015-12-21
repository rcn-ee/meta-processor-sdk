PR_append = ".tisdk1"

require recipes-ti/includes/tisdk-paths.inc
require ocl-1.1.7.inc

COMPATIBLE_MACHINE_append = "|k2l-evm|k2e-evm"

DEPENDS_remove = " ti-llvm3.3-native"
DEPENDS_append = " ti-llvm3.6-native"

DEPENDS_append = " openmp-rtos"
DEPENDS_append_keystone = " multiprocmgr-rtos qmss-lld-rtos cppi-lld-rtos rm-lld-rtos"

export C6636_PDK_DIR="${PDK_INSTALL_DIR}"
export MPM_DIR="${MPM_INSTALL_DIR}"
export OMP_DIR = "${OMP_INSTALL_DIR}"

BUILD_TARGET_k2hk-evm = "ARM_K2H"
BUILD_TARGET_k2l-evm  = "ARM_K2L"
BUILD_TARGET_k2e-evm  = "ARM_K2E"

EXTRA_OECMAKE_append = " -DBUILD_TARGET=${BUILD_TARGET}"

export AM57_PDK_DIR = "${PDK_INSTALL_DIR}"
