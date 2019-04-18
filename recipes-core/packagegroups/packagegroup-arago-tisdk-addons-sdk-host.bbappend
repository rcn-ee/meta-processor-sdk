PR_append = ".tisdk14"

# FIXME: disable for now
#EXTRA_LIBS_append_am57xx-evm = " \
#    jailhouse-src \
#"

EXTRA_LIBS_append_keystone = " \
"
#    ipsecmgr-mod-src 

UTILS_append_k2g = " \
    pru-icss-src \
"

EXTRA_LIBS_append_dra7xx = " \
    tiovx-app-host-src \
"

UTILS_append_am335x-evm = " pru-adc-src"

# FIXME: remove debugss and gdbserver-proxy-module as their builds are currently
#        broken
EXTRA_LIBS_remove = " \
    debugss-module-drv-src \
    gdbserverproxy-module-drv-src \
"
