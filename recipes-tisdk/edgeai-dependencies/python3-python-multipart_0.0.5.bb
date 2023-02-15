LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c0c06fcb50bf07318f487fcf8c5da80"

SRC_URI[md5sum] = "4c0f8475a23eb5f28704bb3cbce9253a"
SRC_URI[sha256sum] = "f7bb5f611fc600d15fa47b3974c8aa16e93724513b49b5f95c81e6624c83fa43"

RDEPENDS_${PN} += "python3-six (>=1.4.0)"

PYPI_PACKAGE = "python-multipart"
PV = "0.0.5"
inherit pypi setuptools3
