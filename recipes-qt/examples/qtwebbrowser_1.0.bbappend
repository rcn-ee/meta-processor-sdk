PR_append = ".tisdk0"

CXXFLAGS_append = " -I${STAGING_DIR_HOST}/usr/local/XSGX/include"
LDFLAGS_append = " -L${STAGING_DIR_HOST}/usr/local/XSGX/lib -Wl,-rpath-link,${STAGING_DIR_HOST}/usr/local/XSGX/lib"
