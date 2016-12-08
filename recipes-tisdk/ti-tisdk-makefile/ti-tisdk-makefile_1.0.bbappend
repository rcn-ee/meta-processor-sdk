PR_append = ".tisdk27"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = "\
    file://Makefile_ti-gc320-driver \
    file://Makefile_ti-ipc \
    file://Makefile_barcode-roi \
"

MAKEFILES_append_keystone = " ti-ipc"

MAKEFILES_append_k2g-evm = " opencl-examples \
                             openmpacc-examples \
"

MAKEFILES_append_omap-a15 = " dual-camera-demo \
                              image-gallery \
                              uio-module-drv \
                              ${@base_conditional('ARAGO_RT_ENABLE', '1', '', 'ti-gc320-driver', d)} \
                              ti-ipc \
                              barcode-roi \
"

MAKEFILES_append_dra7xx = " linalg-examples"

MAKEFILES_append_keystone = " barcode-roi"
MAKEFILES_append_ti33x = " barcode-roi"
MAKEFILES_append_ti43x = " barcode-roi"

MAKEFILES_remove_ti33x = "${@base_contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)}"
MAKEFILES_remove_ti43x = "${@base_contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)}"

KERNEL_DEVICETREE_append_ti33x = " am335x-boneblack-iot-cape.dtb"

IPC_TOOLS_PATHS_A15 = "gnu.targets.arm.A15="\$\${TOOLCHAIN_PATH_A15}" gnu.targets.arm.A15F="\$\${TOOLCHAIN_PATH_A15}""
IPC_TOOLS_PATHS_C66 = "ti.targets.elf.C66="\$\${C6X_GEN_INSTALL_PATH}""
IPC_TOOLS_PATHS_M4  = "ti.targets.arm.elf.M4="\$\${TOOLCHAIN_PATH_M4}" ti.targets.arm.elf.M4F="\$\${TOOLCHAIN_PATH_M4}""

IPC_TOOLS_PATHS = "${IPC_TOOLS_PATHS_A15}"
IPC_TOOLS_PATHS_append_keystone = " ${IPC_TOOLS_PATHS_C66}"
IPC_TOOLS_PATHS_append_omap-a15 = " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS_PATHS_M4}"

do_install_append() {
    sed -i -e "s/__IPC_TOOLS_PATHS__/${IPC_TOOLS_PATHS}/g" ${D}/Makefile
    sed -i -e "s/__TISDK_VERSION__/${TISDK_VERSION}/g" ${D}/Makefile

    cat >> ${D}/Rules.make << __EOF__

# Set EXEC_DIR to install example binaries
EXEC_DIR=__EXEC_DIR__
__EOF__
}
