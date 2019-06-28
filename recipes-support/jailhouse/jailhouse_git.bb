SUMMARY = "Jailhouse is a partitioning Hypervisor based on Linux."
HOMEPAGE = "https://github.com/siemens/jailhouse"
LICENSE = "GPLv2"

LIC_FILES_CHKSUM = "file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d"

BRANCH = "plsdk_am57xx"
SRC_URI = "git://git.ti.com/processor-sdk/jailhouse.git;branch=${BRANCH}"

SRCREV = "cb0f5799acbd28bedde30ccc043223f65d87f860"

PV = "0.8"

PACKAGES =+ "${PN}-drivers ${PN}-firmware ${PN}-examples"
RDEPENDS_${PN} += "${PN}-drivers ${PN}-firmware"
RDEPENDS_${PN}-examples += "${PN}"

KERNEL_MODULES_META_PACKAGE = "${PN}-drivers"
ALLOW_EMPTY_${PN}-drivers = "1"

inherit bash-completion

# The jailhouse build produces more than just a kernel module, therefore
# the "module" class is not appropriate, however, we still desire the
# conveniences provided, so borrow the top few lines for the module class.
inherit module-base kernel-module-split


COMPATIBLE_MACHINE = "am57xx-evm"

S = "${WORKDIR}/git"

JAILHOUSE_CONFIG = "${MACHINE}"

JAILHOUSE_EXAMPLE_FILES = " \
    inmates/ti_app/ti-app.bin \
    inmates/tools/arm/linux-loader.bin \
"

JAILHOUSE_CELL_REGEX = ""
JAILHOUSE_CELL_REGEX_am57xx-evm = "am57*.cell"

do_configure() {
    cp ./ci/jailhouse-config-${JAILHOUSE_CONFIG}.h ./include/jailhouse/config.h
}

PARALLEL_MAKE = ""
EXTRA_OEMAKE += "KDIR=${STAGING_KERNEL_BUILDDIR}"

do_install() {
    oe_runmake DESTDIR="${D}" install

    install -d ${D}${datadir}/${PN}/examples
    for f in ${JAILHOUSE_EXAMPLE_FILES}
    do
        install -m 644 $f ${D}${datadir}/${PN}/examples/
    done

    for f in `find configs/$ARCH -name "${JAILHOUSE_CELL_REGEX}"`
    do
        install -m 644 $f ${D}${datadir}/${PN}/examples/
    done
}

FILES_${PN}-firmware = "${base_libdir}/firmware"
FILES_${PN}-examples = "${datadir}/${PN}/examples"

INSANE_SKIP_${PN} += "ldflags"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "board-support/extra-drivers/${PN}-${PV}"
