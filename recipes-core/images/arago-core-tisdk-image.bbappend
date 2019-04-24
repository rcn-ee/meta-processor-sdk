PR_append = ".tisdk17"

IMAGE_INSTALL = "\
    packagegroup-arago-tisdk-addons-sdk-host \
    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
    packagegroup-arago-tisdk-crypto-sdk-host \
    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
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

# U-Boot HS_MLO filename
DEPLOY_HS_MLO_NAME ?= "u-boot_HS_MLO-${MACHINE}"

DEPLOY_SPL_NAME_k2g-evm = "MLO-${MACHINE}"

DTB_FILTER_am65xx-hs-evm = "am65"
DEPLOY_IMAGES_NAME_am65xx-hs-evm = "bl31.bin bl32.bin"

SW_MANIFEST_QT5_FOOTER = "Any Qt package referenced in this manifest that has LGPL 2.1 or LGPL 3 as a licensing option is only being used and distributed by TI under LGPL 2.1. The choice of having both, as reflected in the manifest table, comes from the licensing line the corresponding recipe. TI has opted to only use LGPL 2.1."

SW_MANIFEST_FOOTER = "\
${@oe.utils.conditional('QT_PROVIDER', 'qt5', '${SW_MANIFEST_QT5_FOOTER}', '', d)}\
"

sw_manifest_table_footer() {
cat >> ${SW_MANIFEST_FILE} << EOF
<p>
${SW_MANIFEST_FOOTER}
</p>
EOF

cat >> ${SW_MANIFEST_TEXT} << EOF
<Footnotes>
${SW_MANIFEST_FOOTER}
</footnotes>
</table>
EOF
}


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
    fi
}

require arago-core-tisdk-image-sw-manifest.inc
