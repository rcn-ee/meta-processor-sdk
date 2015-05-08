PR_append = "-tisdk1"

do_install_append_class-native() {
    install -d ${D}${datadir}/ti/cgt-c6x/bin
    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
        install -m 755 ${binfile} ${D}${datadir}/ti/cgt-c6x/bin
    done
}

do_install_append_class-nativesdk() {
    install -d ${D}${datadir}/ti/cgt-c6x/bin
    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
        install -m 755 ${binfile} ${D}${datadir}/ti/cgt-c6x/bin
    done
}

FILES_${PN}-dbg += " \
    ${datadir}/ti/cgt-c6x/bin/.debug \
"
