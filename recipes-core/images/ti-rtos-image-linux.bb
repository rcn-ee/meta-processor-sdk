LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

inherit ti-rtos-image

export IMAGE_BASENAME = "ti-rtos-image-linux"

EXTRA_TOOLS_append_omap-a15 = "nativesdk-ti-cgt6x-installer-linux"
