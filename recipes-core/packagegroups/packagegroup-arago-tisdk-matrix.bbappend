PR_append = "-tisdk32"

MATRIX_APPS_remove_omap-a15 = " \
    matrix-3d-demo-kmscubevideo \
"

MATRIX_COMMON_APPS_remove = " \
    matrix-gui-oprofile-demos \
"

MATRIX_APPS_append_omap-a15 += " \
    matrix-gui-apps-dual-camera \
    matrix-gui-apps-image-gallery \
    matrix-multimedia-demo-audiocapture \
"

MATRIX_APPS_append_dra7xx += " \
"

MATRIX_APPS_append_ti43x = " \
    matrix-multimedia-demo-audiocapture \
"

# Remove until ported to gstreamer 1.6
#    matrix-multimedia-demo-dsp66imgproc

MATRIX_APPS_append_keystone += " \
"

# Remove until ported to gstreamer 1.6
#    matrix-multimedia-demo-dsp66imgproc
