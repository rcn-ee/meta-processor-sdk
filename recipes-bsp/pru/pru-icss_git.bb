DESCRIPTION = "Programmable Real-time Unit Software Package"
HOMEPAGE = "http://processors.wiki.ti.com/index.php/PRU-ICSS"
LICENSE = "BSD-3-Clause & GPL-2.0 & PD"

LIC_FILES_CHKSUM = "file://PRU-Package-v4.0-Manifest.html;md5=5ea937e4ff2c924a735d42e61ad8cbe3"

BRANCH = "master"
SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
SRCREV = "476289eb7c3a91977bae84aea55c56f3120b48ea"

PV = "4.0.0.0+git${SRCPV}"

DEPENDS = "ti-cgt-pru-native"

S = "${WORKDIR}/git"

export PRU_CGT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-pru"

SUBDIRS = "examples pru_cape/pru_fw lib/src labs"

do_compile() {
    for dir in ${SUBDIRS}
    do
        make -C ${S}/$dir
    done
}

TARGET_FIRMWARE = ""

do_install() {
    install -d ${D}/lib/firmware/pru-fw
}

FILES_${PN} += "/lib/firmware"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
