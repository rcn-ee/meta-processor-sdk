PR_append = ".tisdk0"

PV = "1.0.1.0"

COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"

DEVICE_NAME_append_ti33x = "am33xx"
DEVICE_NAME_append_ti43x = "am43xx"

UIO_TEST_PRUSS_GIT_URI = "git://git.ti.com/processor-sdk/uio-test-pruss.git"
UIO_TEST_PRUSS_GIT_PROTOCOL = "git"
SRC_URI = "${UIO_TEST_PRUSS_GIT_URI};protocol=${UIO_TEST_PRUSS_GIT_PROTOCOL};branch=${BRANCH}"

# Corresponds to version 01.00.01.00
UIO_TEST_PRUSS_SRCREV = "72f7454c2460bd7d52dab70631b38bf5d3585542"

SRCREV = "${UIO_TEST_PRUSS_SRCREV}"
