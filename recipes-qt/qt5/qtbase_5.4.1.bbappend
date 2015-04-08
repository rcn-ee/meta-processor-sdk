PR_append = "-tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

QT_ENV = "qt_env.sh"
QT_ENV_ti33x = "${@base_contains('DISTRO_FEATURES', 'wayland', 'qt_env.sh', 'qt_env_ti33x.sh', d)}"

SRC_URI += "\
    file://${QT_ENV} \
"

# Add custom Arago Qt 5 Environment script file
do_install_append () {
    install -d ${D}${sysconfdir}/profile.d
    install -m 0644 ${WORKDIR}/${QT_ENV} ${D}${sysconfdir}/profile.d/qt_env.sh
}
