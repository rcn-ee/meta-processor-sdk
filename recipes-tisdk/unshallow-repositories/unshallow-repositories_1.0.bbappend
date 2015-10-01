PR_append = ".tisdk0"

do_install_append() {
    sed -i -e "s|i\*|${SDKMACHINE}*|g" \
        ${D}/bin/unshallow-repositories.sh
}
