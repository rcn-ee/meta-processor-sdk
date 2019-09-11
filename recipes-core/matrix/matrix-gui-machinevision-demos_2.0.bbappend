PR_append = ".tisdk0"

RDEPENDS_matrix-machinevision-demo-dlp3dscanner_remove_dra7xx = " \
    ${@bb.utils.contains('MACHINE_FEATURES','gpu','point-cloud-viewer','',d)} \
"
