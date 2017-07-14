require recipes-bsp/pa-lld/pa-lld.inc

PR = "${INC_PR}.4"

do_compile() {
    :
}

do_install() {
    local pa_fw_dir

    case "${LIBPA}" in
        "libpa")
            pa_fw_dir="${S}/fw/v0"
            ;;
        "libpa2")
            pa_fw_dir="${S}/fw/v1"
            ;;
        *)
            echo "Error: ${LIBPA} does not have a fw directory!"
            return 1
    esac

    install -d "${D}${base_libdir}/firmware"
    for fw in $(find "${pa_fw_dir}" -name '*.bin')
    do
        install -m 0644 "${fw}" "${D}${base_libdir}/firmware"
    done
}

FILES_${PN} = "${base_libdir}/firmware"
