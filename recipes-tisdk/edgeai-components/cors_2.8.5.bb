SUMMARY = "Node.js CORS middleware"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=947eb5e695dade432a500b12c510de85 \
                    file://node_modules/vary/LICENSE;md5=13babc4f212ce635d68da544339c962b \
                    file://node_modules/object-assign/license;md5=a12ebca0510a773644101a99a867d210 \
                    file://package.json;md5=c369e9fe8250b830e467361b042794bb \
                    file://node_modules/object-assign/package.json;md5=2854c33ba575a9ebc613d1a617ece277 \
                    file://node_modules/vary/package.json;md5=3577fc17c1b964af7cfe2c17c73f84f3"

SRC_URI = " \
    npm://registry.npmjs.org/;name=cors;version=${PV};package=cors \
    npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
    "

S = "${WORKDIR}/npm"

inherit npm

LICENSE_${PN} = "MIT"
LICENSE_${PN}-object-assign = "MIT"
LICENSE_${PN}-vary = "MIT"
