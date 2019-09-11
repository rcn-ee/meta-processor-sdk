PR_append = ".tisdk4"

MULTIMEDIA_append_omap-a15 = " \
    ${@['','chromium-ozone-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'video-graphics-test', '', d)} \
"

MULTIMEDIA_append_ti43x = " \
    ${@['','chromium-ozone-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
"

MULTIMEDIA_append_ti33x = " \
    ${@['','chromium-ozone-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
"
