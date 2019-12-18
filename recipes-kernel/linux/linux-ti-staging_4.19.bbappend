require linux-processor-sdk-4.19.inc

PR_append = ".8"

KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
BRANCH = "processor-sdk-linux-4.19.y"
SRCREV = "8f3968f0abb49c896aaae599e3c7569792551e67"
PV = "4.19.79+git${SRCPV}"
