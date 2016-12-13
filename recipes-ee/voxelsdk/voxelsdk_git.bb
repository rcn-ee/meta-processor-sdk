DESCRIPTION = "VOXELSDK and 3D scanning application"
HOMEPAGE = "https://github.com/3dtof/voxelsdk"
SECTION = "multimedia"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=e69c599445026ffeae140a21181dfa88"

PV = "0.6.6"
PR = "r0"

SRC_URI = "git://github.com/3dtof/voxelsdk.git;protocol=git"
SRCREV  = "e60dc7bd0cd27ea8f205e05587b3f9b65563eb41"

S = "${WORKDIR}/git"

SRC_URI += " \
            file://0001-Add-support-for-AM437x-device-in-PLSDK-Also-Add-Simp.patch;patchdir=${S} \
            file://0002-Add-command-line-option-for-non-interactive-operatio.patch;patchdir=${S} \
            file://0003-extract-utility-allows-extraction-of-phase-and-ampli.patch;patchdir=${S} \
            file://0004-Fix-abosulute-path-of-include-directory.patch;patchdir=${S} \
"

export CMAKE_PREFIX_PATH="${WORKDIR}/build"

EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Debug -DVOXELSDK_INCDIR=${STAGING_INCDIR} "

inherit pkgconfig cmake

DEPENDS = "libusb1 udev opencv boost"

RDEPENDS_${PN} = "libusb1 udev opencv"

FILES_${PN} = "${bindir}"
FILES_${PN} += "${datadir}"
FILES_${PN} += "/etc /etc/udev /etc/udev/rules.d /etc/udev/rules.d/*"
FILES_${PN} += "${libdir}/*.so.*"
FILES_${PN} += "${libdir}/voxel/*.so.*"

FILES_${PN}-dev += "${libdir}/cmake ${libdir}/cmake/Voxel ${libdir}/cmake/TI3DToF"
FILES_${PN}-dev += "${libdir}/cmake/Voxel/*.cmake"
FILES_${PN}-dev += "${libdir}/cmake/TI3DToF/*.cmake"
FILES_${PN}-dev += "${libdir}/*.so"
FILES_${PN}-dev += "${libdir}/voxel/*.so"
