PR_append = ".tisdk3"

GRAPHICS_DEMO = ""
GRAPHICS_DEMO_omap-a15 = "\
    kmscube \
"

GRAPHICS_RDEPENDS_append_omap-a15 = "\
    ti-gc320-driver \
    ti-gc320-libs \
    ti-gc320-tests \
"

RDEPENDS_${PN} += "${GRAPHICS_DEMO}"
