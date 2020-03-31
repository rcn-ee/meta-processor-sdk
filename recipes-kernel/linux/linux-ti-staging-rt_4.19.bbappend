require linux-processor-sdk-4.19.inc

PR_append = ".0"

KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
BRANCH = "processor-sdk-linux-rt-4.19.y"
SRCREV = "478b52c666339d3769ff5a654c987b31a6532194"
PV = "4.19.94+git${SRCPV}"
