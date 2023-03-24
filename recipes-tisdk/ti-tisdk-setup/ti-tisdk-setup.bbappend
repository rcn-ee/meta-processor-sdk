PR_append = ".tisdk21"

FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = " \
    file://0001-setup-uboot-env-am65x-Adding-sudo-permissions.patch \
    file://0001-TFTP-Fixing-tftp-setup-script.patch \
    file://0001-create-sdcard.sh-Copy-all-sysfw-itb-binaries-to-boot.patch \
"

SRCREV = "2d6d6dfeac3b6e0e5a72513b61ab888a1a1a2bac"

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
