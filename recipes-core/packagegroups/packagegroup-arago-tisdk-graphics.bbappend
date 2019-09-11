PR_append = ".tisdk11"

GRAPHICS_DEMO = ""
GRAPHICS_DEMO_omap-a15 = "\
    kmscube \
"

GRAPHICS_WAYLAND_remove_omap-a15 = "\
    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
"

GRAPHICS_WAYLAND_remove_k3 = "\
    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
"

GRAPHICS_WAYLAND_append_omap-a15 = "\
    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-ozone-wayland','',d)} \
"

GRAPHICS_WAYLAND_append_k3 = "\
    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-ozone-wayland','',d)} \
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
