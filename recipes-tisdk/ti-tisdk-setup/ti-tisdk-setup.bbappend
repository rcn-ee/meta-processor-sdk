PR_append = ".tisdk19"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-setup-add-support-for-HS-EVMs.patch \
    file://0003-create_sdcard-omapl138-add-custom-script-to-create-S.patch \
    file://0004-setup-tftp-fit-copy-firmwares-for-k2g-hs.patch \
    file://0005-setup-uboot-env-k2g-hs-add-k2g-hs-support.patch \
    file://0006-setup-uboot-env-keystone-hs-use-default-env-for-net-.patch \
    file://0007-setup-uboot-env-hs-use-fitImage-w-o-ramfs.patch \
    file://0008-setup-uboot-env-am-hs-add-support-for-rootfs-over-NF.patch \
    file://0009-setup-uboot-env-am18x-bring-up-to-par-with-other-ubo.patch \
    file://0013-create-sdcard-Install-wificfg-file-in-boot-partition.patch \
    file://0014-setup-targetfs-nfs-Modify-script-to-search-for-tisdk.patch \
"

SRC_URI_append_am64xx-evm = " \
    file://0014-setup-host-check-Modify-script-to-support-only-Ubunu.patch\
"

SDCARD_SCRIPT_omapl138 = " create-sdcard-omapl138.sh"

SETUP_SCRIPTS_remove = "setup-tftp.sh"

SETUP_TFTP = "setup-tftp.sh"
SETUP_TFTP_am335x-hs-evm = "setup-tftp-fit.sh"
SETUP_TFTP_am437x-hs-evm = "setup-tftp-fit.sh"
SETUP_TFTP_am57xx-hs-evm = "setup-tftp-fit.sh"
SETUP_TFTP_k2e-hs-evm = "setup-tftp-fit.sh"
SETUP_TFTP_k2l-hs-evm = "setup-tftp-fit.sh"
SETUP_TFTP_k2g-hs-evm = "setup-tftp-fit.sh"
SETUP_TFTP_k2hk-hs-evm = "setup-tftp-fit.sh"

UBOOT_ENV_am335x-hs-evm = "setup-uboot-env-am335x-hs.sh"
UBOOT_ENV_am437x-hs-evm = "setup-uboot-env-am43x-hs.sh"
UBOOT_ENV_am57xx-hs-evm = "setup-uboot-env-am57xx-hs-evm.sh"
UBOOT_ENV_k2e-hs-evm = "setup-uboot-env-keystone-hs.sh"
UBOOT_ENV_k2l-hs-evm = "setup-uboot-env-keystone-hs.sh"
UBOOT_ENV_k2hk-hs-evm = "setup-uboot-env-keystone-hs.sh"
UBOOT_ENV_k2g-hs-evm = "setup-uboot-env-k2g-hs-evm.sh"

do_install_append() {
    if [ -n "${SDCARD_SCRIPT}" ]
    then
        # Remove spaces
        script=$(echo "${SDCARD_SCRIPT}" | sed -e 's|^ *||' -e 's| *$||')

        if [ "${script##*/}" != "create-sdcard.sh" ]
        then
            mv "${D}/bin/${script##*/}" "${D}/bin/create-sdcard.sh"
        fi
    fi

    install -m 0755 ${S}/${SETUP_TFTP} ${D}/bin/setup-tftp.sh

    if [ -z "${MKUBIFS_ARGS}" -o -z "${UBINIZE_ARGS}" ]
    then
        # UBIFS not supported
        rm -f "${D}/bin/create-ubifs.sh"
    fi
}
