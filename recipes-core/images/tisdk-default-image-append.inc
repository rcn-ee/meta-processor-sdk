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

IMAGE_INSTALL_append_am62axx += " \ 
    ${AM62A_GRAPHICS_SUPPORT} \
"
