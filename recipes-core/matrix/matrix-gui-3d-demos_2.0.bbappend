PR_append = "-tisdk1"

SRCREV = "f04fd0eff211cff732a3b625166d2a59fd676f14"

PACKAGE_ARCH = "${MACHINE_ARCH}"

PACKAGES_append_omap-a15 = " \
    matrix-3d-demo-kmscube \
    matrix-3d-demo-kmscubevideo \
    matrix-3d-demo-navigation \
    matrix-3d-demo-exampleui \
"

MATRIX_3D_DEMO_SGX_QAF_PARAM = "1000"
MATRIX_3D_DEMO_SGX_QAF_PARAM_omap-a15 = "8000"

do_install_prepend() {
    find ${S} -name '*.desktop' -exec sed -i {} \
        -e "s|-qaf=[0-9]*|-qaf=${MATRIX_3D_DEMO_SGX_QAF_PARAM}|g" \;
}

3D_DEMOS_RDEPENDS_omap-a15 = "matrix-gui-apps-images matrix-gui-submenus-3d img-pvr-sdk"

RDEPENDS_matrix-3d-demo-kmscube       = "matrix-gui-apps-images matrix-gui-submenus-3d kmscube"
RDEPENDS_matrix-3d-demo-kmscubevideo  = "matrix-gui-apps-images matrix-gui-submenus-3d omapdrmtest"
RDEPENDS_matrix-3d-demo-navigation    = "${3D_DEMOS_RDEPENDS}"
RDEPENDS_matrix-3d-demo-exampleui     = "${3D_DEMOS_RDEPENDS}"

FILES_matrix-3d-demo-kmscube          = "${MATRIX_APP_DIR}/3d_kmscube/*"
FILES_matrix-3d-demo-kmscubevideo     = "${MATRIX_APP_DIR}/3d_kmscubevideo/*"
FILES_matrix-3d-demo-navigation       = "${MATRIX_APP_DIR}/3d_navigation/*"
FILES_matrix-3d-demo-exampleui        = "${MATRIX_APP_DIR}/3d_exampleui/*"

FILES_matrix-3d-demo-navigation      += "${bindir}/runOGLES2Navigation.sh"
FILES_matrix-3d-demo-exampleui       += "${bindir}/runOGLES2ExampleUI.sh"
