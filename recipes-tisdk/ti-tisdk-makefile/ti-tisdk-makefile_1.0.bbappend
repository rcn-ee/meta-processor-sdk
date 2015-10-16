PR_append = "-tisdk20"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://Makefile_uio-module-drv \
                   file://Makefile_boot-monitor \
                   file://Makefile_ipsecmgr-mod \
"

MAKEFILES_COMMON_remove_keystone = " refresh-screen \
                                     matrix-gui-browser \
"

MAKEFILES_append_omap-a15 = " \
    opencl-examples \
"

MAKEFILES_append_keystone = " u-boot-spl \
                              linux-dtbs \
                              boot-monitor \
                              cmem-mod \
                              uio-module-drv \
                              ipsecmgr-mod \
                              cryptodev \
                              ti-crypto-examples \
"

KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"

do_install_append() {
    sed -i -e "s/__BOOT_MONITOR_MAKE_TARGET__/${BOOT_MONITOR_MAKE_TARGET}/g" ${D}/Makefile
}
