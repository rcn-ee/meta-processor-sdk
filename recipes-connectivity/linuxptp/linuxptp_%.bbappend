PR_append = ".tisdk12"
PV = "2.0+"

BRANCH = "ti-linuxptp-v2.0-release"
SRC_URI = "git://git.ti.com/processor-sdk/linuxptp.git;protocol=git;branch=${BRANCH} \
           file://build-Allow-CC-and-prefix-to-be-overriden.patch"

SRCREV = "6dce667871385fc9bb435829b71fac1db5df6d1c"

S = "${WORKDIR}/git"

do_install_append() {
    install -p ${S}/phc_ctl  ${D}${bindir}
    install -p ${S}/timemaster  ${D}${bindir}
}
