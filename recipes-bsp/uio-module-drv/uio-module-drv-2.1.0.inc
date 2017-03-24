LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"

BRANCH = "master"
# This corresponds to version 02.01.00.01
SRCREV = "370602eec82b63fc4d39933f2c5ee055ef1feb4d"

PV = "2.1.0.1+git${SRCPV}"

SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"

S = "${WORKDIR}/git"
