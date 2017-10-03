PR_append = ".tisdk4"

GRAPHICS_RDEPENDS = "${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "ti-xsgx-ddk-km-src", "ti-sgx-ddk-km-src", d)}"

GRAPHICS_GC320_RDEPENDS = "ti-gc320-driver-src"

GRAPHICS_RDEPENDS_append_omap-a15 = " ${GRAPHICS_GC320_RDEPENDS}"
