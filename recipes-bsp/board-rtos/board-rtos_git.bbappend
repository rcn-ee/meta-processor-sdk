# Below commit ID corresponds to "DEV.BOARD.01.00.10.00A"
BOARD_SRCREV = "14636b1363383167abb8d2b8ed6297d0b1c64930"

PV = "01.00.10.00A"
PR = "r0"

DEPENDS_append_dra7xx = " pm-lld-rtos \
                          mmcsd-lld-rtos \
"
INSANE_SKIP_${PN} = "arch"
