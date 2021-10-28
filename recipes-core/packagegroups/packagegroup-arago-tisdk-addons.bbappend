PR_append = "-tisdk60"

EXTRA_PACKAGES_append_ti33x = " opencv"
EXTRA_PACKAGES_append_ti43x = " opencv"
EXTRA_PACKAGES_append_omap-a15 = " opencv"
EXTRA_PACKAGES_append_keystone = " opencv"
EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"

EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps pru-adc"
EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
EXTRA_PACKAGES_append_k2g-evm  = " pruss-lld-apps"
EXTRA_PACKAGES_append_am57xx-evm = " pruss-lld-apps"

EXTRA_PACKAGES_append_k3 = " watchdog"

EXTRA_PACKAGES_append_omapl138 = " ccief-basic"

EXTRA_PACKAGES_append = " hidapi \
"
EXTRA_PACKAGES_append_am64xx-evm = " \
    benchmark-server \
    opcua-server \
    benchmark-demo-firmware \
    print-ip \
"

EXTRA_PACKAGES_append_armv5 = " zbar"
EXTRA_PACKAGES_append_armv7a = " zbar"

UTILS_append = " net-snmp net-snmp-server-snmpd"

EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host tiovx-app-host-examples"

