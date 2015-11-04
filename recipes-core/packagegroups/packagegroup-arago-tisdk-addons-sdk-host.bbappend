PR_append = "-tisdk9"

UTILS_append_ti33x = " \
    pru-icss-src \
"

UTILS_append_ti43x = " \
    pru-icss-src \
"

UTILS_append_omap-a15 = " \
    pru-icss-src \
"

UTILS_append_dra7xx = " \
    opencl-examples-src \
"

EXTRA_LIBS_append_keystone = " cmem-mod-src \
                               uio-module-drv-src \
                               hplib-mod-src \
"

# Remove ipsecmgr until it may be updated
# ipsecmgr-mod-src
