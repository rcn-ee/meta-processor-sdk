PR_append = ".tisdk0"

MC_RDEPENDS = "matrix-gui-apps-images matrix-gui-submenus-mc-demo"

PACKAGES = "matrix-mc-demo-ipc \
            matrix-mc-demo-imageproc \
"

RDEPENDS_matrix-mc-demo-ipc        = "${MC_RDEPENDS}"
RDEPENDS_matrix-mc-demo-imageproc  = "${MC_RDEPENDS}"

FILES_matrix-mc-demo-ipc        = "${MATRIX_APP_DIR}/mc_demo_ipc/*"
FILES_matrix-mc-demo-imageproc  = "${MATRIX_APP_DIR}/mc_demo_imageproc/*"

FILES_matrix-mc-demo-ipc       += "${bindir}/mc_demo_ipc.sh"
FILES_matrix-mc-demo-imageproc += "${bindir}/mc_demo_imageproc.sh \
                                   ${bindir}/mc_run_dsp.sh \
"
