PR_append = ".tisdk8"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_DEVICETREE_append_ti43x = " am43x-epos-evm-hdmi.dtb \
                                   am437x-gp-evm-hdmi.dtb \
                                   am437x-idk-evm.dtb"

KERNEL_DEVICETREE_append_dra7xx = " am572x-idk.dtb \
                                    am571x-idk.dtb \
                                    am572x-idk-lcd-osd.dtb \
                                    am571x-idk-lcd-osd.dtb"
