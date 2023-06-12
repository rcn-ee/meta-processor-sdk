DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
LICENSE = "MIT"
PR = "r1"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

UTILS = " \
    arm-benchmarks-src \
    oprofile-example-src \
"

UTILS:append:ti33x = " \
    omapconf-src \
    pru-icss-src \
"

UTILS:append:ti43x = " \
    pru-icss-src \
"

UTILS:append:k3 = " \
    trusted-firmware-a-src \
"

UTILS:append:am65xx = " \
    pru-icss-src \
"

UTILS:append:am64xx = " \
    pru-icss-src \
"

UTILS:append:am62xx = " \
    pru-icss-src \
"

EXTRA_LIBS = ""

EXTRA_LIBS:append:ti33x = " \
    uio-module-drv-src \
"

EXTRA_LIBS:append:ti43x = " \
    cmem-mod-src \
    uio-module-drv-src \
"

PDM_ANOMALY_PKG_SRC = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detection-src', '', d)} \
"

EXTRA_PACKAGES = ""

EXTRA_PACKAGES:append:ti33x = " \
    ${PDM_ANOMALY_PKG_SRC} \
"

EXTRA_PACKAGES:append:ti43x = " \
    ${PDM_ANOMALY_PKG_SRC} \
"

EXTRA_PACKAGES:append:am65xx = " \
    ${PDM_ANOMALY_PKG_SRC} \
"

RDEPENDS:${PN} = " \
    ${UTILS} \
    ${EXTRA_LIBS} \
    ${EXTRA_PACKAGES} \
"

UTILS:append:am335x-evm = " pru-adc-src"
