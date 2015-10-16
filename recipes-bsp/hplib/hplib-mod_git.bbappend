PR_append = ".tisdk0"

KERNEL_MODULE_AUTOLOAD += "hplibmod"

CREATE_SRCIPK = "1"
SRCIPK_SRC_DIR = "${WORKDIR}/git/ti/runtime/hplib"
SRCIPK_INSTALL_DIR = "board-support/extra-drivers/${PN}-${PV}"
