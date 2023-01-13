FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_am62axx-evm = " \
    file://0001-mach-k3-am62a7-Add-support-to-enable-DSS-QoS.patch \
"

SRC_URI_append_am62axx-evm-k3r5 = " \
    file://0001-mach-k3-am62a7-Add-support-to-enable-DSS-QoS.patch \
"

PR = "r1"
