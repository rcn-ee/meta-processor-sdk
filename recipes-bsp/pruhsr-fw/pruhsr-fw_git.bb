DESCRIPTION = "PRU HSR firmware for AM57xx"

LICENSE = "TI-TFL"
LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"

PV = "2.15.23"
PE = "1"
PR = "r0"

COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm|k2g"

PACKAGE_ARCH = "${MACHINE_ARCH}"

SRCREV = "ccca45999b170ed32db4248f5f89b81c08cc286d"
BRANCH ?= "master"

SRC_URI = "git://git.ti.com/processor-sdk/processor-sdk-firmware.git;protocol=git;branch=${BRANCH}"

S = "${WORKDIR}/git"

TARGET = ""
TARGET_ti33x = "am335x-pru0-pruhsr-fw.elf am335x-pru1-pruhsr-fw.elf"
TARGET_ti43x = "am437x-pru0-pruhsr-fw.elf am437x-pru1-pruhsr-fw.elf"
TARGET_am57xx-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
TARGET_am57xx-hs-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
TARGET_k2g = "k2g-pru0-pruhsr-fw.elf k2g-pru1-pruhsr-fw.elf"

do_install() {
	install -d ${D}${base_libdir}/firmware/ti-pruss
	for f in ${TARGET}; do
		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
	done
}

FILES_${PN} = "${base_libdir}/firmware"

INSANE_SKIP_${PN} = "arch"
