PR_append = "-tisdk2"

SRCREV = "e89940ad8e69c223fadefe72f7d6c1d603f34d38"

PACKAGES_append = " \
    matrix-multimedia-demo-ivahdh264dec \
    matrix-multimedia-demo-ivahdh264enc \
    matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec \
"

RDEPENDS_matrix-multimedia-demo-ivahdh264dec             = "${MULTIMEDIA_RDEPENDS}"
RDEPENDS_matrix-multimedia-demo-ivahdh264enc             = "${MULTIMEDIA_RDEPENDS}"
RDEPENDS_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec = "${MULTIMEDIA_RDEPENDS}"

FILES_matrix-multimedia-demo-ivahdh264dec                = "${MATRIX_APP_DIR}/ivahd_multimedia_h264dec/*"
FILES_matrix-multimedia-demo-ivahdh264enc                = "${MATRIX_APP_DIR}/ivahd_multimedia_h264enc/*"
FILES_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec    = "${MATRIX_APP_DIR}/ivahd_multimedia_vip_vpe_mpeg4encdec/*"

FILES_matrix-multimedia-demo-ivahdh264dec               += "${bindir}/runIvahdH264Dec.sh"
FILES_matrix-multimedia-demo-ivahdh264enc               += "${bindir}/runIvahdH264Enc.sh"
FILES_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec   += "${bindir}/runIvahdVipVpeMpeg4EncDec.sh"
