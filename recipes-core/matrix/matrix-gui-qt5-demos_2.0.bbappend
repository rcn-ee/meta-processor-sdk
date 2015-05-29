PR_append = "-tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    ${@base_contains('DISTRO_FEATURES','wayland','file://qt5_deform-Remove-small-screen-option.patch;patchdir=${WORKDIR}/git','',d)} \
"
