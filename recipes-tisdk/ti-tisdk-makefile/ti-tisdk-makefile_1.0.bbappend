PR_append = "-tisdk18"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://Makefile_uio-module-drv \
"

MAKEFILES_COMMON_remove_keystone = " refresh-screen \
                                     matrix-gui-browser \
"

MAKEFILES_append_omap-a15 = " \
    opencl-examples \
"

MAKEFILES_append_keystone = " u-boot-spl \
                              linux-dtbs \
                              cmem-mod \
                              uio-module-drv \
                              cryptodev \
                              ti-crypto-examples \
"

KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
