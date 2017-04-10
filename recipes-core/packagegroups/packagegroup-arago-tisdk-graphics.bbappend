PR_append = ".tisdk7"

GRAPHICS_DEMO = ""
GRAPHICS_DEMO_omap-a15 = "\
    kmscube \
"

GRAPHICS_GC320_RDEPENDS = "\
    ti-gc320-driver \
    ti-gc320-libs \
    ti-gc320-tests \
"

GRAPHICS_RDEPENDS_append_omap-a15 = " ${GRAPHICS_GC320_RDEPENDS}"

GRAPHICS_RDEPENDS_remove_ti33x = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
"
GRAPHICS_RDEPENDS_remove_ti43x = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
"

RDEPENDS_${PN} += "${GRAPHICS_DEMO}"
