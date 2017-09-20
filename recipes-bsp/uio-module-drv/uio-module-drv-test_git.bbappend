PR_append = ".tisdk1"

# This corresponds to version 02.02.01.00
UIO_MODULE_DRV_SRCREV = "bda9260f2220840a60ec0fbc8011cbadf3cf1b91"

PV = "2.2.1.0+git${SRCPV}"

DEVICE_NAME_k2g-evm = "k2g"

do_install_append_k2g-evm () {
        install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
}
