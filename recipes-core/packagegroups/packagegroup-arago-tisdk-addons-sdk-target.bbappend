PR:append = ".psdk0"

UTILS:append:ti33x = " \
    opencv-dev \
"

UTILS:append:ti43x = " \
    opencv-dev \
"

EXTRA_LIBS:append:am335x-evm = " \
    osal-dev \
    osal-staticdev \
    pruss-lld-dev \
    pruss-lld-staticdev \
    icss-emac-lld-dev \
    icss-emac-lld-staticdev \
    pru-icss-dev \
    pru-icss-staticdev \
"

EXTRA_LIBS:append:am437x-evm = " \
    osal-dev \
    osal-staticdev \
    pruss-lld-dev \
    pruss-lld-staticdev \
    icss-emac-lld-dev \
    icss-emac-lld-staticdev \
"

