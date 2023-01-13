SRC_URI = "git://github.com/CESNET/libnetconf2.git;protocol=https;branch=devel"

PV = "2.1.23+git${SRCPV}"
SRCREV = "9b7f03e050f38866275772de62c0b7a305e71268"

DEPENDS = "libssh openssl libyang virtual/crypt libpam"
