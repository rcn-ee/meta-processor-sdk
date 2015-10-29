PR_append = ".tisdk4"

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
    netapi-test \
    "

ARAGO_TI_PKGS_append_k2hk-evm = "\
    srio-lld \
    "

RDEPENDS_${PN}_remove = "recovery-kernel \
                         kexec \
                         kdump \
"
