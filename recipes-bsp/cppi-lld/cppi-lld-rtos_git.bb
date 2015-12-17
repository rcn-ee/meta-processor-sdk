inherit ti-pdk
require cppi-lld-02.01.00.11.inc

DEPENDS_append = " rm-lld-rtos \
                   qmss-lld-rtos \
"

XDCARGS_k2hk-evm = "k2h k2k"
XDCARGS_k2e-evm = "k2e"
XDCARGS_k2l-evm = "k2l"
XDCARGS_k2g-evm = "k2g"
