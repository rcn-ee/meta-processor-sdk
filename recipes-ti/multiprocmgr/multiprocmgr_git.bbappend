PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://mpmsrv-daemon.service"

inherit systemd

SYSTEMD_SERVICE_${PN} = "mpmsrv-daemon.service"

do_install_append() {
    local systemd_enabled=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '1', '0', d)}

    if [ ${systemd_enabled} -eq 1 ]
    then
        # Install systemd service
        install -d ${D}${systemd_system_unitdir}
        install -m 0644 ${WORKDIR}/mpmsrv-daemon.service ${D}${systemd_system_unitdir}

        # Remove sysvinit script
        rm ${D}${sysconfdir}/init.d/mpmsrv-daemon.sh
        rmdir ${D}${sysconfdir}/init.d/
    fi
}
