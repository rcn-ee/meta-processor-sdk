PR_append = "-tisdk11"

SRCREV = "2cf7e20f595f0cb3067832903604d44851f69e5c"

PACKAGES += "matrix-multimedia-demo-h265dec"

RDEPENDS_matrix-multimedia-demo-h265dec      = "${MULTIMEDIA_RDEPENDS}"

FILES_matrix-multimedia-demo-h265dec      = "${MATRIX_APP_DIR}/arm_multimedia_h265dec/*"

FILES_matrix-multimedia-demo-h265dec      += "${bindir}/runH265Dec.sh"
