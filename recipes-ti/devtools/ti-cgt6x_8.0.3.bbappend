PR_append = ".ti-int0"

PACKAGES_class-nativesdk += "${PN}-installer-linux ${PN}-installer-windows"

SRC_URI_append_class-nativesdk = "\
    http://downloads.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/ti_cgt_c6000_${PV}_windows_installer.exe;name=cgt6x_x86_windows \
"

SRC_URI[cgt6x_x86_windows.md5sum] = "c5ca406e36e4a96933bdff739a3a05cd"
SRC_URI[cgt6x_x86_windows.sha256sum] = "2a68d3db25ed48bd9253d7c6cb9368b77ae5f055ebfbc763c01ed9f2d757e1ef"

do_install_append_class-nativesdk() {
    install -m 755 ${WORKDIR}/${BINFILE} ${D}
    install -m 755 ${WORKDIR}/ti_cgt_c6000_${PV}_windows_installer.exe ${D}
}

FILES_${PN}-installer-linux = "/${BINFILE}"
FILES_${PN}-installer-windows = "/ti_cgt_c6000_${PV}_windows_installer.exe"
