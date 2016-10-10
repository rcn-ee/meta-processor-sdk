PR_append = ".tisdk6"

GRAPHICS_DEMO = ""
GRAPHICS_DEMO_omap-a15 = "\
    kmscube \
"

GRAPHICS_GC320_RDEPENDS = "\
    ti-gc320-driver \
    ti-gc320-libs \
    ti-gc320-tests \
"

GRAPHICS_RDEPENDS_append_omap-a15 = " ${@base_conditional('ARAGO_RT_ENABLE', '1', '', '${GRAPHICS_GC320_RDEPENDS}', d)}"
GRAPHICS_RDEPENDS_remove_ti33x = "\
    ${@base_contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
"
GRAPHICS_RDEPENDS_remove_ti43x = "\
    ${@base_contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
"

RDEPENDS_${PN} += "${GRAPHICS_DEMO}"
