PR:append = ".psdk0"

SYSFW_SOC ?= "unknown"

SYSFW_PREFIX = "sci"
SYSFW_PREFIX:am62xx-evm = "fs"
SYSFW_PREFIX:am62xx-evm-k3r5 = "fs"
SYSFW_PREFIX:am62xx-lp-evm = "fs"
SYSFW_PREFIX:am62xx-lp-evm-k3r5 = "fs"
SYSFW_PREFIX:am62axx-evm = "fs"
SYSFW_PREFIX:am62axx-evm-k3r5 = "fs"

SYSFW_SOC:am62xx = "am62x"
SYSFW_SOC:am64xx = "am64x"
SYSFW_SOC:am62axx = "am62ax"

SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"

inherit deploy

do_deploy () {
     install -d ${DEPLOYDIR}
     install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
}

addtask deploy before do_build after do_compile
