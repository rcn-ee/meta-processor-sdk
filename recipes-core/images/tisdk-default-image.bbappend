PR_append = ".tisdk4"

IMAGE_INSTALL_remove_am65xx = "\
    packagegroup-arago-tisdk-matrix \
    packagegroup-arago-tisdk-matrix-extra \
"

IMAGE_INSTALL_append_am65xx += " \
    docker \
    packagegroup-arago-gst-sdk-target \
    packagegroup-python3-jupyter \
"

IMAGE_INSTALL_append_am64xx += "\
    dropbear \
    linuxptp \
    iproute2 \
    tensorflow-lite \
    resize-rootfs \
    sysrepo \
    netopeer2-server \
    nw-configurator \
    tsn-yang-models \
"

IMAGE_INSTALL_append_am62xx += "\
    packagegroup-dl \
    libcamera \
    resize-rootfs \
    sysrepo \
    netopeer2-server \
    nw-configurator \
    tsn-yang-models \
"

DISTRO_FEATURES_am62axx-evm += "wayland"

AM62A_GRAPHICS_SUPPORT = "\
    qtbase-examples \
    qtdeclarative-tools \
    qtlocation-examples \
    qtmultimedia-examples \
    qtscript-examples \
    qtsvg-examples \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
    qtserialport-examples \
    qtcharts-examples \
    qt-tstat \
    packagegroup-arago-qte \
    weston-init \
    weston-examples \
    libegl \
    glmark2 \
"

IMAGE_INSTALL_append_am62axx += " \ 
    ${AM62A_GRAPHICS_SUPPORT} \
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
    python3-opencv \
    dialog \
    udev \
    sysrepo \
    netopeer2-server \
    nw-configurator \
    tsn-yang-models \
"

WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"
# Extra boot files for WIC images
do_image_wic_append_am64xx-evm[depends] += " wifi-oob:do_deploy"
IMAGE_BOOT_FILES_append_am64xx-evm += " wificfg"
do_image_wic_append_am62xx-evm[depends] += " wifi-oob:do_deploy"
IMAGE_BOOT_FILES_append_am62xx-evm += " wificfg"
do_image_wic_append_am62xx-lp-evm[depends] += " wifi-oob:do_deploy"
IMAGE_BOOT_FILES_append_am62xx-lp-evm += " wificfg"
