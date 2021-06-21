DESCRIPTION = "LED Applications for Matrix v2"

require recipes-core/matrix/matrix-gui-apps-git.inc

PR = "${INC_PR}.0"

inherit allarch

S = "${WORKDIR}/git/led_apps"

# Make sure led submenu and app images have been installed
RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-led matrix-gui-helper-scripts"

FILES_${PN} += "${MATRIX_BASE_DIR}/*"
