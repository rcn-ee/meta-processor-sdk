PR_append = ".tisdk10"

GRAPHICS_DEMO = ""
GRAPHICS_DEMO_omap-a15 = "\
    kmscube \
"

GRAPHICS_DEMO_am62xx-evm = "\
    hmi-demo \
    powervr-graphics \
    camera-demo \
"

GRAPHICS_DEMO_am62xx-lp-evm = "\
    hmi-demo \
    powervr-graphics \
"

GRAPHICS_RDEPENDS_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'ti-sgx-ddk-km', d)} \
"
GRAPHICS_RDEPENDS_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'glmark2', d)} \
"

GRAPHICS_WAYLAND_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'wayland-ivi-extension', d)} \
"

RDEPENDS_${PN} += "${GRAPHICS_DEMO}"
