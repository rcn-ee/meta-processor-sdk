PR_append = "-tisdk8"

SRCREV = "14a7c3d5fe0ada8eae91d40a11b277554ce33213"

PACKAGES += "matrix-multimedia-demo-h265dec"

RDEPENDS_matrix-multimedia-demo-h265dec      = "${MULTIMEDIA_RDEPENDS}"

FILES_matrix-multimedia-demo-h265dec      = "${MATRIX_APP_DIR}/arm_multimedia_h265dec/*"

FILES_matrix-multimedia-demo-h265dec      += "${bindir}/runH265Dec.sh"
