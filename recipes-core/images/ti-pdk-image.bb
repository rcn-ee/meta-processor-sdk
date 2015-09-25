inherit tisdk-image

TARGET_IMAGES = " "
TISDK_TOOLCHAIN = " "

USE_DEVFS = "1"

require recipes-ti/includes/ti-paths-append.inc

DEPENDS += "ti-ccsv6-native"

TI_PDK_PROJECT_DIR ?= "${IMAGE_ROOTFS}${PDK_INSTALL_DIR_RECIPE}/packages/exampleProjects"

TI_PDK_PLATFORMS = ""
TI_PDK_PLATFORMS_append_omap-a15 = "AM571x AM572x"


TI_PDK_CCS_DEVICE_C66 = "com.ti.ccstudio.deviceModel.C6000.GenericC66xxDevice"
#TI_PDK_CCS_DEVICE_A15 = "Cortex A.AM572x"
TI_PDK_CCS_DEVICE_A15 = "com.ti.ccstudio.deviceModel.TMS470.GenericCortexA15Device"

TI_PDK_CCS_TARGET_C66 = "ti.targets.elf.C66"
TI_PDK_CCS_TARGET_A15 = "gnu.targets.arm.A15F"

TI_PDK_CCS_PLATFORM_AM572x = "ti.platforms.evmAM572X"
TI_PDK_CCS_PLATFORM_AM571x = "ti.platforms.evmAM571X"

ccs_detect() {
    cd ${CCSv6_INSTALL_DIR}/eclipse
    ./eclipse -nosplash -data ${WORKDIR}/ccs_workspace \
        -application com.ti.common.core.initialize \
        -rtsc.allowLegacyProducts \
        -rtsc.productDiscoveryPath "${STAGING_DIR_TARGET}${installdir}"

    ./eclipse -nosplash -data ${WORKDIR}/ccs_workspace \
        -application com.ti.common.core.initialize \
        -rtsc.allowLegacyProducts \
        -rtsc.productDiscoveryPath "${STAGING_DIR_NATIVE}${installdir}"

    cd - > /dev/null
}

create_ccs_project() {
    local cwd=`pwd`

    project_path="${1%/*}"
    project_text="${1##*/}"
    project_name="${project_text%.*}"

    cd ${project_path}

    # Get CCS Device from project file name
    project_cc_opts=`grep 'setCompilerOptions' "${project_text}"`

    project_soc=`echo "${project_cc_opts}" | sed -e 's|.*SOC_\([a-zA-Z0-9]*\).*|\1|g' -e 's|.*DEVICE_\([a-zA-Z0-9]*\).*|\1|g'`
    if ! echo "${TI_PDK_PLATFORMS}" | grep "${project_soc}" > /dev/null
    then
        # Not supported for the MACHINE
        cd $cwd
        return 0
    fi

    case ${project_soc} in
        AM572x)
            project_platform="${TI_PDK_CCS_PLATFORM_AM572x}"
            ;;
        AM571x)
            project_platform="${TI_PDK_CCS_PLATFORM_AM571x}"
            ;;
    esac

    if echo "${project_cc_opts}" | grep -- "-mv6600" > /dev/null
    then
        project_device="${TI_PDK_CCS_DEVICE_C66}"
        project_target="${TI_PDK_CCS_TARGET_C66}"
    else
        project_device="${TI_PDK_CCS_DEVICE_A15}"
        project_target="${TI_PDK_CCS_TARGET_A15}"
    fi

    ${CCSv6_INSTALL_DIR}/eclipse/ccstudio -nosplash \
        -data "${TI_PDK_PROJECT_DIR}" \
        -application com.ti.ccstudio.apps.projectCreate \
        -ccs.name "${project_name}" \
        -ccs.outputFormat ELF \
        -ccs.device "${project_device}" \
        -ccs.endianess "little" \
        -ccs.kind executable \
        -rtsc.enableBios \
        -rtsc.buildProfile "debug" \
        -rtsc.platform "${project_platform}" \
        -rtsc.target "${project_target}" \
        -ccs.rts "libc.a" \
        -ccs.args "${project_text}"

    cp ${IMAGE_ROOTFS}${PDK_INSTALL_DIR_RECIPE}/packages/macros.ini \
       ${TI_PDK_PROJECT_DIR}/${project_name}

    cd $cwd
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

    # WORKAROUND: Disable pre-built CCS project creation until it can be
    # properly implemented using pdkProjectCreate script

    #local cwd=`pwd`

    #cd ${IMAGE_ROOTFS}${PDK_INSTALL_DIR_RECIPE}
    #ccs_detect

    # need to make sure project dir is empty.
    #mkdir -p ${TI_PDK_PROJECT_DIR}
    #rm -rf ${TI_PDK_PROJECT_DIR}/*
    #rm -rf ${TI_PDK_PROJECT_DIR}/.metadata

    #for project in `find -iname "*project.txt"`
    #do
    #    create_ccs_project "${project}"
    #done

    #cd $cwd

    mv ${IMAGE_ROOTFS}${PDK_INSTALL_DIR_RECIPE} ${IMAGE_ROOTFS}/${TI_PDK_NAME}_${TI_PDK_VERSION}
}

tisdk_image_cleanup_append () {
    # Move the var/etc directories which contains the opkg data used for the
    # manifest (and maybe one day for online updates) to a hidden directory.
    rm -rf ${IMAGE_ROOTFS}/usr
}

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

export IMAGE_BASENAME = "ti-pdk-image"

TI_PDK_NAME ?= "pdk_${@'${MACHINE}'.replace('-evm','')}"
TI_PDK_NAME_omap-a15 = "pdk_am57xx"

TI_PDK_VERSION = "1_0_0"

IMAGE_FSTYPES = "tar.gz"

IMAGE_INSTALL = "packagegroup-arago-tisdk-pdk"
