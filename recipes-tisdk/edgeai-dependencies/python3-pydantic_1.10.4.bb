LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=2c02ea30650b91528657db64baea1757"

SRC_URI[md5sum] = "2e036b5f993b93dd83f6a7009252ae78"
SRC_URI[sha256sum] = "b9a3859f24eb4e097502a3be1fb4b2abb79b6103dd9e2e0edb70613a4459a648"

RDEPENDS_${PN} += "python3-typing-extensions (>=4.2.0)"

PYPI_PACKAGE = "pydantic"
PV = "1.10.4"
inherit pypi setuptools3
