ARAGO_TISDK_IMAGE = "processor-sdk-linux${ARAGO_KERNEL_SUFFIX}-bundle"

INHERIT += "recipe-data"

PREFERRED_VERSION:tensorflow-lite:am65xx = "1.15"

# Enable TI UIO devices
ENABLE_TI_UIO_DEVICES = "0"

# Increase priority of ti-ipc-rtos firmwares
ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos = "15"

# Add DTBs specific to the Processor SDK kernel
PSDK_KERNEL_DEVICETREE ?= ""
KERNEL_DEVICETREE:append = " ${PSDK_KERNEL_DEVICETREE}"

PSDK_KERNEL_DEVICETREE:ti33x = " "
PSDK_KERNEL_DEVICETREE:ti43x = " "

# Override MKUBIFS_ARGS when our image size exceeds upstream limits
MKUBIFS_ARGS:am335x-evm     = "-F -m 2048 -e 126976 -c 13000"
MKUBIFS_ARGS:am335x-hs-evm  = "-F -m 2048 -e 126976 -c 13000"
MKUBIFS_ARGS:am437x-evm     = "-F -m 4096 -e 253952 -c 6500"
MKUBIFS_ARGS:am437x-hs-evm  = "-F -m 4096 -e 253952 -c 6500"

# By default, do not include OPTEE for any HS platform
# Comment the following lines to build Processor SDK with OPTEE
FITIMAGE_PACK_TEE:am437x-hs-evm = "0"

# To create newlines in the message \n is used and the slash must be escaped
# to function properly

SRCIPK_GIT_COMMIT_MESSAGE = "\
Create local branch\\n\
\\n\
The below commit is used for this local branch and is the one used by\\n\
this sdk:\\n\
${SRCREV}."

SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE ="${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n\
To reduce the size of the SDK installer only a portion of the git commit\\n\
history has been preserved. Also links to remote branches and tags do\\n\
not exist in this copy of the repository.\\n\
To fix this please run the unshallow-repositories.sh\\n\
script located in the sdk\'s bin directory\\n\
\\n\
The script may take several minutes but you will then have a full copy of\\n\
the git repository including its entire git history.\\n"

SRCIPK_CUSTOM_GIT_BRANCH:pn-linux-ti-staging = "processor-sdk-local"
SRCIPK_CUSTOM_GIT_MESSAGE:pn-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging = "true"
SRCIPK_SHALLOW_DEPTH:pn-linux-ti-staging = "100"

CREATE_SRCIPK:pn-linux-ti-staging-rt = "1"
SRCIPK_INSTALL_DIR:pn-linux-ti-staging-rt = "board-support/linux-rt-${PV}${KERNEL_LOCALVERSION}"
SRCIPK_PRESERVE_GIT:pn-linux-ti-staging-rt = "true"
SRCIPK_CUSTOM_GIT_BRANCH:pn-linux-ti-staging-rt = "processor-sdk-local"
SRCIPK_CUSTOM_GIT_MESSAGE:pn-linux-ti-staging-rt = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging-rt = "true"
SRCIPK_SHALLOW_DEPTH:pn-linux-ti-staging-rt = "100"

SRCIPK_CUSTOM_GIT_BRANCH:pn-u-boot-ti-staging = "processor-sdk-local"
SRCIPK_CUSTOM_GIT_MESSAGE:pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"

