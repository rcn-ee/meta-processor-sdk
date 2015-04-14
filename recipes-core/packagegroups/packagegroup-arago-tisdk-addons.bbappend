PR_append = "-tisdk0"

EXTRA_LIBS = ""
EXTRA_LIBS_append_omap-a15 = " cmem"

RDEPENDS_${PN} += "${EXTRA_LIBS}"
