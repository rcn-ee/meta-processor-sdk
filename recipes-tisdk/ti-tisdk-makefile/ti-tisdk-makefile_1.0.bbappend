PR_append = ".tisdk7"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://Makefile_ipsecmgr-mod \
"

MAKEFILES_append_keystone = " \
    ipsecmgr-mod \
"

KERNEL_DEVICETREE_append_ti43x = " am43x-epos-evm-hdmi.dtb \
                                   am437x-gp-evm-hdmi.dtb \
                                   am437x-idk-evm.dtb"

KERNEL_DEVICETREE_append_dra7xx = " am572x-idk.dtb \
                                    am571x-idk.dtb \
                                    am572x-idk-lcd-osd.dtb \
                                    am571x-idk-lcd-osd.dtb"
