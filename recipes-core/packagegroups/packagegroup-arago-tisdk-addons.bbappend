PR_append = "-tisdk41"

EXTRA_PACKAGES_remove = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'voxelsdk', '', d)}"
EXTRA_PACKAGES_append_ti33x = " ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', ' opencv', d)}"
EXTRA_PACKAGES_append_ti43x = " ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', ' opencv', d)}"
EXTRA_PACKAGES_append_omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', ' opencv', d)}"
EXTRA_PACKAGES_append_keystone = " opencv"
EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"

EXTRA_PACKAGES_append_am57xx-evm = " jailhouse-examples"

EXTRA_PACKAGES_append = " zbar hidapi ccief-basic"

UTILS_append = " net-snmp net-snmp-server-snmpd"

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

UTILS_remove_dra7xx = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'glsdk-example-apps', d)}"
UTILS_append_k2g = " uio-test-pruss"

EXTRA_PACKAGES_append_omap-a15 = " big-data-ipc-demo-linux \
                                   big-data-ipc-demo-linux-firmware \
"

EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host "
