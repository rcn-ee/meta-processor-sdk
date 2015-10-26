PR_append = "-tisdk23"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://Makefile_uio-module-drv \
                   file://Makefile_boot-monitor \
                   file://Makefile_ipsecmgr-mod \
                   file://Makefile_hplib-mod \
                   file://Makefile_pru-icss \
"

MAKEFILES_COMMON_remove_keystone = " refresh-screen \
                                     matrix-gui-browser \
"

MAKEFILES_append_am335x-evm = " \
    pru-icss \
"

MAKEFILES_append_am437x-evm = " \
    pru-icss \
"

MAKEFILES_append_am57xx-evm = " \
    opencl-examples \
    pru-icss \
"

MAKEFILES_append_keystone = " u-boot-spl \
                              linux-dtbs \
                              boot-monitor \
                              cmem-mod \
                              uio-module-drv \
                              ipsecmgr-mod \
                              hplib-mod \
                              cryptodev \
                              ti-crypto-examples \
"

KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"

do_install_append() {
    sed -i -e "s/__BOOT_MONITOR_MAKE_TARGET__/${BOOT_MONITOR_MAKE_TARGET}/g" ${D}/Makefile

    sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
}
