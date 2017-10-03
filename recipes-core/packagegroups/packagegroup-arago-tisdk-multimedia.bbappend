PR_append = ".tisdk2"

MULTIMEDIA_append_omap-a15 = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'video-graphics-test', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'chromium-wayland', '', d)} \
"

MULTIMEDIA_append_ti43x = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'chromium-wayland', '', d)} \
"

MULTIMEDIA_append_ti33x = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'chromium-wayland', '', d)} \
"

MULTIMEDIA_remove_omap-a15 = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'dual-camera-demo', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'image-gallery', '', d)} \
"

MULTIMEDIA_remove_ti43x = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'dual-camera-demo', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'image-gallery', '', d)} \
"

MULTIMEDIA_remove_dra7xx = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
"
