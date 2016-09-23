PR_append = ".tisdk0"

PACKAGES =+ "${PN}-test"
FILES_${PN}-test = "${datadir}/ti/examples/mpm/filetestdemo/c66x/demo_loopback/build/bin/*.out \
                    ${datadir}/ti/examples/mpm/sync_test/c66x/bin/*.out"

do_install_append() {
	# Copy C66x binaries
	install -d ${D}${datadir}/ti/examples/mpm/filetestdemo/c66x/demo_loopback/build/bin
	cp ${S}/test/filetestdemo/c66x/demo_loopback/build/bin/*.out \
		${D}${datadir}/ti/examples/mpm/filetestdemo/c66x/demo_loopback/build/bin/
	install -d ${D}${datadir}/ti/examples/mpm/sync_test/c66x/bin
	cp ${S}/test/sync_test/c66x/bin/*.out \
		${D}${datadir}/ti/examples/mpm/sync_test/c66x/bin/
}

INSANE_SKIP_${PN}-test = "arch"
