DESCRIPTION = "Task to install crypto sources in SDK"
LICENSE = "MIT"
PR = "r0"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

CRYPTO_RDEPENDS = ""

CRYPTO_RDEPENDS:append:ti33x = " cryptodev-module-src"
CRYPTO_RDEPENDS:append:ti43x = " cryptodev-module-src"
CRYPTO_RDEPENDS:append:k3 = " cryptodev-module-src"

RDEPENDS:${PN} = "\
    ${CRYPTO_RDEPENDS} \
"
