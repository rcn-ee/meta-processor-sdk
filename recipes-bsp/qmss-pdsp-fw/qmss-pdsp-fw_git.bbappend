PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://ks2_qmss_pdsp_qos.bin"

do_install_append() {
    install -m 644 ${WORKDIR}/ks2_qmss_pdsp_qos.bin ${D}${base_libdir}/firmware/ks2_qmss_pdsp_qos.bin
}
