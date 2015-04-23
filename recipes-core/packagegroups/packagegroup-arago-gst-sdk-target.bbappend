PR_append = "-tisdk2"

GSTREAMER = " \
    gstreamer1.0-dev \
    gstreamer1.0-plugins-base-dev \
    gstreamer1.0-plugins-good-dev \
    gstreamer1.0-plugins-bad-dev \
"

RDEPENDS_${PN} = "\
    ${GSTREAMER} \
    gstreamer1.0-libav-dev \
"
