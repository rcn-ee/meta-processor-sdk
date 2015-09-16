LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

inherit ti-rtos-image

export IMAGE_BASENAME = "processor-sdk-rtos-image-linux"

EXTRA_TOOLS = "\
    nativesdk-ti-cg-xml-installer-linux \
"

IMAGE_INSTALL += "\
    ti-xdctools-src \
"
