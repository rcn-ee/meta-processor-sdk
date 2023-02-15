LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5c778842f66a649636561c423c0eec2e"

SRC_URI[md5sum] = "795d2d938232a5ae9ca10b124db49330"
SRC_URI[sha256sum] = "a4e12017b940247f836bc90b72e725d7dfd0c8ed1c51eb365f5ba30d9f5127d8"

RDEPENDS_${PN} += "python3-click (>=7.0) python3-h11 (>=0.8)"

PYPI_PACKAGE = "uvicorn"
PV = "0.20.0"
inherit pypi

FILES_${PN} += "${libdir}/python3.8/*"

do_install() {
  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
  mkdir -p ${D}/${libdir}/python3.8/site-packages/
  cp ${CP_ARGS} ${S}/uvicorn ${D}/${libdir}/python3.8/site-packages/
}
