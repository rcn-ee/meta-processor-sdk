PR_append = ".tisdk1"

GRAPHICS_GC320_RDEPENDS = "ti-gc320-libs-dev"

GRAPHICS_RDEPENDS_append_omap-a15 = " ${@base_conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-processor-sdk-rt', '', '${GRAPHICS_GC320_RDEPENDS}', d)}"
