PR_append = "-tisdk0"

SRCREV = "a448fa7754389093da0af24f856d3cf946df6d81"

PACKAGES_append = " \
    matrix-multimedia-demo-ivahdh264dec \
    matrix-multimedia-demo-ivahdh264enc \
"

RDEPENDS_matrix-multimedia-demo-ivahdh264dec = "${MULTIMEDIA_RDEPENDS}"
RDEPENDS_matrix-multimedia-demo-ivahdh264enc = "${MULTIMEDIA_RDEPENDS}"

FILES_matrix-multimedia-demo-ivahdh264dec = "${MATRIX_APP_DIR}/ivahd_multimedia_h264dec/*"
FILES_matrix-multimedia-demo-ivahdh264enc = "${MATRIX_APP_DIR}/ivahd_multimedia_h264enc/*"

FILES_matrix-multimedia-demo-ivahdh264dec      += "${bindir}/runIvahdH264Dec.sh"
FILES_matrix-multimedia-demo-ivahdh264enc      += "${bindir}/runIvahdH264Enc.sh"
