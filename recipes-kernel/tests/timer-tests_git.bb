DESCRIPTION = "Kernel timer selftests"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;branch=master"
SRCREV = "7a834ba5e26e9e4afabf3cce9ca8cd1c6c3dce50"

S = "${WORKDIR}/git/tools/testing/selftests/timers"

TEST_PROGS = "rtctest"

EXTRA_OEMAKE = "INSTALL_PATH=${D}${bindir}"

do_compile() {
  oe_runmake CC="${CC}" TEST_PROGS="${TEST_PROGS}" TEST_PROGS_EXTENDED="${TEST_PROGS_EXTENDED}"
}

do_install() {
  oe_runmake CC="${CC}" TEST_PROGS="${TEST_PROGS}" TEST_PROGS_EXTENDED="${TEST_PROGS_EXTENDED}" install
}
