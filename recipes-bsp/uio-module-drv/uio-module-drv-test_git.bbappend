PR_append = ".tisdk1"

include uio-module-drv-2.2.0.inc

COMPATIBLE_MACHINE = "keystone|omap-a15|ti33x|ti43x"

DEVICE_NAME_ti33x = "am33xx"
DEVICE_NAME_ti43x = "am43xx"

do_install_append_ti33x () {
        install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
}

do_install_append_ti43x () {
        install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
}
