PR_append = ".ti-int0"

COMPATIBLE_MACHINE_append = "|ti33x|ti43x|omap-a15"

do_compile_append() {
    sourceipk_do_create_srcipk
}

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "edma3_lld_02_12_01_21"
