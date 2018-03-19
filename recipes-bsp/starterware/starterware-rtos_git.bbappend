require recipes-bsp/starterware/starterware-02.01.01.06.inc

export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"

DEPENDS_append=" ti-pdk-build-rtos"

INSANE_SKIP_${PN} += "file-rdeps"
