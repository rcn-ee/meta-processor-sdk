PR_append = ".tisdk0"

do_compile () {
#   Build the tests
    oe_runmake tests DEVICE="am571x" TARGET="SOC_AM571x"
    oe_runmake clean
    oe_runmake tests DEVICE="am572x" TARGET="SOC_AM572x"
}

do_install () {
#   Install the binary
    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am571x" TARGET="SOC_AM571x"
    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am572x" TARGET="SOC_AM572x"
}
