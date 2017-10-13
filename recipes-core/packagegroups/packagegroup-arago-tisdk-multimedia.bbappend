PR_append = ".tisdk2"

MULTIMEDIA_append_omap-a15 = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'video-graphics-test', '', d)} \
    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'sgx', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
"

MULTIMEDIA_append_ti43x = " \
    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'sgx', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
"

MULTIMEDIA_append_ti33x = " \
    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'sgx', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
"
