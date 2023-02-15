LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2"

SRC_URI[md5sum] = "03a01698ace869506cab825697dfb7e1"
SRC_URI[sha256sum] = "5cb5f4a79139d699607b3ef622a1dedafa84e115ab0024e0d9c044a9479ca7cb"

PYPI_PACKAGE = "typing_extensions"
PV = "4.5.0"
inherit pypi

FILES_${PN} += "${libdir}/python3.8/*"

do_install() {
  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
  mkdir -p ${D}/${libdir}/python3.8/site-packages/
  cp ${CP_ARGS} ${S}/src/* ${D}/${libdir}/python3.8/site-packages/
}
