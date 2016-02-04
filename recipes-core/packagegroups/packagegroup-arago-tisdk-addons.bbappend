PR_append = "-tisdk17"

PACKAGES += "${PN}-extra"

UTILS_append_ti33x = " \
    strongswan \
"

UTILS_append_ti43x = " \
    strongswan \
"

UTILS_append_omap-a15 = " \
    opencv-apps \
    strongswan \
    ti-ipc-rtos-fw \
"

UTILS_append_keystone = " \
    ti-ipc-rtos-fw \
"

DEVTOOLS_append = " \
    packagegroup-core-tools-debug \
"

EXTRA_PACKAGES = ""
EXTRA_PACKAGES_append_keystone = " opencv-apps"

RDEPENDS_${PN}-extra = " \
    ${EXTRA_PACKAGES} \
"
