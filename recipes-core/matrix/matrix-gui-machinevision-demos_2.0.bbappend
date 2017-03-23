PR_append = ".tisdk1"

SRCREV = "7ab39e827e65c35f4e37d1142a45071f670395fe"

PACKAGES += "matrix-machinevision-demo-simplepeopletracking"

RDEPENDS_matrix-machinevision-demo-simplepeopletracking = " \
    ${MACHINEVISION_RDEPENDS} \
    voxelsdk \
"

FILES_matrix-machinevision-demo-simplepeopletracking   = "${MATRIX_APP_DIR}/machinevision_simple_people_tracking/*"
FILES_matrix-machinevision-demo-simplepeopletracking   += "${bindir}/runSimplePeopleTracking.sh"
