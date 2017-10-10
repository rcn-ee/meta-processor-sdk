PR_append = ".tisdk8"

GRAPHICS_DEMO = ""
GRAPHICS_DEMO_omap-a15 = "\
    kmscube \
"

GRAPHICS_RDEPENDS_remove_ti33x = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
"
GRAPHICS_RDEPENDS_remove_ti43x = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
"

RDEPENDS_${PN} += "${GRAPHICS_DEMO}"
