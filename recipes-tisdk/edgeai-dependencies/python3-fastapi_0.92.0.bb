LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"

SRC_URI[md5sum] = "9db1626aae4078b61e5a5e6fdaee433f"
SRC_URI[sha256sum] = "023a0f5bd2c8b2609014d3bba1e14a1d7df96c6abea0a73070621c9862b9a4de"

RDEPENDS_${PN} += "python3-pydantic (>=1.6.2) python3-starlette (>=0.25.0)"

PYPI_PACKAGE = "fastapi"
PV = "0.92.0"
inherit pypi

FILES_${PN} += "${libdir}/python3.8/*"

do_install() {
  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
  mkdir -p ${D}/${libdir}/python3.8/site-packages/
  cp ${CP_ARGS} ${S}/fastapi ${D}/${libdir}/python3.8/site-packages/
}
