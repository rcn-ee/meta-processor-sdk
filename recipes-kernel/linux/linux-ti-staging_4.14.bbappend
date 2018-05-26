require linux-processor-sdk-4.14.inc

PR_append = ".1"

#KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
#BRANCH = "processor-sdk-linux-04.03.00"
#SRCREV = "6d34f3ade55e815fffad92765d3a3ae775cc2bf0"

do_setup_uio_append_ti33x() {

    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
    then
        dts="am335x-icev2-pru-excl-uio.dts"
        dtsi="am335x-pru-uio.dtsi"
        cp ${S}/arch/arm/boot/dts/am335x-icev2-prueth.dts ${S}/arch/arm/boot/dts/$dts
        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
    fi
}
