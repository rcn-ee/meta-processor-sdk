PR_append = ".tisdk4"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-setup-uboot-env-am335x-am437x-am57xx-update-for-late.patch \
    file://0002-setup-uboot-env-k2g-evm.sh-update-for-latest-default.patch \
    file://0001-create-sdcard-fit-create-SD-card-for-secure-platform.patch \
    file://0001-setup-uboot-env-keystone.sh-add-prompt_feedback-func.patch \
    file://0002-setup-uboot-env-keystone.sh-enhance-do_expect-functi.patch \
    file://0003-setup-uboot-env-keystone.sh-add-detection-of-BMC-por.patch \
    file://0004-setup-uboot-env-keystone.sh-make-updating-ubifs-an-i.patch \
    file://0005-setup-uboot-env-keystone.sh-create-minicom-script-to.patch \
    file://0006-add-to-group-require-user-to-logout-for-group-change.patch \
    file://0007-setup-package-install-Add-screen-and-lrzsz-packages.patch \
    file://0008-setup-uboot-env-keystone-use-UART-boot-to-boot-lates.patch \
    file://0001-setup-add-support-for-HS-EVMs.patch \
"

SDCARD_SCRIPT_am335x-hs-evm = " create-sdcard-fit.sh"
SDCARD_SCRIPT_am437x-hs-evm = " create-sdcard-fit.sh"
SDCARD_SCRIPT_am57xx-hs-evm = " create-sdcard-fit.sh"
SDCARD_SCRIPT_dra7xx-hs-evm = " create-sdcard-fit.sh"

SETUP_SCRIPTS_remove = "setup-tftp.sh"

SETUP_TFTP = "setup-tftp.sh"
SETUP_TFTP_am335x-hs-evm = "setup-tftp-fit.sh"
SETUP_TFTP_am437x-hs-evm = "setup-tftp-fit.sh"
SETUP_TFTP_am57xx-hs-evm = "setup-tftp-fit.sh"
SETUP_TFTP_k2e-hs-evm = "setup-tftp-fit.sh"

UBOOT_ENV_am335x-hs-evm = "setup-uboot-env-am335x-hs.sh"
UBOOT_ENV_am437x-hs-evm = "setup-uboot-env-am43x-hs.sh"
UBOOT_ENV_am57xx-hs-evm = "setup-uboot-env-am57xx-hs-evm.sh"
UBOOT_ENV_k2e-hs-evm = "setup-uboot-env-keystone-hs.sh"

do_install_append() {
    if [ -n "${SDCARD_SCRIPT}" ]
    then
        # Remove spaces
        script=$(echo "${SDCARD_SCRIPT}" | sed -e 's|^ *||' -e 's| *$||')

        if [ "${script}" != "create-sdcard.sh" ]
        then
            mv "${D}/bin/${script}" "${D}/bin/create-sdcard.sh"
        fi
    fi

    install -m 0755 ${S}/${SETUP_TFTP} ${D}/bin/setup-tftp.sh
}
