PR:append = ".psdk1"

IMAGE_INSTALL:remove:am65xx = " \
    packagegroup-arago-tisdk-matrix \
    packagegroup-arago-tisdk-matrix-extra \
"

IMAGE_INSTALL:append:am65xx = " \
    docker \
    packagegroup-arago-gst-sdk-target \
    packagegroup-python3-jupyter \
"

IMAGE_INSTALL:append:am64xx = " \
    dropbear \
    linuxptp \
    iproute2 \
    resize-rootfs \
"

IMAGE_INSTALL:append:am62xx = " \
    libcamera \
    resize-rootfs \
"

WIC_CREATE_EXTRA_ARGS:append = " --no-fstab-update"

# Extra boot files for WIC images
do_image_wic:append:am64xx-evm[depends] = " wifi-oob:do_deploy"
IMAGE_BOOT_FILES:append:am64xx-evm = " wificfg"
do_image_wic:append:am62xx-evm[depends] = " wifi-oob:do_deploy"
IMAGE_BOOT_FILES:append:am62xx-evm = " wificfg"
do_image_wic:append:am62xx-lp-evm[depends] = " wifi-oob:do_deploy"
IMAGE_BOOT_FILES:append:am62xx-lp-evm = " wificfg"

# Package overlay for jailhouse
KERNEL_DEVICETREE:append:am62xx-evm = " ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "ti/k3-am625-base-board-jailhouse.dtbo", "", d)}"
