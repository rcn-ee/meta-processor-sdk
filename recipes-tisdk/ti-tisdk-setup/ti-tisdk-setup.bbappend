PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-setup-uboot-env-am335x-am437x-am57xx-update-for-late.patch \
    file://0002-setup-uboot-env-k2g-evm.sh-update-for-latest-default.patch \
    file://0001-create-sdcard-fit-create-SD-card-for-secure-platform.patch \
"

SDCARD_SCRIPT_am335x-hs-evm = " create-sdcard-fit.sh"
SDCARD_SCRIPT_am437x-hs-evm = " create-sdcard-fit.sh"
SDCARD_SCRIPT_am57xx-hs-evm = " create-sdcard-fit.sh"
SDCARD_SCRIPT_dra7xx-hs-evm = " create-sdcard-fit.sh"

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
}
