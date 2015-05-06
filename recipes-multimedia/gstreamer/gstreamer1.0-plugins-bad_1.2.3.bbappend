PR_append = "-tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0006-Waylandsink-Workaround-for-partial-frame-delay-artif.patch;patchdir=ext/wayland \
    file://0007-Enable-mouse-movement-for-videos-on-waylandsink.patch;patchdir=ext/wayland \
    file://0008-Modify-parser-to-interpolate-pts.patch \
"
