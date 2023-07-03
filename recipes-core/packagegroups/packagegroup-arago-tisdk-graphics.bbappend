PR:append = ".psdk2"

GRAPHICS_DEMO = ""

GRAPHICS_DEMO:am62xx-evm = " \
    powervr-graphics \
"

GRAPHICS_DEMO:am62xx-lp-evm = " \
    powervr-graphics \
"

GRAPHICS_RDEPENDS:remove = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'ti-sgx-ddk-km', d)} \
"
GRAPHICS_RDEPENDS:remove = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'glmark2', d)} \
"

GRAPHICS_WAYLAND:remove = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'wayland-ivi-extension', d)} \
"

RDEPENDS:${PN}:append = " ${GRAPHICS_DEMO}"
