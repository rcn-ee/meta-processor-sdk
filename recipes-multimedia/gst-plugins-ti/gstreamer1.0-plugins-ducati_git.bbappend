PR_append = "-tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-Reduce-mem-copying-and-code-clean-up.patch \
    file://0002-Solve-memory-leak-incase-of-external-bufferpool.patch \
    file://0003-gstducati-Correct-h264-ducati-plugin-caps.patch \
    file://0004-gst-ducati-Enable-ducati-to-accept-streams-without-p.patch \
    file://0005-gst-ducati-Change-codec-level-param-depending-on-str.patch \
"
