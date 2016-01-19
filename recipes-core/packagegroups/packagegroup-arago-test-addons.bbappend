PR_append = ".tisdk3"

TEST_ADDONS_TI_append = " \
    cmem-test \
    "

TEST_ADDONS_TI_append_keystone = " \
    qmss-lld-test \
    pa-lld-test \
    cppi-lld-test \
    edma3-lld-test \
    rm-lld \
    rm-lld-test \
    sa-lld \
    sa-lld-test \
    traceframework-test \
    multiprocmgr-test \
    hplib-test \
    nwal-lld \
    nwal-lld-test \
    udma-test \
    mpm-transport-test \
    ipc-transport-qmss-test \
    ipsecmgr \
    netapi-test \
    "

TEST_ADDONS_TI_append_k2hk-evm = " \
    srio-lld-test \
    ipc-transport-srio-test \
    mmap-lld-test \
    hyplnk-lld-test \
    aif2-lld-test \
    "

TEST_ADDONS_TI_append_k2l-evm = " \
    dfe-lld-test \
    iqn2-lld-test \
    "

TEST_ADDONS_TI_append_k2e-evm = " \
    mmap-lld-test \
    hyplnk-lld-test \
    "

TEST_ADDONS_TI_remove_k2g-evm = " \
    nwal-lld-test \
    hplib-test \
    nwal-lld \
    ipc-transport-qmss-test \
    netapi-test \
"
