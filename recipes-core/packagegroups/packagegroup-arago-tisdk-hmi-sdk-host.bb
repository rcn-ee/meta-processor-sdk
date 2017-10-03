SUMMARY = "Task to add HMI related sources into the SDK"
LICENSE = "MIT"
PR = "r1"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

HMI = ""

HMI_append_ti43x = " \
    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', 'evse-hmi-src', d)} \
"

HMI_append_ti33x = " \
    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', 'evse-hmi-src', d)} \
    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', 'protection-relays-hmi-src', d)} \
"


HMI_append_omap-a15 = " \
    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', 'evse-hmi-src', d)} \
"

RDEPENDS_${PN} = "\
    ${HMI} \
"
