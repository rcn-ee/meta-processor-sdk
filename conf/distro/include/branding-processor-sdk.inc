ARAGO_TISDK_IMAGE = "processor-sdk-linux${ARAGO_RT_SUFFIX}-image"

#PREFERRED_PROVIDER_virtual/kernel = "linux-processor-sdk"
#PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-processor-sdk"
#PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-processor-sdk"
#PREFERRED_PROVIDER_virtual/kernel_am57xx-evm = "linux-processor-sdk"
#PREFERRED_PROVIDER_virtual/kernel_keystone = "linux-processor-sdk"
PREFERRED_VERSION_linux-processor-sdk = "4.1%"

# Remove wayland from ti33x DISTRO_FEATURES.
DISTRO_FEATURES_remove_ti33x = "wayland"

# CMEM reserved memory
RESERVE_CMEM_dra7xx = "1"
RESERVE_CMEM_k2hk-evm = "1"

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

CREATE_SRCIPK_pn-linux-processor-sdk = "1"
SRCIPK_INSTALL_DIR_pn-linux-processor-sdk = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
SRCIPK_PRESERVE_GIT_pn-linux-processor-sdk = "true"
SRCIPK_CUSTOM_GIT_BRANCH_pn-linux-processor-sdk = "processor-sdk-local"
SRCIPK_CUSTOM_GIT_MESSAGE_pn-linux-processor-sdk = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
SRCIPK_SHALLOW_CLONE_pn-linux-processor-sdk = "true"
SRCIPK_SHALLOW_DEPTH_pn-linux-processor-sdk = "400"

SRCIPK_CUSTOM_GIT_BRANCH_pn-linux-ti-staging = "processor-sdk-local"
SRCIPK_CUSTOM_GIT_MESSAGE_pn-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging = "true"
SRCIPK_SHALLOW_DEPTH_pn-linux-ti-staging = "400"

SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "processor-sdk-local"
SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
