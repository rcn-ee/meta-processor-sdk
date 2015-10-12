PR_append = "-tisdk16"

MAKEFILES_COMMON_remove_keystone = " refresh-screen \
                                     matrix-gui-browser \
"

MAKEFILES_append_omap-a15 = " \
    opencl-examples \
"

MAKEFILES_append_keystone = " u-boot-spl \
                              linux-dtbs \
                              cmem-mod \
"

KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
