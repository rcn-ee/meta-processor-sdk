PR_append = ".tisdk2"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://ks2_xgbe_serdes_mcu_fw.bin"

do_install_append() {
    install -m 0644 ${WORKDIR}/ks2_xgbe_serdes_mcu_fw.bin ${D}${base_libdir}/firmware/ks2_xgbe_serdes_mcu_fw.bin
}
