PR_append = ".tisdk0"

require ocl-01.01.09.00.inc

DEPENDS_append = " elfutils"

EXTRA_OECMAKE += " -DOCL_VERSION=${PV}"
