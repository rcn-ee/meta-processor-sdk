PR_append = "-tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-Reduce-mem-copying-and-code-clean-up.patch \
    file://0002-Solve-memory-leak-incase-of-external-bufferpool.patch \
"
