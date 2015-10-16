PR_append = ".tisdk2"

ARAGO_TI_KEYSTONE_PKGS_append_keystone = "\
    ti-ipc \
    rm-lld \
    cmem \
    cmem-mod \
    multiprocmgr \
    mpm-transport \
    demo-image-proc \
    pa-lld \
    qmss-lld \
    hplib \
    hplib-mod \
    nwal-lld \
    netapi \
    pktlib \
    cppi-lld \
    ipsecmgr-mod \
    "
# Following package need to be fixed before adding:
# netapi-test
# ipsecmgr

ARAGO_TI_PKGS_append_k2hk-evm = "\
    srio-lld \
    "
