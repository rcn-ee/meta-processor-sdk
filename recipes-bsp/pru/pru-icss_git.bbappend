PR_append = ".tisdk0"

do_install_append() {
    install -d ${D}${includedir}
    cp -r ${S}/include/* ${D}${includedir}
    install -d ${D}${libdir}
    cp ${S}/lib/rpmsg_lib.lib ${D}${libdir}
}
