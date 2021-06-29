PR_append = ".tisdk20"

EXTRA_LIBS_append_keystone = " \
"
#    ipsecmgr-mod-src 

UTILS_append_k2g = " \
    pru-icss-src \
"

EXTRA_LIBS_append_dra7xx = " \
    tiovx-app-host-src \
"

UTILS_append_am335x-evm = " pru-adc-src"

NEO_AI_PACKAGES = " \
    ${@bb.utils.contains('MACHINE_FEATURES','mmip','neo-ai-dlr-demo-src','',d)} \
"

RDEPENDS_${PN}_append = " ${NEO_AI_PACKAGES}"
