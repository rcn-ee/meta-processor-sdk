inherit rootfs_ipk
inherit image_types

require recipes-ti/includes/ti-paths-append.inc

DEPENDS += "ti-ccsv6-native"

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

#do_rootfs[nostamp] = "1"
do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
do_rootfs[cleandirs] += "${S}"


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


# Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs functionality
# to install a given list of packages using opkg.
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
    local cwd=`pwd`

    cd ${IMAGE_ROOTFS}${PDK_INSTALL_DIR_RECIPE}
    ccs_detect

    # need to make sure project dir is empty.
    mkdir -p ${TI_PDK_PROJECT_DIR}
    rm -rf ${TI_PDK_PROJECT_DIR}/*
    rm -rf ${TI_PDK_PROJECT_DIR}/.metadata

    for project in `find -iname "*project.txt"`
    do
        create_ccs_project "${project}"
    done

    cd $cwd

    mv ${IMAGE_ROOTFS}${PDK_INSTALL_DIR_RECIPE} ${IMAGE_ROOTFS}/pdk_${MACHINE}_${TI_PDK_VERSION}
}

tisdk_image_cleanup () {
    # Move the var/etc directories which contains the opkg data used for the
    # manifest (and maybe one day for online updates) to a hidden directory.
    rm -rf ${IMAGE_ROOTFS}/var
    rm -rf ${IMAGE_ROOTFS}/etc
    rm -rf ${IMAGE_ROOTFS}/lib
    rm -rf ${IMAGE_ROOTFS}/usr
}

license_create_manifest() {
    :
}

EXPORT_FUNCTIONS do_rootfs
addtask rootfs before do_build after do_install

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

export IMAGE_BASENAME = "ti-pdk-image"

TI_PDK_VERSION = "8_00_00_00"

IMAGE_FSTYPES = "tar.gz"

IMAGE_INSTALL = "packagegroup-arago-tisdk-pdk"
