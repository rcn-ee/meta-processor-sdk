PR_append = "-tisdk0"

EXTRA_LIBS = ""
EXTRA_LIBS_append_omap-a15 = " cmem-mod-src"

RDEPENDS_${PN} += "${EXTRA_LIBS}"
