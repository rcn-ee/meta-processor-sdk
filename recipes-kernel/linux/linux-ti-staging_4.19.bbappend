require linux-processor-sdk-4.19.inc

PR_append = ".0"

KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
BRANCH = "processor-sdk-linux-4.19.y"
SRCREV = "58f4443a8cfeb5c4d9b0eb942d8c32f23925ec71"
PV = "4.19.94+git${SRCPV}"
