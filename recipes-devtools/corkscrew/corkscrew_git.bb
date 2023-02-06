PR_append = ".tisdk0"

SUMMARY = "SSH tunnelling through HTTP proxies"
HOMEPAGE = "https://github.com/bryanpkc/corkscrew"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"

SRC_URI = "git://github.com/bryanpkc/corkscrew.git"
SRCREV = "e351bdaa911b102094e8c9c50e7fafcf4e660a47"

S = "${WORKDIR}/git"

inherit autotools
