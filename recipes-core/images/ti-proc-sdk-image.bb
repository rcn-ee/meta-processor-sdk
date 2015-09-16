inherit tisdk-image

TARGET_IMAGES = " "
TISDK_TOOLCHAIN = " "

USE_DEVFS = "1"

require recipes-ti/includes/ti-paths-append.inc

generate_sw_manifest() {
    sw_manifest_header
    sw_manifest_host
    sw_manifest_footer
}

python do_rootfs () {
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

    # Add the EXTRA_TISDK_FILES contents if they exist
    # Make sure EXTRA_TISDK_FILES is not empty so we don't accidentaly
    # copy the root directory.
    # Use -L to copy the actual contents of symlinks instead of just
    # the links themselves
    if [ "${EXTRA_TISDK_FILES}" != "" ]
    then
        if [ -d "${EXTRA_TISDK_FILES}" ]
        then
            cp -rLf ${EXTRA_TISDK_FILES}/* ${IMAGE_ROOTFS}/
        fi
    fi

    PROC_SDK_DEVICE="${@'${MACHINE}'.replace('-evm','')}"
    PROC_SDK_VER=`echo ${TISDK_VERSION} | sed -e 's|\.|_|g' -e 's|^0||'`
    PROC_SDK_DIR_NAME=processor_sdk_rtos_${PROC_SDK_DEVICE}_${PROC_SDK_VER}

    if [ -d ${IMAGE_ROOTFS}/processor_sdk_rtos ]
    then
        mv ${IMAGE_ROOTFS}/processor_sdk_rtos ${IMAGE_ROOTFS}/${PROC_SDK_DIR_NAME}
    fi

    mkdir -p ${IMAGE_ROOTFS}/${PROC_SDK_DIR_NAME}/demos
    mkdir -p ${IMAGE_ROOTFS}/${PROC_SDK_DIR_NAME}/docs

    # Copy any existing demo content
    if [ -d ${IMAGE_ROOTFS}${DEMOS_INSTALL_DIR_RECIPE} ]
    then
        cp -pPrf ${IMAGE_ROOTFS}${DEMOS_INSTALL_DIR_RECIPE}/* ${IMAGE_ROOTFS}/${PROC_SDK_DIR_NAME}/demos/
    fi
}

tisdk_image_cleanup_append () {
    # Move the var/etc directories which contains the opkg data used for the
    # manifest (and maybe one day for online updates) to a hidden directory.
    rm -rf ${IMAGE_ROOTFS}/usr
}

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

export IMAGE_BASENAME = "ti-proc-sdk-image"

TISDK_VERSION ?= "${SDK_VERSION}"

IMAGE_FSTYPES = "tar.gz"

IMAGE_INSTALL = "packagegroup-arago-tisdk-proc-sdk"
