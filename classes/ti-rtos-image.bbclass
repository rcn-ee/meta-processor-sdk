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
RDEPENDS_${PN} += "${EXTRA_TOOLS}"
PACKAGE_ARCH = "${MACHINE_ARCH}"

# helper function for generating a set of strings based on a list.  Taken
# from the image.bbclass.
def string_set(iterable):
    return ' '.join(set(iterable))

# Add a dependency for the do_rootfs function that will force us to build
# the TARGET_IMAGES first so that they will be available for packaging.
do_rootfs[depends] += "${@string_set('%s:do_rootfs' % pn for pn in (d.getVar("EXTRA_IMAGES", True) or "").split())}"

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
    for image in ${EXTRA_IMAGES}
    do
        tar -xf ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}
    done

    for tool in ${EXTRA_TOOLS}
    do
        mkdir -p ${IMAGE_ROOTFS}/.tmp_${tool}
        cd ${IMAGE_ROOTFS}/.tmp_${tool}
        tool_ipk=`find ${DEPLOY_DIR} -name ${tool}_*`
        ar x ${tool_ipk}
        tar -C ${IMAGE_ROOTFS} -xf data.tar.gz
        cd - > /dev/null
        rm -rf ${IMAGE_ROOTFS}/.tmp_${tool}
    done

    if [ -d ${IMAGE_ROOTFS}/component-sources ]
    then
        mv ${IMAGE_ROOTFS}/component-sources/* ${IMAGE_ROOTFS}/
        rmdir ${IMAGE_ROOTFS}/component-sources
    fi
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

IMAGE_FSTYPES = "tar.gz"

IMAGE_INSTALL ?= "packagegroup-arago-tisdk-rtos"

EXTRA_IMAGES ?= "ti-pdk-image"
EXTRA_TOOLS ?= ""
