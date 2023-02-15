LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"

SRC_URI[md5sum] = "8aec587f97bfc8a9cdae4c05b67ce291"
SRC_URI[sha256sum] = "854c71e73736c429c2bdb07801f2c76c9cba497e7c3cf4988fde5e95fe4cdb3c"

RDEPENDS_${PN} += "python3-anyio (>=3.4.0) python3-typing-extensions (>=3.10.0)"

PYPI_PACKAGE = "starlette"
PV = "0.25.0"
inherit pypi

FILES_${PN} += "${libdir}/python3.8/*"

do_install() {
  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
  mkdir -p ${D}/${libdir}/python3.8/site-packages/
  cp ${CP_ARGS} ${S}/starlette ${D}/${libdir}/python3.8/site-packages/
}
