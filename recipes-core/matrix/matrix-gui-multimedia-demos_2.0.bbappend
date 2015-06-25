PR_append = "-tisdk9"

SRCREV = "85391c2f97bb0d436bbae115fe765b1102b3144a"

PACKAGES += "matrix-multimedia-demo-h265dec"

RDEPENDS_matrix-multimedia-demo-h265dec      = "${MULTIMEDIA_RDEPENDS}"

FILES_matrix-multimedia-demo-h265dec      = "${MATRIX_APP_DIR}/arm_multimedia_h265dec/*"

FILES_matrix-multimedia-demo-h265dec      += "${bindir}/runH265Dec.sh"
