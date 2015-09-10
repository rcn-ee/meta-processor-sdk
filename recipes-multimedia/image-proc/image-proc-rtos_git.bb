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
    install -d ${D}${DEMOS_INSTALL_DIR_RECIPE}/image_processing
    cp -pPrf ${S}/* ${D}${DEMOS_INSTALL_DIR_RECIPE}/image_processing
}

FILES_${PN} += "${DEMOS_INSTALL_DIR_RECIPE}/image_processing"

CREATE_SRCIPK = "1"