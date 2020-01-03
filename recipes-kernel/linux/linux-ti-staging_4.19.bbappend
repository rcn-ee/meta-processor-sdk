require linux-processor-sdk-4.19.inc

PR_append = ".9"

KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
BRANCH = "processor-sdk-linux-4.19.y"
SRCREV = "77dfab56c6029fc4bb85e3684950c54d541df110"
PV = "4.19.79+git${SRCPV}"
