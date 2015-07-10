inherit rootfs_ipk
inherit image_types

require recipes-ti/includes/ti-paths-append.inc

# This defines the list of features that we want to include in the SDK
# image.  The list of packages this will be installed for each features
# is controlled with the PACKAGE_GROUP_<feature> settings below.
IMAGE_FEATURES ?= ""
IMAGE_FEATURES[type] = "list"

# Always add the sdk_base feature
IMAGE_FEATURES_prepend = "sdk_base package-management"

USE_DEVFS = "1"

# Define our always included sdk package group as the IMAGE_INSTALL settings
# like you would expect.
PACKAGE_GROUP_sdk_base = "${IMAGE_INSTALL}"

# Create the list of packages to be installed
PACKAGE_INSTALL = "${@' '.join(oe.packagegroup.required_packages('${IMAGE_FEATURES}'.split(), d))}"

RDEPENDS_${PN} += "${@' '.join(oe.packagegroup.active_packages('${IMAGE_FEATURES}'.split(), d))}"

PACKAGE_ARCH = "${MACHINE_ARCH}"

do_rootfs[nostamp] = "1"
do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
do_rootfs[cleandirs] += "${S}"

# Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs functionality
# to install a given list of packages using opkg.
fakeroot python do_rootfs () {
    from oe.rootfs import create_rootfs
    from oe.image import create_image
    from oe.manifest import create_manifest

    # generate the initial manifest
    create_manifest(d)

    # generate rootfs
    create_rootfs(d)

    # generate final images
    create_image(d)
}

ROOTFS_PREPROCESS_COMMAND += "tisdk_image_setup; "
ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build; "
IMAGE_PREPROCESS_COMMAND += "tisdk_image_cleanup; "

tisdk_image_setup () {
    set -x
    rm -rf ${IMAGE_ROOTFS}
    mkdir -p ${IMAGE_ROOTFS}
    mkdir -p ${DEPLOY_DIR_IMAGE}

    mkdir -p ${IMAGE_ROOTFS}/etc
    mkdir -p ${IMAGE_ROOTFS}/var/lib/opkg
    mkdir -p ${IMAGE_ROOTFS}/lib
}

tisdk_image_build() {
    mv ${IMAGE_ROOTFS}${PDK_INSTALL_DIR_RECIPE} ${IMAGE_ROOTFS}/${IMAGE_BASENAME}_${MACHINE}_${TI_PDK_VERSION}
}

tisdk_image_cleanup () {
    # Move the var/etc directories which contains the opkg data used for the
    # manifest (and maybe one day for online updates) to a hidden directory.
    mv ${IMAGE_ROOTFS}/var ${IMAGE_ROOTFS}/.var
    mv ${IMAGE_ROOTFS}/etc ${IMAGE_ROOTFS}/.etc
    mv ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/.lib
}

license_create_manifest() {
    :
}

EXPORT_FUNCTIONS do_rootfs
addtask rootfs before do_build after do_install

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

export IMAGE_BASENAME = "pdk"

TI_PDK_VERSION = "8_00_00_00"

IMAGE_FSTYPES = "tar.gz"

IMAGE_INSTALL = "packagegroup-arago-tisdk-pdk-dev"
