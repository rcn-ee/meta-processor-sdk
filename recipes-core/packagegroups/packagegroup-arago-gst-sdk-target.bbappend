PR_append = "-tisdk1"

GSTREAMER_omap-a15 = " \
    gstreamer1.0-dev \
    gstreamer1.0-plugins-base-dev \
    gstreamer1.0-plugins-good-dev \
    gstreamer1.0-plugins-bad-dev \
"

RDEPENDS_${PN}_omap-a15 = "\
    ${GSTREAMER} \
    gstreamer1.0-libav-dev \
"
