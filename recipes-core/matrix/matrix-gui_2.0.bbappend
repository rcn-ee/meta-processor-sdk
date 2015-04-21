PR_append = "-tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += "${@base_contains('DISTRO_FEATURES', 'wayland', 'file://sgx-demos-workaround.patch', '', d)}"
