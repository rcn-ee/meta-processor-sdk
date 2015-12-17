inherit ti-pdk
require qmss-lld-02.01.00.12.inc

DEPENDS += "rm-lld-rtos"

XDCARGS_k2hk-evm = "k2h k2k"
XDCARGS_k2l-evm = "k2l"
XDCARGS_k2e-evm = "k2e"
XDCARGS_k2g-evm = "k2g"
