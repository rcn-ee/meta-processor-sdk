SUMMARY = "Multiple Spanning Tree Protocol Daemon"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=4325afd396febcb659c36b49533135d4 \
                    file://debian/copyright;md5=332234a99007d25da40f41ee96aa388f"

SRC_URI = "git://github.com/mstpd/mstpd.git;protocol=https"

PV = "0.0.5+git${SRCPV}"
SRCREV = "3dbd68c11dfed6c8f6f2423f429d3b4a2acc27f8"

S = "${WORKDIR}/git"

DEPENDS = "python"
RDEPENDS_${PN} = "python-core"

inherit autotools

EXTRA_OECONF = "--sbindir=/sbin"
