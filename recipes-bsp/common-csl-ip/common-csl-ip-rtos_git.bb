inherit ti-pdk
require recipes-bsp/common-csl-ip/common-csl-ip.inc

DEPENDS_remove = "${PN}"

PR = "r0.ti-int0"
