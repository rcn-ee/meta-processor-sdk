PR_append = "-tisdk25"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://Makefile_pru-icss \
"

MAKEFILES_append_am335x-evm = " \
    pru-icss \
"

MAKEFILES_append_am437x-evm = " \
    pru-icss \
"

MAKEFILES_append_am57xx-evm = " \
    pru-icss \
"

do_install_append() {
    sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
}
