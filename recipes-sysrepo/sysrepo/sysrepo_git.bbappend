LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=ef345f161efb68c3836e6f5648b2312f"

SRC_URI = "git://github.com/sysrepo/sysrepo.git;protocol=https;branch=devel file://sysrepo"

PV = "2.2.6+git${SRCPV}"
SRCREV = "bdf67e0c0164b9a2e806105a719d139e7300bdea"

FILES_${PN} += "/usr/share/yang/* /usr/lib/sysrepo-plugind/*"
