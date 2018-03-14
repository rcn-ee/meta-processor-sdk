PV = "3_1_0_0"
INC_PR = "r0"

require recipes-ti/includes/tisdk-paths.inc

DESTSUFFIX = "${WORKDIR}/git"

BRANCH = "master"
SRC_URI = "git://git.ti.com/fftlib/fftlib.git;protocol=git;name=fftlib;destsuffix=${DESTSUFFIX};branch=${BRANCH}"
SRCREV = "1527e517aa43f9ade14b7a4e16e2b6522eb5bbb9"
