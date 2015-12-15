PR_append = ".tisdk0"

IMAGE_INSTALL_append_keystone = " \
    packagegroup-arago-test \
    packagegroup-arago-test-addons \
"

BAD_RECOMMENDATIONS += " \
    boost-dev \
"
