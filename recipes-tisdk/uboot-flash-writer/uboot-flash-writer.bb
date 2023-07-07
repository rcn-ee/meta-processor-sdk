PR = "psdk2"
SUMMARY = "Recipe to add uboot-flash-writer in SDK Installer"

LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://${COREBASE}/../meta-ti/meta-ti-bsp/licenses/TI-TSPA;md5=bb6bc27cd44417c389a180bd62f552a0"

COMPATIBLE_MACHINE = "am62xx-evm|am64xx-evm|am62axx-evm|am62xx-lp-evm"

S = "${WORKDIR}"
BRANCH = "master"

SRCREV = "dc575bb121f70f78381bfa4c3dcdc8675c228e9b"

SRC_URI = " \
    git://git.ti.com/git/processor-sdk/uboot-flash-writer.git;protocol=https;branch=${BRANCH} \
"

RDEPENDS:${PN} = "bash"

FLASHWRITER:am62xx-evm = "DFU_flash \                                                     
	Ethernet_flash \     
    uart_uniflash \                        
"

FLASHWRITER:am62axx-evm = "DFU_flash \
	uart_uniflash \
"

FLASHWRITER:am64xx-evm = "DFU_flash \
	Ethernet_flash \
	uart_uniflash \
"                                          

FLASHWRITER:am62xx-lp-evm = "uart_uniflash \
    DFU_flash \
"

do_install() {
    
    install -d ${D}/bin
	
	for flash in ${FLASHWRITER}                                            
	do
	    install -d ${D}/bin/${flash}

		install -d ${D}/bin/${flash}/${MACHINE}	
		
		cp -r ${S}/git/${flash}/${MACHINE}/* ${D}/bin/${flash}/${MACHINE}/		
		
		if [ "${flash}" == "DFU_flash" ]
		then
			cp ${S}/git/${flash}/u-boot_flashwriter.sh ${D}/bin/${flash}/
		fi

		if [ "${flash}" == "uart_uniflash" ]
        then
            cp ${S}/git/${flash}/uart_uniflash.py ${D}/bin/${flash}/
        fi

	done

}

FILES:${PN}:am62xx-evm = " \
    /bin/DFU_flash/* \
    /bin/Ethernet_flash/* \
    /bin/uart_uniflash/* \
"

FILES:${PN}:am64xx-evm = " \
	/bin/DFU_flash/* \
	/bin/Ethernet_flash/* \                                                     
	/bin/uart_uniflash/* \                                                   
"

FILES:${PN}:am62axx-evm = " \
	/bin/DFU_flash/* \
	/bin/uart_uniflash/* \ 
"

FILES:${PN}:am62xx-lp-evm = " \                                                   
	/bin/uart_uniflash/* \                                                      
    /bin/DFU_flash/* \
"
