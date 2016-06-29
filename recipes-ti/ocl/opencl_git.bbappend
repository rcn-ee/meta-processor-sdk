PR_append = ".tisdk1"

require ocl-01.01.09.inc

DEPENDS_append = " elfutils"

EXTRA_OECMAKE += " -DOCL_VERSION=${PV}"
