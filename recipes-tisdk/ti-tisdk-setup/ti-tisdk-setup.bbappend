PR_append = ".tisdk7"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRCREV = "3fac15de5205e4d05d3473276037157b0702c78c"

SRC_URI_append = " \
    file://0001-create-sdcard-fit-create-SD-card-for-secure-platform.patch \
    file://0001-setup-add-support-for-HS-EVMs.patch \
    file://0003-create_sdcard-omapl138-add-custom-script-to-create-S.patch \
"

SDCARD_SCRIPT_am335x-hs-evm = " create-sdcard-fit.sh"
SDCARD_SCRIPT_am437x-hs-evm = " create-sdcard-fit.sh"
SDCARD_SCRIPT_am57xx-hs-evm = " create-sdcard-fit.sh"
SDCARD_SCRIPT_dra7xx-hs-evm = " create-sdcard-fit.sh"
SDCARD_SCRIPT_omapl138 = " create-sdcard-omapl138.sh"

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
