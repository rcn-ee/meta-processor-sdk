DEPENDS_append_ti33x = " pruss-lld-rtos \
"
DEPENDS_append_ti43x = " pruss-lld-rtos \
"
DEPENDS_append_am57xx-evm = " pruss-lld-rtos \
"
LIC_FILES_CHKSUM = "file://I2C.h;beginline=1;endline=32;md5=50084375278c1a2779571be134f98f7c"

I2C_LLD_SRCREV = "631a38ad7245b68bfac40a417bdc9d3a0b7ca724"

PV = "01.00.00.10"

INSANE_SKIP_${PN} = "arch"
