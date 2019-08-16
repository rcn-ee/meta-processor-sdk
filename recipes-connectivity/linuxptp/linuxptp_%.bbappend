PR_append = ".tisdk14"
PV = "2.0+"

BRANCH = "ti-linuxptp-v2.0-release"
SRC_URI = "git://git.ti.com/processor-sdk/linuxptp.git;protocol=git;branch=${BRANCH} \
           file://build-Allow-CC-and-prefix-to-be-overriden.patch"

SRCREV = "9e33053c1f6c6466c0996099fced23415bd68eb4"

S = "${WORKDIR}/git"

do_install_append() {
    install -p ${S}/phc_ctl  ${D}${bindir}
    install -p ${S}/timemaster  ${D}${bindir}
}
