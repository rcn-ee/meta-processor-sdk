# jailhouse for am57xx-evm was developed in a different repo
BRANCH_am57xx-evm = "plsdk_am57xx"
SRC_URI_am57xx-evm = "git://git.ti.com/processor-sdk/jailhouse.git;branch=${BRANCH}"

SRCREV_am57xx-evm = "6044dcf5643ebe5928703e5bd73f4bca52149409"

# ti-app cannot be built in parallel
PARALLEL_MAKE_am57xx-evm = ""

# This recipe builds both a kernel module and userspace libs without a clear
# way to build each individually. The am5 kernel wants to set soft-float while
# we have tuned it for hard-float, so there is a conflict. Remove CC from here
# until a proper solution is found.
EXTRA_OEMAKE_remove_am57xx-evm = "CC="${CC}""

# Directory structure used in previous jailhouse recipe
#CELL_DIR_am57xx-evm ?= "${JH_DATADIR}/examples"
#INMATES_DIR_am57xx-evm ?= "${JH_DATADIR}/examples"

# Jailhouse configuration for am57xx-evm
JH_CONFIG_am57xx-evm ?= "${S}/ci/jailhouse-config-am57xx-evm.h"

JH_CELL_FILES_am57xx-evm ?= "am57*.cell"

# The linux-demo is not currently supported for am57xx-evm
JH_INMATE_DTB_am57xx-evm ?= ""
JH_LINUX_DEMO_CELL_am57xx-evm ?= ""
JH_SYSCONFIG_CELL_am57xx-evm ?= ""
JH_RAMFS_IMAGE_am57xx-evm ?= ""

do_install_append_am57xx-evm() {
	install -m 0644 ${B}/inmates/ti_app/ti-app.bin ${D}${INMATES_DIR}
}

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "board-support/extra-drivers/${PN}-${PV}"
