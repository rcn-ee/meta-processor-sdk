PR_append = ".tisdk2"

GRAPHICS_GC320_RDEPENDS = "ti-gc320-driver-src"

GRAPHICS_RDEPENDS_append_omap-a15 = " ${@base_conditional('ARAGO_RT_ENABLE', '1', '', '${GRAPHICS_GC320_RDEPENDS}', d)}"
