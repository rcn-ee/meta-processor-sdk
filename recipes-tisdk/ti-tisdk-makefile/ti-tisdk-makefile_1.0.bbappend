PR_append = ".tisdk48"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = "\
    file://Makefile_ti-ipc \
    file://Makefile_video-graphics-test \
    file://Makefile_jailhouse \
    file://Makefile_evse-hmi \
    file://Makefile_protection-relays-hmi \
    file://Makefile_ti-xsgx-ddk-km \
"

SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"

MAKEFILES_MATRIX_GUI_omapl138 = ""

MAKEFILES_remove = "\
    ${@bb.utils.contains("MACHINE_FEATURES", 'sgx', '', 'ti-sgx-ddk-km', d)} \
    ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', 'dual-camera-demo image-gallery', '', d)} \
    ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', 'qt-opencv-opencl-opengl-multithreaded barcode-roi', '', d)} \
"

MAKEFILES_append_keystone = " ti-ipc"

MAKEFILES_append_k2g = " opencl-examples \
                         openmpacc-examples \
"

MAKEFILES_append_omap-a15 = "\
                              ti-ipc \
                              big-data-ipc-demo \
               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'dual-camera-demo', d)} \
               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'image-gallery', d)} \
               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'evse-hmi', d)} \
               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'video-graphics-test', d)} \
               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', 'ti-xsgx-ddk-km', '', d)} \
"

MAKEFILES_append_omapl138 = " ti-ipc \
                              linux-dtbs \
                              u-boot-spl \
"
MAKEFILES_remove_omapl138 = "pru"
MAKEFILES_remove_omapl138 = "u-boot-legacy"

MAKEFILES_append_ti43x = " cmem-mod \
               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'evse-hmi', d)} \
               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', 'ti-xsgx-ddk-km', '', d)} \
"

MAKEFILES_append_ti33x = " \
               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'evse-hmi', d)} \
               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'protection-relays-hmi', d)} \
               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', 'ti-xsgx-ddk-km', '', d)} \
"

MAKEFILES_append_am57xx-evm = " jailhouse"

MAKEFILES_append_k2g = " pru-icss"


PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"

KERNEL_DEVICETREE_append_ti33x = " am335x-boneblack-iot-cape.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
KERNEL_DEVICETREE_append_ti43x = " ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
KERNEL_DEVICETREE_append_k2g-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"

KERNEL_DEVICETREE_append_am57xx-evm = " \
    am572x-evm-jailhouse.dtb \
    am572x-idk-jailhouse.dtb \
    am572x-idk-lcd-osd101t2045-jh.dtb \
    am572x-idk-lcd-osd101t2587-jh.dtb \
"


IPC_TOOLS_PATHS_C66 = "ti.targets.elf.C66="\$\${C6X_GEN_INSTALL_PATH}""
IPC_TOOLS_PATHS_M4  = "ti.targets.arm.elf.M4="\$\${TOOLCHAIN_PATH_M4}" ti.targets.arm.elf.M4F="\$\${TOOLCHAIN_PATH_M4}""
IPC_TOOLS_PATHS_C674 = "ti.targets.elf.C674="\$\${C6X_GEN_INSTALL_PATH}""

IPC_TOOLS_PATHS = ""
IPC_TOOLS_PATHS_append_keystone = " ${IPC_TOOLS_PATHS_C66}"
IPC_TOOLS_PATHS_append_omap-a15 = " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS_PATHS_M4}"
IPC_TOOLS_PATHS_append_omapl138 = " ${IPC_TOOLS_PATHS_C674}"

do_install_append() {
    sed -i -e "s/__IPC_TOOLS_PATHS__/${IPC_TOOLS_PATHS}/g" ${D}/Makefile
    sed -i -e "s/__TISDK_VERSION__/${TISDK_VERSION}/g" ${D}/Makefile

    cat >> ${D}/Rules.make << __EOF__

# Set EXEC_DIR to install example binaries
EXEC_DIR=__EXEC_DIR__
__EOF__
}
