DESCRIPTION = "Imagination PowerVR SDK binaries for Jacinto6 SoC"
LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=46bcbfc69f8837c339e15fd4a5044a8c"

SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git"
SRCREV = "c2456ec3f03da022fb7489d6b381a4ac26a68203"

PR = "r0"

COMPATIBLE_MACHINE = "dra7xx"

S = "${WORKDIR}/git"

do_install () {
    oe_runmake install DESTDIR=${D}
}


INHIBIT_PACKAGE_STRIP = "1"

INSANE_SKIP_${PN} += "dev-so"

FILES_${PN} += "/opt/img-powervr-sdk/Examples/Advanced/OGLES2ChameleonMan \
                /opt/img-powervr-sdk/Examples/Advanced/OGLES2Coverflow \
                /opt/img-powervr-sdk/Examples/Advanced/OGLES2ExampleUI \
                /opt/img-powervr-sdk/Examples/Advanced/OGLES2Navigation \
                /opt/img-powervr-sdk/PVRHub/* \
                /opt/img-powervr-sdk/PVRScopeDeveloper/* \
               "
