PR_append = ".tisdk0"

MULTIMEDIA_remove_ti33x = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-dev', '', d)} \
"

MULTIMEDIA_remove_ti43x = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-dev', '', d)} \
"

MULTIMEDIA_remove_omap-a15 = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-dev', '', d)} \
"

MULTIMEDIA_remove_keystone = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'barcode-roi-dev', '', d)} \
"

MULTIMEDIA_remove_dra7xx = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
"
