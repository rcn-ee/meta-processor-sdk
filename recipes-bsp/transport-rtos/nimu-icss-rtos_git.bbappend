require recipes-bsp/transport-rtos/transport-1.0.0.9.inc

DEPENDS_append_c665x-evm = " emac-lld-rtos"
DEPENDS_append_c667x-evm = " pa-lld-rtos"
DEPENDS_append_omapl1 = " emac-lld-rtos"
