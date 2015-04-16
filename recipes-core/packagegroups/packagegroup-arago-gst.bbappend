PR_append = "-tisdk1"

GSTREAMER_omap-a15 = "\
    gstreamer1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-base-meta \
    gstreamer1.0-plugins-good-meta \
    gstreamer1.0-plugins-bad-meta \
"

GSTREAMER_ACCEL_MM_omap-a15 = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer1.0-plugins-ducati', '', d)}"
GSTREAMER_ACCEL_MM_remove_omap-a15 = "gst-plugins-vpe"
GSTREAMER_ACCEL_MM_append_dra7xx = "${@base_contains('MACHINE_FEATURES', 'mmip', ' gstreamer1.0-plugins-vpe', '', d)}"

RDEPENDS_${PN}_omap-a15 = "\
    ${GSTREAMER} \
    ${GSTREAMER_ACCEL_MM} \
    gstreamer1.0-libav \
"
