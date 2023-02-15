LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"

SRC_URI[md5sum] = "2a2b45a9324f7dfd3b351452f8097a3c"
SRC_URI[sha256sum] = "25ea0d673ae30af41a0c442f81cf3b38c7e79fdc7b60335a4c14e05eb0947421"

DEPENDS += "python3-setuptools-scm-native"
RDEPENDS_${PN} += "python3-idna (>=2.8) python3-sniffio (>=1.1)"

PYPI_PACKAGE = "anyio"
PV = "3.6.2"
inherit pypi setuptools3
