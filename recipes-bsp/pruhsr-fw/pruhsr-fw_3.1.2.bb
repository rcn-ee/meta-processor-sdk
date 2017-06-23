DESCRIPTION = "PRU HSR firmware for AM57xx"

LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://${WORKDIR}/tspa.txt;md5=35194e99b81bb9bf40524e85cdba72e4"

PR = "r1"

COMPATIBLE_MACHINE = "am57xx-evm"

PACKAGE_ARCH = "${MACHINE_ARCH}"

SRC_URI = " \
    file://tspa.txt \
    file://am57xx-pru0-pruhsr-fw.elf \
    file://am57xx-pru1-pruhsr-fw.elf \
"

TARGET = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"

do_install() {
	install -d ${D}${base_libdir}/firmware/ti-pruss
	for f in ${TARGET}; do
		install -m 0644 ${WORKDIR}/$f ${D}${base_libdir}/firmware/ti-pruss/$f
	done
}

FILES_${PN} = "${base_libdir}/firmware"

INSANE_SKIP_${PN} = "arch"
