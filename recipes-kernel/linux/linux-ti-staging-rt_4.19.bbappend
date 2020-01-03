require linux-processor-sdk-4.19.inc

PR_append = ".9"

KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
BRANCH = "processor-sdk-linux-rt-4.19.y"
SRCREV = "5baf382c8f566e7ab46a144eed51b639dec32841"
PV = "4.19.79+git${SRCPV}"
