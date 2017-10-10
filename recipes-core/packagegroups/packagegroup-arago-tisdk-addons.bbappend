PR_append = "-tisdk41"

EXTRA_PACKAGES_append_ti33x = " opencv"
EXTRA_PACKAGES_append_ti43x = " opencv"
EXTRA_PACKAGES_append_omap-a15 = " opencv"
EXTRA_PACKAGES_append_keystone = " opencv"
EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"

EXTRA_PACKAGES_append_am57xx-evm = " jailhouse-examples"

EXTRA_PACKAGES_append = " zbar hidapi"

UTILS_append = " net-snmp net-snmp-server-snmpd"

EXTRA_LIBS_append_ti43x = " \
    cmem \
"

EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host "
