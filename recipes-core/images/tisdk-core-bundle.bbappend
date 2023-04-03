PR_append = ".tisdk19"

DEPLOY_IMAGES_NAME_append_am64xx-evm = " tiboot3-am64x-gp-evm.bin tiboot3-am64x_sr2-hs-evm.bin tiboot3-am64x_sr2-hs-fs-evm.bin ti-sci-firmware-am64x_sr2-hs-cert.bin ti-sci-firmware-am64x_sr2-hs-enc.bin ti-sci-firmware-am64x_sr2-hs-fs-cert.bin ti-sci-firmware-am64x_sr2-hs-fs-enc.bin wificfg fitImage-its.its"
DEPLOY_IMAGES_NAME_append_am62xx-evm = " ti-fs-firmware-am62x-hs-fs-enc.bin ti-fs-firmware-am62x-hs-fs-cert.bin tiboot3-am62x-hs-evm.bin tiboot3-am62x-gp-evm.bin ti-fs-firmware-am62x-hs-enc.bin ti-fs-firmware-am62x-hs-cert.bin ti-fs-firmware-am62x-gp.bin ipc_echo_testb_mcu1_0_release_strip.xer5f wificfg"
DEPLOY_IMAGES_NAME_append_am62xx-lp-evm = " ti-fs-firmware-am62x-hs-fs-enc.bin ti-fs-firmware-am62x-hs-fs-cert.bin tiboot3-am62x-hs-evm.bin ti-fs-firmware-am62x-hs-enc.bin ti-fs-firmware-am62x-hs-cert.bin ti-fs-firmware-am62x-gp.bin ipc_echo_testb_mcu1_0_release_strip.xer5f wificfg"
DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x_sr2-gp.bin tiboot3.bin sysfw-am65x_sr2-evm.itb sysfw-am65x-evm.itb"
DEPLOY_IMAGES_NAME_append_am65xx-hs-evm = " ti-sci-firmware-am65x_sr2-hs-cert.bin ti-sci-firmware-am65x_sr2-hs-enc.bin tiboot3.bin sysfw-am65x_sr2-evm.itb sysfw-am65x-evm.itb fitImage-its.its"

IMAGE_INSTALL_remove_am65xx += "chromium"

IMAGE_INSTALL_am65xx += "\
    packagegroup-arago-tisdk-addons-sdk-host \
    packagegroup-arago-tisdk-crypto-sdk-host \
    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
    packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
"

# Add small docker rootfs for all SOCs
TARGET_IMAGES_append = " tisdk-docker-rootfs-image tisdk-tiny-image"

# Generate the full target file system components table.
sw_manifest_target() {
    # Extract the combined set of .control files from the TARGET_IMAGES in
    # the filesystem directory to generate the manifest.
    for image in ${TARGET_IMAGES}
    do
        if [ $image == "tisdk-tiny-image" ];
        then
	    continue
        else
            # Only extract tar.gz or tar.bz2 types
           if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
           then
               tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
           elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
           then
               tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
           fi
        fi
    done

    # set the opkg_dir value to look at the extracted target file system
    # image files
    opkg_dir="${IMAGE_ROOTFS}/filesystem/var/lib/opkg/info"

    sw_manifest_target_gplv3 $opkg_dir

    sw_manifest_table_header "All Target Device Content" "This table describes any software being delivered that is expected to run on the target device."

    generate_sw_manifest_table $opkg_dir

    sw_manifest_table_footer

    # Remove the temporary var directory that was extracted
    rm -rf ${IMAGE_ROOTFS}/filesystem/var
}

require tisdk-core-bundle-sw-manifest.inc
