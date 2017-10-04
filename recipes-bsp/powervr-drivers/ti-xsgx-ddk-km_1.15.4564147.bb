DESCRIPTION =  "X11 Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
HOMEPAGE = "https://git.ti.com/processor-sdk/omap5-sgx-ddk-linux-x11-experimental"
LICENSE = "MIT | GPLv2"
LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"

inherit module

COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"

MACHINE_KERNEL_PR_append = "m"
PR = "${MACHINE_KERNEL_PR}"

PACKAGE_ARCH = "${MACHINE_ARCH}"

DEPENDS = "virtual/kernel"

PROVIDES = "omapdrm-pvr"

RPROVIDES_${PN} = "omapdrm-pvr"
RREPLACES_${PN} = "omapdrm-pvr"
RCONFLICTS_${PN} = "omapdrm-pvr"

BRANCH = "ti-img-sgx/${PV}/k4.9"

SRC_URI = "git://git.ti.com/processor-sdk/omap5-sgx-ddk-linux-x11-experimental.git;protocol=git;branch=${BRANCH}"

S = "${WORKDIR}/git"

SRCREV = "24ae481718cc24dc2da55c89b53c39558e32061e"

TARGET_PRODUCT_omap-a15 = "jacinto6evm"
TARGET_PRODUCT_ti33x = "ti335x"
TARGET_PRODUCT_ti43x = "ti437x"

EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'

do_compile_prepend() {
    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
}

do_install() {
    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary_omap_linux_xorg_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
}
