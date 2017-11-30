SUMMARY = "X11 Userspace libraries for PowerVR SGX chipset on TI SoCs"
HOMEPAGE = "https://git.ti.com/processor-sdk/omap5-sgx-ddk-um-linux-x11-experimental"
LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"

PACKAGE_ARCH = "${MACHINE_ARCH}"

BRANCH = "ti-img-sgx/${PV}"

SRC_URI = "git://git.ti.com/processor-sdk/omap5-sgx-ddk-um-linux-x11-experimental.git;protocol=git;branch=${BRANCH}"
SRCREV = "bc642ce08c6056906eac4c7e257e856bb22d8cbb"

SRC_URI += " file://xorg"

# There's only hardfp version available
python __anonymous() {
    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
    if not tunes:
        return
    pkgn = bb.data.getVar("PN", d, 1)
    pkgv = bb.data.getVar("PV", d, 1)
    if "callconvention-hard" not in tunes:
        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
}

TARGET_PRODUCT_omap-a15 = "jacinto6evm"
TARGET_PRODUCT_ti33x = "ti335x"
TARGET_PRODUCT_ti43x = "ti437x"

INITSCRIPT_NAME = "rc.pvr"
INITSCRIPT_PARAMS = "defaults 8"

inherit update-rc.d

PR = "r2"
PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-xsgx-ddk-um-linux"

DEPENDS += "udev"
RDEPENDS_${PN} += "libudev"


RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-xsgx-ddk-um-linux"
RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-xsgx-ddk-um-linux-dev"
RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-xsgx-ddk-um-linux-dbg"

RREPLACES_${PN} = "libegl libgles1 libgles2 omap5-xsgx-ddk-um-linux"
RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-xsgx-ddk-um-linux-dev"
RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-xsgx-ddk-um-linux-dbg"

RCONFLICTS_${PN} = "libegl libgles1 libgles2 omap5-xsgx-ddk-um-linux"
RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-xsgx-ddk-um-linux-dev"
RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-xsgx-ddk-um-linux-dbg"

S = "${WORKDIR}/git"

do_install () {
    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
    install -m 0644 ${WORKDIR}/xorg ${D}${sysconfdir}/init.d/
}

SYSROOT_DIRS_append = "/usr/local"

FILES_${PN} +=  "/usr/local/*"

FILES_${PN}-staticdev +=  "/usr/local/*"

PACKAGES =+ "${PN}-plugins"
FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"
FILES_${PN}-plugins += "/usr/local/XSGX/lib/dri/*.so /usr/local/XSGX/lib/xorg/modules/*.so /usr/local/XSGX/lib/xorg/modules/drivers/*.so /usr/local/XSGX/lib/xorg/modules/extensions/*.so /usr/local/XSGX/lib/xorg/modules/input/*.so"
FILES_${PN}-staticdev += "/usr/local/XSGX/lib/dri/*.so /usr/local/XSGX/lib/xorg/modules/*.so /usr/local/XSGX/lib/xorg/modules/drivers/*.so /usr/local/XSGX/lib/xorg/modules/extensions/*.so /usr/local/XSGX/lib/xorg/modules/input/*.so"
RDEPENDS_${PN} += "${PN}-plugins"

SYSROOT_DIRS_BLACKLIST_append = " /usr/local/XSGX/lib/libpng.a /usr/local/XSGX/lib/libpng.so"


ALLOW_EMPTY_${PN}-plugins = "1"

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_SYSROOT_STRIP = "1"

INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
INSANE_SKIP_${PN}-plugins = "dev-so"
INSANE_SKIP_${PN}-dev = "dev-so"
INSANE_SKIP_${PN}-staticdev = "dev-so"
INSANE_SKIP_${PN} += "already-stripped"

CLEANBROKEN = "1"

