PR_append = "-tisdk0"

SRCREV = "c217bb3db1ca50b173c3ee9a9b17e4ebcb0b2875"

PACKAGE_ARCH = "${MACHINE_ARCH}"

PACKAGES_append_omap-a15 = " \
    matrix-3d-demo-kmscube \
    matrix-3d-demo-kmscubevideo \
"

3D_DEMOS_RDEPENDS_omap-a15 = "matrix-gui-apps-images matrix-gui-submenus-3d img-pvr-sdk"

RDEPENDS_matrix-3d-demo-kmscube       = "matrix-gui-apps-images matrix-gui-submenus-3d kmscube"
RDEPENDS_matrix-3d-demo-kmscubevideo  = "matrix-gui-apps-images matrix-gui-submenus-3d omapdrmtest"

FILES_matrix-3d-demo-kmscube          = "${MATRIX_APP_DIR}/3d_kmscube/*"
FILES_matrix-3d-demo-kmscubevideo     = "${MATRIX_APP_DIR}/3d_kmscubevideo/*"
