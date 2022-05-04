require linux-processor-sdk-5.4.inc
KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
PR_append = ".1"
