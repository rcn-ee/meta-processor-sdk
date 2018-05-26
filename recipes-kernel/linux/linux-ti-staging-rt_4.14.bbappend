require linux-processor-sdk-4.14.inc

PR_append = ".1"

#KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
#BRANCH = "processor-sdk-linux-rt-04.03.00"
#SRCREV = "70e3f5f4ba347d0e929b004cb006e320fa01cdf1"

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
