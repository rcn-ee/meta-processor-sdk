PR_append = ".tisdk1"

do_install_append() {
    install -d ${D}${includedir}
    cp -r ${S}/include/* ${D}${includedir}
    install -d ${D}${libdir}
    cp ${S}/lib/rpmsg_lib.lib ${D}${libdir}
}

FILES_${PN}-staticdev = "${libdir}"
FILES_${PN}-dev = "${includedir}"
