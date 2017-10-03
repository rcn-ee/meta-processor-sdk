FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
PR_append = ".tisdk2"

SRC_URI += " file://eglfs_kms_cfg.json \
             file://qt_env_xsgx.sh     \
           "

# Add custom Arago qtbase eglfs_kms configuration file
do_install_append () {
    install -d ${D}${sysconfdir}/qt5
    install -m 0644 ${WORKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
    if [ "${@bb.utils.contains('MACHINE_FEATURES','xsgx','true','false',d)}" = "true" ]; then
        install -m 0644 ${WORKDIR}/qt_env_xsgx.sh ${D}${sysconfdir}/profile.d/qt_env.sh
    fi
}

FILES_${PN} += "${sysconfdir}/qt5/*"
