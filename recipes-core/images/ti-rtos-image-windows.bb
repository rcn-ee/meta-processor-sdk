LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

inherit ti-rtos-image

export IMAGE_BASENAME = "ti-rtos-image-windows"

EXTRA_TOOLS = "\
    nativesdk-ti-cg-xml-installer-windows \
"

EXTRA_TOOLS_append_omap-a15 = "\
    nativesdk-ti-cgt6x-installer-windows \
"

IMAGE_INSTALL += "\
    ti-xdctools-windows-src \
"
