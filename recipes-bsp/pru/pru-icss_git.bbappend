PR_append = ".tisdk2"

PLATFORM_am65xx-hs-evm = "am65x"

do_install_append() {
    install -d ${D}${includedir}
    cp -r ${S}/include/* ${D}${includedir}
    install -d ${D}${libdir}
    cp ${S}/lib/rpmsg_lib.lib ${D}${libdir}
}

do_install_append_am65xx-hs-evm() {
    for i in 0 1
    do
        install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
                   ${D}/lib/firmware/pru
        install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
                   ${D}/lib/firmware/pru
    done
    for i in 0 1 2
    do
        for j in 0 1
        do
            install -m 0644 ${S}/examples/am65x/PRU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
                            ${D}/lib/firmware/pru
            install -m 0644 ${S}/examples/am65x/RTU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
                            ${D}/lib/firmware/pru

        done
    done
}

PRU_ICSS_ALTERNATIVES_am65xx-hs-evm = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"


FILES_${PN}-staticdev = "${libdir}"
FILES_${PN}-dev = "${includedir}"
