require recipes-bsp/edma3-lld/edma3-lld-2.12.05.30B.inc

PLATFORMLIST_append_dra7xx-evm = " \
        tda3xx-evm \
"

TARGETLIST_c66x = " \
        66 \
"

PLATFORMLIST_c665x-evm = " \
        c6657-evm \
"

PLATFORMLIST_c667x-evm = " \
        c6678-evm \
"

PLATFORMLIST_omapl1 = " \
        omapl137-evm \
        omapl138-evm \
"

TARGETLIST_omapl1 = " \
        arm9 \
        674 \
"

EXTRA_OEMAKE_remove = "TARGET=66"

do_configure_prepend () {
    rm -rf ${S}/examples/edma3_driver/evmTCI6614
    rm -rf ${S}/examples/edma3_driver/evmTCI6614BE
}
