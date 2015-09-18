require image-proc.inc

require recipes-ti/includes/ti-paths-append.inc
require recipes-ti/includes/ti-staging.inc

COMPATIBLE_MACHINE = "omap-a15"

DEPENDS = "ti-ipc"

S = "${WORKDIR}/git"

do_compile() {
    :
}

do_install() {
    install -d ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/demos/image_processing
    cp -pPrf ${S}/* ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/demos/image_processing
}

FILES_${PN} += "${PROC_SDK_INSTALL_DIR_RECIPE}/demos"

CREATE_SRCIPK = "1"