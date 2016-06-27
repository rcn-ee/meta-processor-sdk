DESCRIPTION = "Machine vision demo descriptions for Matrix v2"
HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"

require recipes-core/matrix/matrix-gui-apps-git.inc

PR = "${INC_PR}.0"

inherit allarch

SRCREV = "d7ddec8330553686a1d26bfeb898e391aa867931"

S = "${WORKDIR}/git/machinevision_apps"

# Make sure machinevision submenu and app images has been installed
MACHINEVISION_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-machinevision"

FILES_${PN} += "${MATRIX_BASE_DIR}/*"

PACKAGES = "matrix-machinevision-demo-dlp3dscanner"

RDEPENDS_matrix-machinevision-demo-dlp3dscanner = " \
    ${MACHINEVISION_RDEPENDS} \
    point-cloud-viewer \
"

FILES_matrix-machinevision-demo-dlp3dscanner    = "${MATRIX_APP_DIR}/machinevision_dlp_3d_scanner/*"
FILES_matrix-machinevision-demo-dlp3dscanner   += "${bindir}/runDlp3DScanner.sh"
