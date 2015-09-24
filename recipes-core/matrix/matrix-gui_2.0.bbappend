PR_append = ".tisdk0"

do_install_append() {
    cd ${D}
    for f in $(find -type l)
    do
        cp --remove-destination $(readlink $f) $f
    done
}
