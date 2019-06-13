PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://cv_bridge-disable-cfg_extras.patch"

do_configure_prepend() {
    # Boost python libraries also use minor version in suffix
    sed -i -e 's|Boost REQUIRED\(.*\)python3|Boost REQUIRED\1python${PYTHON_VERSION_MAJOR}${PYTHON_VERSION_MINOR}|' \
        ${S}/CMakeLists.txt
}
