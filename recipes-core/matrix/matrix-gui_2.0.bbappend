PR_append = ".tisdk1"

SRCREV = "621bab39c23ea476ec0b31a7baf86c1bd4f24ec4"

do_install_append() {
    cd ${D}
    for f in $(find -type l)
    do
        cp --remove-destination $(readlink $f) $f
    done
}
