PV = "3_1_0_0"
INC_PR = "r1"

require recipes-ti/includes/tisdk-paths.inc

DESTSUFFIX = "${WORKDIR}/git"

BRANCH = "master"
SRC_URI = "git://git.ti.com/fftlib/fftlib.git;protocol=git;name=fftlib;destsuffix=${DESTSUFFIX};branch=${BRANCH}"
SRCREV = "3d5ebada3cd94096fb798548d68059dc4c34a1ea"
