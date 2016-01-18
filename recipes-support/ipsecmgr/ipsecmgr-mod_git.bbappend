PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = "\
    file://0001-port-ipsecmgr_mod-to-4.1.13-kernel.patch;pnum=3 \
"

KERNEL_MODULE_AUTOLOAD += "ipsecmgr_mod"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "board-support/extra-drivers/${PN}-${PV}"
