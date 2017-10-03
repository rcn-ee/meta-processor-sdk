PR_append = ".tisdk4"

GRAPHICS_RDEPENDS_remove = "ti-sgx-ddk-um-dev"
GRAPHICS_RDEPENDS_append = "${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "ti-xsgx-ddk-um-dev", "ti-sgx-ddk-um-dev", d)}"

GRAPHICS_GC320_RDEPENDS = "ti-gc320-libs-dev"

GRAPHICS_RDEPENDS_append_omap-a15 = " ${GRAPHICS_GC320_RDEPENDS}"
