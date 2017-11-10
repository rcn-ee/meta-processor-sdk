PR_append = ".int0"

do_install_append() {
    rm ${D}${bindir}/nosetests
}
