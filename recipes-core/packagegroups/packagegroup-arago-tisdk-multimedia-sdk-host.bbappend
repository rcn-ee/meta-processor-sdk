PR_append = ".tisdk1"

MULTIMEDIA_append_omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', 'video-graphics-test-src', d)}"

MULTIMEDIA_remove_ti33x = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-src', '', d)} \
"

MULTIMEDIA_remove_ti43x = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'dual-camera-demo-src', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'image-gallery-src', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-src', '', d)} \
"

MULTIMEDIA_remove_omap-a15 = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'dual-camera-demo-src', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'image-gallery-src', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-src', '', d)} \
"

MULTIMEDIA_remove_dra7xx = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'qt-opencv-opencl-opengl-multithreaded-src', '', d)} \
"
