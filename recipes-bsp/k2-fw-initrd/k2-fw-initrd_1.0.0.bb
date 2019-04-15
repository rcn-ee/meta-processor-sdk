DESCRIPTION = "Keystone2 initramfs with SerDes, QMSS and NETCP PA firmware"

LICENSE = "TI-TFL"
PACKAGES = "${PN}"

PR = "r2"

COMPATIBLE_MACHINE = "keystone"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit rootfs_${IMAGE_PKGTYPE}

PACKAGE_INSTALL = " \
    netcp-pa-fw \
    serdes-fw \
    qmss-pdsp-fw \
"

# netcp-pa-fw is not compatible with k2g-evm
PACKAGE_INSTALL_remove_k2g-evm = "netcp-pa-fw"


export IMAGE_BASENAME = "k2-fw-initrd"
export IMAGE_NAME = "${IMAGE_BASENAME}"
export IMAGE_NAME_SUFFIX = "-${MACHINE}"

IMGDEPLOYDIR = "${WORKDIR}/deploy-${PN}-image-complete"

USE_DEVFS = "1"

# adjust task dependencies
#
# Note: This is a hack.
#
#       The problem is that we wish to create an image of these firmwares for an
#       initramfs, however, we require this in the filesystem as it is required
#       for booting. Therefore we require this image to be in a package so that
#       it may be installed in a filesystem. OE does not seem to allow creating
#       a package of an image: an image is constructed of package, not the other
#       way around. Ultimately the problem is that 'recrdeptasks' will also add
#       the task of the current recipe, and thus create an unresolvable,
#       circular dependency. Thus here we must manually add dependencies of this
#       recipe's image task on the package_write task of all dependencies. A bad
#       side effect of this is that we cannot use meta-packages, such as
#       packagegroups, as dependencies. An alternative would be to use the
#       dependent recipe's do_build task, but that just seems worse.
#
python () {
    pkgtype = (d.getVar("IMAGE_PKGTYPE", True) or "")

    package_write_task = 'do_package_write_%s' % pkgtype

    # Remove "do_package_write_*" from recrdeps as that will pull in the
    #  dependency on this recipe's packaging.
    flags = d.getVarFlag('do_rootfs', 'recrdeptask', True)
    flags = flags.replace(package_write_task, "")
    d.setVarFlag('do_rootfs', 'recrdeptask', flags)

    # Add depends on PACKAGE_INSTALL do_package_write_*
    for p in (d.getVar("PACKAGE_INSTALL", True) or "").split():
        flags = d.appendVarFlag('do_rootfs', 'depends', ' %s:%s' % (p, package_write_task))
}

# Do the minimal to create a rootfs
fakeroot python do_rootfs () {
    from oe.rootfs import create_rootfs
    from oe.manifest import create_manifest

    # Generate the initial manifest
    create_manifest(d)

    # Generate rootfs
    create_rootfs(d)
}
do_rootfs[dirs] = "${TOPDIR}"
do_rootfs[cleandirs] += "${S} ${IMGDEPLOYDIR}"
do_rootfs[umask] = "022"
addtask rootfs before do_install

# Create the cpio.gz image
do_image() {
    cd ${IMAGE_ROOTFS}

    # Only capture the firmwares
    (echo .; echo ./lib; find ./lib/firmware; ) | cpio -o -H newc >${image_base_path}.cpio
    gzip -f -9 -c ${image_base_path}.cpio > ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio.gz
    ln -s ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio.gz ${IMGDEPLOYDIR}/${IMAGE_NAME}.cpio.gz
}
do_image[dirs] = "${TOPDIR}"
do_image[umask] = "022"
addtask do_image after do_rootfs before do_install

do_image_complete() {
    :
}

SSTATETASKS += "do_image_complete"
SSTATE_SKIP_CREATION_task-image-complete = '1'
do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
do_image_complete[stamp-extra-info] = "${MACHINE_ARCH}"
addtask do_image_complete after do_image before do_build
python do_image_complete_setscene () {
    sstate_setscene(d)
}
addtask do_image_complete_setscene

# Now install this image for packaging
do_install() {
    local image_base_path="${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}"

    install -d ${D}/boot
    install -m 0644 ${image_base_path}.cpio.gz ${D}/boot/${IMAGE_BASENAME}.cpio.gz
}

FILES_${PN} = "/boot"

do_fetch[noexec] = "1"
do_unpack[noexec] = "1"
do_patch[noexec] = "1"
do_configure[noexec] = "1"
do_compile[noexec] = "1"
