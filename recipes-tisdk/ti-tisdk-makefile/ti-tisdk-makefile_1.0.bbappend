PR_append = ".tisdk38"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = "\
    file://Makefile_ti-gc320-driver \
    file://Makefile_ti-ipc \
    file://Makefile_video-graphics-test \
    file://Makefile_jailhouse \
"

SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"

MAKEFILES_append_keystone = " ti-ipc"

MAKEFILES_append_k2g-evm = " opencl-examples \
                             openmpacc-examples \
"

MAKEFILES_append_omap-a15 = " dual-camera-demo \
                              image-gallery \
                              uio-module-drv \
                              ti-gc320-driver \
                              ti-ipc \
                              big-data-ipc-demo \
"

MAKEFILES_append_omap-a15 = " video-graphics-test"

MAKEFILES_append_ti43x = " cmem-mod"

MAKEFILES_append_am57xx-evm = " jailhouse"

MAKEFILES_append_k2g = " pru-icss"

MAKEFILES_remove_ti33x = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)}"
MAKEFILES_remove_ti43x = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)}"

MAKEFILES_remove_keystone = "ipsecmgr-mod"

PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"

KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb am335x-icev2.dtb"
KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb \
                                dra72-evm.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
                                dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb \
                                dra71-evm.dtb dra71-evm-lcd-auo-g101evn01.0.dtb"
KERNEL_DEVICETREE_dra7xx-hs-evm = "${KERNEL_DEVICETREE_dra7xx-evm}"
KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb \
                                am57xx-evm.dtb am57xx-evm-cam-mt9t111.dtb am57xx-evm-cam-ov10635.dtb \
                                am57xx-evm-reva3.dtb am57xx-evm-reva3-cam-mt9t111.dtb am57xx-evm-reva3-cam-ov10635.dtb \
                                am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb \
                                am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb \
                                am572x-evm-jailhouse.dtb am572x-idk-jailhouse.dtb"
KERNEL_DEVICETREE_am57xx-hs-evm = "${KERNEL_DEVICETREE_am57xx-evm}"
KERNEL_DEVICETREE_k2g = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb"


KERNEL_DEVICETREE_append_ti33x = " am335x-boneblack-iot-cape.dtb"
KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' am571x-idk-pru-excl-uio.dtb', '', d)}"

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
