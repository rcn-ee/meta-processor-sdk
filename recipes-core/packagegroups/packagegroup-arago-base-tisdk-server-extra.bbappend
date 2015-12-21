PR_append = ".tisdk6"

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
    "

# Remove ipsecmgr until it can be updated
#    ipsecmgr-mod
#    netapi-test

ARAGO_TI_PKGS_append_k2hk-evm = "\
    srio-lld \
    aif2-lld \
    "

ARAGO_TI_PKGS_remove_k2g-evm = " \
    netapi \
    hplib \
    nwal-lld \
"

RDEPENDS_${PN}_remove = "recovery-kernel \
                         kexec \
                         kdump \
"
