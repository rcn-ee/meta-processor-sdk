PR_append = "-tisdk1"

GRAPHICS_DEMO = ""
GRAPHICS_DEMO_omap-a15 = "\
    kmscube \
"

GRAPHICS_RDEPENDS_append_omap-a15 = " omapdrm-pvr"

RDEPENDS_${PN} += "${GRAPHICS_DEMO}"
