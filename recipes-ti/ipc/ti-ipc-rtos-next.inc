DEPENDS_append_am65xx-hs-evm = " ti-cgt-arm-native \
                              gcc-linaro-baremetal-aarch64-native"

IPC_TARGETS_am65xx-hs-evm = "\
    gnu.targets.arm.A53F="${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}" \
    ti.targets.arm.elf.R5F="${M4_TOOLCHAIN_INSTALL_DIR}" \
"

EXTRA_OEMAKE_append_am65xx-hs-evm = " PDK_INSTALL_DIR=${PDK_INSTALL_DIR}"
