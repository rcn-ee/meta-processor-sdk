PR_append = "-tisdk36"

EXTRA_PACKAGES_append_ti33x = " opencv"
EXTRA_PACKAGES_append_ti43x = " opencv"
EXTRA_PACKAGES_append_omap-a15 = " opencv"
EXTRA_PACKAGES_append_keystone = " opencv"

EXTRA_PACKAGES_append_am57xx-evm = " jailhouse-examples"

EXTRA_PACKAGES_append = " zbar hidapi"

UTILS_append = " net-snmp"

EXTRA_LIBS_append_ti43x = " \
    cmem \
    uio-module-drv \
"

EXTRA_LIBS_append_ti33x = " \
    uio-module-drv \
"

UTILS_append_ti43x = " uio-module-drv-test \
                       uio-test-pruss \
"

UTILS_append_ti33x = " uio-module-drv-test \
                       uio-test-pruss \
"

EXTRA_PACKAGES_append_omap-a15 = " big-data-ipc-demo-linux \
                                   big-data-ipc-demo-linux-firmware \
"
