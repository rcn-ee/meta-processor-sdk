FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:am62xx-evm = " ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "file://0001-HACK-lib-lmb-Allow-re-reserving-post-relocation-U-Bo.patch", "", d)}"

SRC_URI:append:am62xx-evm-k3r5 = " ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "file://0001-HACK-lib-lmb-Allow-re-reserving-post-relocation-U-Bo.patch", "", d)}"

PR:append = ".psdk0"
