PR_append = ".tisdk0"

do_configure_prepend() {
    # Boost python libraries also use minor version in suffix
    sed -i -e 's|Boost REQUIRED\(.*\)python3|Boost REQUIRED\1python${PYTHON_VERSION_MAJOR}${PYTHON_VERSION_MINOR}|' \
        ${S}/CMakeLists.txt
}
