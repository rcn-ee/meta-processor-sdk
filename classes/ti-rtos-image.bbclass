inherit tisdk-image

TARGET_IMAGES = " "
TISDK_TOOLCHAIN = " "

USE_DEVFS = "1"

RDEPENDS_${PN} += "${EXTRA_TOOLS}"

# Add a dependency for the do_rootfs function that will force us to build
# the EXTRA_IMAGES first so that they will be available for packaging.
do_rootfs[depends] += "${@string_set('%s:do_rootfs' % pn for pn in (d.getVar("EXTRA_IMAGES", True) or "").split())}"

sw_manifest_tools() {
    sw_manifest_table_header "Development Tools" "This table describes software which provides tools for the development host."

    opkg_dir=${IMAGE_ROOTFS}/.tools.control

    generate_sw_manifest_table $opkg_dir

    sw_manifest_table_footer
}

sw_manifest_rtos() {
    sw_manifest_table_header "Target Device Content" "This table describes software which provides sources and libraries for the target device."

    opkg_dir=${IMAGE_ROOTFS}/var/lib/opkg/info

    generate_sw_manifest_table $opkg_dir

    sw_manifest_table_footer
}

generate_sw_manifest() {
    sw_manifest_header
    sw_manifest_tools
    sw_manifest_rtos
    sw_manifest_footer
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
    for image in ${EXTRA_IMAGES}
    do
        tar -xf ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}
    done

    # Combine opkg info directories.
    cp -r ${IMAGE_ROOTFS}/.var/. ${IMAGE_ROOTFS}/var/
    rm -rf ${IMAGE_ROOTFS}/.var

    mkdir -p ${IMAGE_ROOTFS}/.tools.control
    for tool in ${EXTRA_TOOLS}
    do
        mkdir -p ${IMAGE_ROOTFS}/.tmp_${tool}/CONTROL
        cd ${IMAGE_ROOTFS}/.tmp_${tool}
        tool_ipk=`find ${DEPLOY_DIR} -name ${tool}_*`
        ar x ${tool_ipk}
        tar -C ${IMAGE_ROOTFS} -xf data.tar.gz
        tar -xf control.tar.gz
        cp control ${IMAGE_ROOTFS}/.tools.control/${tool}.control
        cd - > /dev/null
        rm -rf ${IMAGE_ROOTFS}/.tmp_${tool}
    done

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

    generate_sw_manifest

    mv ${SW_MANIFEST_FILE} ${IMAGE_ROOTFS}/${PROC_SDK_DIR_NAME}/docs
    mv ${SW_MANIFEST_TEXT} ${IMAGE_ROOTFS}/${PROC_SDK_DIR_NAME}/docs

    if [ -d ${IMAGE_ROOTFS}/component-sources ]
    then
        mv ${IMAGE_ROOTFS}/component-sources/* ${IMAGE_ROOTFS}/
        rmdir ${IMAGE_ROOTFS}/component-sources
    fi
}

TISDK_VERSION ?= "${SDK_VERSION}"

SW_MANIFEST_FILE = "${IMAGE_ROOTFS}/software_manifest.htm"
SW_MANIFEST_TEXT = "${IMAGE_ROOTFS}/software_manifest.txt"

IMAGE_FSTYPES = "tar.gz"

IMAGE_INSTALL ?= "packagegroup-arago-tisdk-rtos"

EXTRA_IMAGES ?= "ti-proc-sdk-image ti-pdk-image"
EXTRA_TOOLS ?= ""
