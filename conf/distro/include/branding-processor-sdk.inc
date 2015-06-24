ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"

# Remove wayland from ti33x and ti43x DISTRO_FEATURES.
DISTRO_FEATURES_remove_ti33x = "wayland"
DISTRO_FEATURES_remove_ti43x = "wayland"

# Override weston packageconfig
PACKAGECONFIG_pn-weston = "fbdev kms egl launch libinput"

PREFERRED_PROVIDER_gstreamer1.0-plugins-bad = "gstreamer1.0-plugins-bad-ti"
PREFERRED_PROVIDER_gstreamer1.0-plugins-bad-dev = "gstreamer1.0-plugins-bad-ti-dev"
PREFERRED_PROVIDER_gstreamer1.0-plugins-bad-meta = "gstreamer1.0-plugins-bad-ti-meta"

# Set preferred providers and srcrevs
# Auto rev important packages to pick up latest
PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-processor-sdk"
PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-processor-sdk"
PREFERRED_PROVIDER_virtual/kernel_omap-a15 = "linux-processor-sdk"
PREFERRED_VERSION_linux-processor-sdk = "3.14%"

CMEM_BASE_pn-linux-processor-sdk_omap-a15 = "a0000000"
CMEM_SIZE_pn-linux-processor-sdk_omap-a15 = "08000000"

#SRCREV_pn-u-boot-ti-staging_omap-a15 = "${AUTOREV}"
#SRCREV_pn-ltp-ddt_omap-a15 = "${AUTOREV}"
#SRCREV_pn-linux-processor-sdk = "${AUTOREV}"

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
SRCIPK_SHALLOW_CLONE_pn-linux-processor-sdk = "true"

SRCIPK_CUSTOM_GIT_BRANCH_pn-linux-processor-sdk = "processor-sdk-1.0"
SRCIPK_CUSTOM_GIT_MESSAGE_pn-linux-processor-sdk = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"

SRCIPK_SHALLOW_CLONE_pn-linux-processor-sdk = "true"
SRCIPK_SHALLOW_DEPTH_pn-linux-processor-sdk = "400"

SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "processor-sdk-1.0"
SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
