PR_append = "-tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0006-Waylandsink-Workaround-for-partial-frame-delay-artif.patch;patchdir=ext/wayland \
    file://0007-Enable-mouse-movement-for-videos-on-waylandsink.patch;patchdir=ext/wayland \
    file://0008-Modify-parser-to-interpolate-pts.patch \
    file://0009-Improvise-DRM-bufferpool-to-solve-memory-leak.patch \
    file://0010-gst-waylandsink-Cleanup-buffer-in-NULL-state.patch \
    file://0011-Solve-segmentation-fault-in-drm_handle_format.patch \
    file://0012-Fix-memleak-due-to-unfreed-hash-table.patch \
"
