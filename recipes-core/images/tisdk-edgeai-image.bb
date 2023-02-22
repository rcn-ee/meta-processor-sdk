# Produces wic Image for Edge AI demos

require recipes-core/images/tisdk-default-image.bb

COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm|am62axx-evm"

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

EDGEAI_STACK = " \
    ti-tisdk-firmware-dev \
    ti-tidl-dev \
    ti-tidl-osrt-dev \
    ti-tidl-osrt-staticdev \
    edgeai-gst-apps \
    edgeai-init \
    ti-gpio-cpp \
    ti-gpio-py \
    edgeai-studio-agent \
    edgeai-tiovx-kernels-dev \
    edgeai-tiovx-modules-dev \
    edgeai-gst-plugins-dev \
    edgeai-dl-inferer-staticdev \
    edgeai-gst-apps-source \
    edgeai-gst-plugins-source \
    edgeai-tiovx-kernels-source \
    edgeai-tiovx-modules-source \
    edgeai-dl-inferer-source \
    ti-gpio-cpp-source \
    ti-gpio-py-source \
    edgeai-gui-app \
"

IMAGE_INSTALL_append_am62axx += " \
    ${AM62A_GRAPHICS_SUPPORT} \
    ${EDGEAI_STACK} \
    wallpaper \
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
    packagegroup-python3-jupyter \
    sysrepo \
    netopeer2-server \
    nw-configurator \
    tsn-yang-models \
"

export IMAGE_BASENAME = "tisdk-edgeai-image"

WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"

PR_append = ".tisdk0"
