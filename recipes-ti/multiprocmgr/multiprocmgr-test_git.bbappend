PR_append = ".tisdk0"

RDEPENDS_${PN} += "multiprocmgr-rtos-test bash"


FILES_${PN} += "\
    ${datadir}/ti/examples/mpm \
"

FILES_${PN}-dbg += "\
    ${datadir}/ti/examples/mpm/*/.debug \
"

do_install() {
	# Copy Sources
	install -d ${D}${datadir}/ti/examples/mpm/src
	cp -r ${S}/src/mailbox ${D}${datadir}/ti/examples/mpm/src
	cp -r ${S}/src/sync ${D}${datadir}/ti/examples/mpm/src
	cp -r ${S}/test ${D}${datadir}/ti/examples/mpm
}
