PR_append = "-tisdk0"

EXTRA_TOOLS = ""
EXTRA_TOOLS_omap-a15 = " nativesdk-ti-cgt6x"

RDEPENDS_${PN} += " ${EXTRA_TOOLS}"
