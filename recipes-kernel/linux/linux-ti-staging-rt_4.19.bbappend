require linux-processor-sdk-4.19.inc

PR_append = ".8"

KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
BRANCH = "processor-sdk-linux-rt-4.19.y"
SRCREV = "37bb99ce02c3852bf0bcbb73ab5f5ebb25402b5e"
PV = "4.19.79+git${SRCPV}"
