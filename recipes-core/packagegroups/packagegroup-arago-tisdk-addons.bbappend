PR_append = "-tisdk26"

EXTRA_PACKAGES_append_ti33x = " opencv"
EXTRA_PACKAGES_append_ti43x = " opencv"
EXTRA_PACKAGES_append_omap-a15 = " opencv"
EXTRA_PACKAGES_append_keystone = " opencv"

EXTRA_PACKAGES_append = " zbar"

UTILS_append_omap-a15 = " \
    uio-test-pruss \
    uio-module-drv-test \
"

UTILS_append_keystone = " \
    uio-module-drv-test \
"

EXTRA_LIBS_append_omap-a15 = " \
    uio-module-drv \
"

EXTRA_LIBS_append_keystone = " \
    cmem \
    uio-module-drv \
"
