DESCRIPTION = "Openthread border controller"

HOMEPAGE = "https://github.com/openthread"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"

PV = "stable"
PR = "r0"
S = "${WORKDIR}/git"

SRC_URI = " \
    git://github.com/openthread/wpantund.git;protocol=git \
    file://0001-Workaround-cpp11-boost-dependency-and-autoconf.patch;patchdir=${S} \
"

SRCREV  = "f9fc5f3921d66bad42a1c4c78d7cfd4cfa78701f"

inherit autotools pkgconfig

DEPENDS = "boost readline dbus"
