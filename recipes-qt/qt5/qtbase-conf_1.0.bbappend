FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
PR_append = ".tisdk1"

SRC_URI += "file://eglfs_kms_cfg.json"

# Add custom Arago qtbase eglfs_kms configuration file
do_install_append () {
    install -d ${D}${sysconfdir}/qt5
    install -m 0644 ${WORKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
}

FILES_${PN} += "${sysconfdir}/qt5/*"
