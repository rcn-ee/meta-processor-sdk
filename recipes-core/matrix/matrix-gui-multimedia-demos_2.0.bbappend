PR_append = "-tisdk10"

SRCREV = "fc80e9d2f5e576cb99ad94883094567f3dd5ee78"

PACKAGES += "matrix-multimedia-demo-h265dec"

RDEPENDS_matrix-multimedia-demo-h265dec      = "${MULTIMEDIA_RDEPENDS}"

FILES_matrix-multimedia-demo-h265dec      = "${MATRIX_APP_DIR}/arm_multimedia_h265dec/*"

FILES_matrix-multimedia-demo-h265dec      += "${bindir}/runH265Dec.sh"
