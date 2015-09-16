LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

inherit ti-rtos-image

export IMAGE_BASENAME = "processor-sdk-rtos-image-windows"

EXTRA_TOOLS = "\
    nativesdk-ti-cg-xml-installer-windows \
"

IMAGE_INSTALL += "\
    ti-xdctools-windows-src \
"
