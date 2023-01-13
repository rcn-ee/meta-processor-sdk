FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI = "git://github.com/CESNET/Netopeer2.git;protocol=https;branch=devel file://netopeer2-server"
SRC_URI += "file://0001-Add-EST-Yang-Models.patch"


PV = "2.1.38+git${SRCPV}"
SRCREV = "3007b6f4c3052e4ba39f1956a6eab49388a3cc9b"

FILES_${PN} += "/usr/share/yang* /usr/share/netopeer2/* /usr/lib/sysrepo-plugind/*"

