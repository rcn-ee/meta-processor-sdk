require linux-processor-sdk-4.19.inc

PR_append = ".1"

KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
BRANCH = "processor-sdk-linux-rt-4.19.y"
SRCREV = "a242ccf3f13f03d41d521411ce2cc09775c873a2"
PV = "4.19.94+git${SRCPV}"
