PR_append = ".tisdk0"

require recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb

BRANCH = "ti-linux-firmware"
SRCREV = "77bd5534eb33c2f9654ab1b56fcdff4e8b7143e0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://0001-HACK-board-cfg-disable-MSMC-cache.patch;patchdir=${WORKDIR}/imggen"
