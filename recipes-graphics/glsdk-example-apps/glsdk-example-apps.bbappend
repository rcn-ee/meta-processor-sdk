FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PR_append = ".tisdk0"

SRC_URI_append = "file://0001-soc-perf-config-Update-config-to-have-generic-names.patch"
