PR_append = ".tisdk1"
SRCREV = "8d861bd8f8f792df60b6873989ff208766fbebae"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://ks2_xgbe_serdes_mcu_fw.bin"

ORIGINPCIE = "ks2_pcie_serdes.bin"
ORIGINGBE = "ks2_gbe_serdes.bin"
ORIGINXGBE = "ks2_xgbe_serdes.bin"

do_install_append() {
    install -m 0644 ${WORKDIR}/ks2_xgbe_serdes_mcu_fw.bin ${D}${base_libdir}/firmware/ks2_xgbe_serdes_mcu_fw.bin
}
