PR_append = ".tisdk0"

MULTIMEDIA = ""

MULTIMEDIA_append_dra7xx = " \
    hevc-arm-decoder-dev \
    hevc-arm-decoder-staticdev \
"

RDEPENDS_${PN} += "${MULTIMEDIA}"
