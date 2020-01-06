PR_append = ".tisdk18"

IMAGE_INSTALL = "\
    packagegroup-arago-tisdk-addons-sdk-host \
    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
    packagegroup-arago-tisdk-crypto-sdk-host \
    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
    packagegroup-arago-tisdk-matrix-sdk-host \
    packagegroup-arago-tisdk-multimedia-sdk-host \
    packagegroup-arago-tisdk-hmi-sdk-host \
    packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
    ${IMAGE_INSTALL_QT} \
"
# Add small docker rootfs for all SOCs
TARGET_IMAGES_append = " tisdk-docker-rootfs-image"


# The following FITIMAGE vars are copied from kernel-fitimage.bbclass.
#
# We need to get these into the prebuilt-images. We don't want to inherit the
# entire class, so copy these vas here and allow them to be overridden by some
# global configuration.
FITIMAGE_ITS_SUFFIX ?= "its"
FITIMAGE_ITB_SUFFIX ?= "itb"

FITIMAGE_ITS_SYMLINK ?= "fitImage-its-${MACHINE}.${FITIMAGE_ITS_SUFFIX}"
FITIMAGE_ITB_SYMLINK ?= "fitImage-linux.bin-${MACHINE}.${FITIMAGE_ITB_SUFFIX}"

FITIMAGE_INITRAMFS_ITS_SYMLINK ?= "fitImage-its-${INITRAMFS_IMAGE}-${MACHINE}.${FITIMAGE_ITS_SUFFIX}"
FITIMAGE_INITRAMFS_ITB_SYMLINK ?= "fitImage-${INITRAMFS_IMAGE}-${MACHINE}.${FITIMAGE_ITB_SUFFIX}"

DEPLOY_FITIMAGE_NAMES ?= "${FITIMAGE_ITS_SYMLINK} ${FITIMAGE_ITB_SYMLINK}"
DEPLOY_FITIMAGE_INITRAMFS_NAMES ?= "${FITIMAGE_INITRAMFS_ITS_SYMLINK} ${FITIMAGE_INITRAMFS_ITB_SYMLINK}"


# U-Boot HS_MLO filename
DEPLOY_HS_MLO_NAME ?= "u-boot_HS_MLO-${MACHINE}"

DEPLOY_SPL_NAME_k2g-evm = "MLO-${MACHINE}"


tisdk_image_build_append () {
    for u in ${DEPLOY_DIR_IMAGE}/u-boot*-${MACHINE}.gph
    do
        if [ -e $u ]
        then
            cp $u ${prebuilt_dir}/
        fi
    done

    for s in ${DEPLOY_DIR_IMAGE}/skern-*.bin
    do
        if [ -e $s ]
        then
            cp $s ${prebuilt_dir}/
        fi
    done

    for fw in ${DEPLOY_DIR_IMAGE}/*fw-initrd.cpio.gz
    do
        if [ -e $fw ]
        then
            cp $fw ${prebuilt_dir}/
        fi
    done

    if [ "${DEPLOY_HS_MLO_NAME}" != "" ]
    then
        # Copy the HS_MLO image if it exists
        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_HS_MLO_NAME} ]
        then
            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_HS_MLO_NAME} ${prebuilt_dir}/
        fi
    fi

    if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"
    then
        for fitimage in ${DEPLOY_FITIMAGE_NAMES}
        do
            cp ${DEPLOY_DIR_IMAGE}/$fitimage ${prebuilt_dir}/
        done

        if [ -n "${INITRAMFS_IMAGE}" ]
        then
            for fitimage in ${DEPLOY_FITIMAGE_INITRAMFS_NAMES}
            do
                cp ${DEPLOY_DIR_IMAGE}/$fitimage ${prebuilt_dir}/
            done
        fi
    fi
}

require arago-core-tisdk-bundle-sw-manifest.inc
