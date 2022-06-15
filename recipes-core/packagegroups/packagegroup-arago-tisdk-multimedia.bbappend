PR_append = ".tisdk4"

MULTIMEDIA_append_omap-a15 = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'video-graphics-test', '', d)} \
"

MULTIMEDIA_append = " \
    v4l-utils \
"
