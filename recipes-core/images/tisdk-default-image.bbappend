PR_append = ".tisdk1"

IMAGE_INSTALL_append_am64xx += "\
    dropbear \
    linuxptp \
    iproute2 \
    tensorflow-lite \
    resize-rootfs \
"

IMAGE_INSTALL_append_am62xx += "\
    packagegroup-dl \
    libcamera \
    resize-rootfs \
"

IMAGE_INSTALL_append_am62axx += "\
    packagegroup-dl \
    libcamera \
    resize-rootfs \
    libdrm-dev \
    libion \
    libion-dev \
    websocketd \
    ti-rpmsg-char-dev \
    libloki \
    boost \
    json-c \
    ocl-gl-headers \
    neo-ai-dlr-dev \
    python3-opencv \
    dialog \
    udev \
"

WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"
# Extra boot files for WIC images
do_image_wic_append_am64xx-evm[depends] += " wifi-oob:do_deploy"
IMAGE_BOOT_FILES_append_am64xx-evm += " wificfg"
do_image_wic_append_am62xx-evm[depends] += " wifi-oob:do_deploy"
IMAGE_BOOT_FILES_append_am62xx-evm += " wificfg"
do_image_wic_append_am62xx-lp-evm[depends] += " wifi-oob:do_deploy"
IMAGE_BOOT_FILES_append_am62xx-lp-evm += " wificfg"
