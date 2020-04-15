require linux-processor-sdk-4.19.inc

PR_append = ".1"

KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
BRANCH = "processor-sdk-linux-4.19.y"
SRCREV = "be5389fd85b69250aeb1ba477447879fb392152f"
PV = "4.19.94+git${SRCPV}"
