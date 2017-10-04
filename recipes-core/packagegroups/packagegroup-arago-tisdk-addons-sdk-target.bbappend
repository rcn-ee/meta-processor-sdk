PR_append = "-tisdk27"

EXTRA_PACKAGES_remove = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'voxelsdk-dev', '', d)}"

UTILS_append_ti33x = " \
    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', "opencv-dev", d)} \
"

UTILS_append_ti43x = " \
    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', "opencv-dev", d)} \
"

UTILS_append_omap-a15 = " \
    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', "opencv-dev", d)} \
"

UTILS_append_keystone = " \
    opencv-dev \
"

EXTRA_LIBS_append_keystone = " \
    mmap-lld-staticdev \
    ipsecmgr-dev \
    ipsecmgr-staticdev \
"

EXTRA_LIBS_append_k2hk-evm = " \
    aif2-lld-dev \
    aif2-lld-staticdev \
    netapi-dev \
    netapi-staticdev \
"

EXTRA_LIBS_append_k2l-evm = " \
    netapi-dev \
    netapi-staticdev \
"

EXTRA_LIBS_append_k2e-evm = " \
    netapi-dev \
    netapi-staticdev \
"

EXTRA_LIBS_append_k2g-evm = " \
    icss-emac-lld-dev \
    icss-emac-lld-staticdev \
"

EXTRA_LIBS_append_am57xx-evm = " \
    osal-dev \
    osal-staticdev \
    pruss-lld-dev \
    pruss-lld-staticdev \
    icss-emac-lld-dev \
    icss-emac-lld-staticdev \
"

EXTRA_LIBS_append_am335x-evm = " \
    osal-dev \
    osal-staticdev \
    pruss-lld-dev \
    pruss-lld-staticdev \
    icss-emac-lld-dev \
    icss-emac-lld-staticdev \
"

EXTRA_LIBS_append_am437x-evm = " \
    osal-dev \
    osal-staticdev \
    pruss-lld-dev \
    pruss-lld-staticdev \
    icss-emac-lld-dev \
    icss-emac-lld-staticdev \
"

EXTRA_LIBS_append_ti43x = "\
    cmem-dev \
    cmem-staticdev \
"

EXTRA_LIBS_append_dra7xx = " \
    tiovx-lib-host-dev \
    tiovx-lib-host-staticdev \
    tiovx-sys-iface \
"
