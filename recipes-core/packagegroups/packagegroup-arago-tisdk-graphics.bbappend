PR:append = ".psdk0"

GRAPHICS_DEMO = ""

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
