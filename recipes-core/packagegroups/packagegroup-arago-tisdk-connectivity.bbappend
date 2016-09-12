PR_append = ".tisdk2"

CONNECTIVITY_RDEPENDS_append_ti33x = " gadget-init"

CONNECTIVITY_COMMON = " \
    htop \
    iptables \
    iproute2 \
    iproute2-tc \
"

CONNECTIVITY_RDEPENDS_append_ti33x  = " ${CONNECTIVITY_COMMON}"
CONNECTIVITY_RDEPENDS_append_ti43x  = " ${CONNECTIVITY_COMMON}"
CONNECTIVITY_RDEPENDS_append_dra7xx = " ${CONNECTIVITY_COMMON}"
