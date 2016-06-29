PR_append = ".tisdk1"

require ocl-01.01.09.inc

SRC_URI_remove = " \
    file://0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch;pnum=2 \
"

INSANE_SKIP_${PN} += "staticdev"
