PR_append = ".tisdk0"

SRCREV = "f324ef86f0f2283709d1625ca26e694a71480a02"

PACKAGES += "matrix-machinevision-demo-simplepeopletracking"

RDEPENDS_matrix-machinevision-demo-simplepeopletracking = " \
    ${MACHINEVISION_RDEPENDS} \
    voxelsdk \
"

FILES_matrix-machinevision-demo-simplepeopletracking   = "${MATRIX_APP_DIR}/machinevision_simple_people_tracking/*"
FILES_matrix-machinevision-demo-simplepeopletracking   += "${bindir}/runSimplePeopleTracking.sh"
