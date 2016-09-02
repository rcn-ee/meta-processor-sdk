DESCRIPTION = "Touch demo descriptions for Matrix v2"
HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"

require recipes-core/matrix/matrix-gui-apps-git.inc

PR = "${INC_PR}.0"

inherit allarch

SRCREV = "e6651c1a79b5949817b09e06cc36d828fed8ff3e"

S = "${WORKDIR}/git/touch_apps"

# Make sure touch submenu and app images has been installed
RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-touch"

FILES_${PN} += "${MATRIX_BASE_DIR}/*"
