PR_append = "-tisdk12"

SRCREV = "9190a4d981ab72c0a2425fa97c3f182288a00c88"

PACKAGES += "matrix-multimedia-demo-h265dec"

RDEPENDS_matrix-multimedia-demo-h265dec      = "${MULTIMEDIA_RDEPENDS}"

FILES_matrix-multimedia-demo-h265dec      = "${MATRIX_APP_DIR}/arm_multimedia_h265dec/*"

FILES_matrix-multimedia-demo-h265dec      += "${bindir}/runH265Dec.sh"
