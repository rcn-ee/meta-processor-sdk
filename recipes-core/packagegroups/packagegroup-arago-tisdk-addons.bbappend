PR_append = "-tisdk35"

EXTRA_PACKAGES_append_ti33x = " opencv"
EXTRA_PACKAGES_append_ti43x = " opencv"
EXTRA_PACKAGES_append_omap-a15 = " opencv"
EXTRA_PACKAGES_append_keystone = " opencv"

EXTRA_PACKAGES_append_am57xx-evm = " jailhouse-examples"

EXTRA_PACKAGES_append = " zbar hidapi"

UTILS_append = " net-snmp"

EXTRA_LIBS_append_ti43x = " \
    cmem \
"

EXTRA_PACKAGES_append_omap-a15 = " big-data-ipc-demo-linux \
                                   big-data-ipc-demo-linux-firmware \
"