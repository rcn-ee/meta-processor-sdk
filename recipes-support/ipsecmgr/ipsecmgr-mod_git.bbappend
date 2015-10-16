PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = "\
    file://0001-Update-esp4.c-and-esp6.c-to-match-Kernel-v4.1.patch;pnum=3 \
"

KERNEL_MODULE_AUTOLOAD += "ipsecmgr_mod"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "board-support/extra-drivers/${PN}-${PV}"
