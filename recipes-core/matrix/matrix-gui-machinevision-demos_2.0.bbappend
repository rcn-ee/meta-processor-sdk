PR_append = ".tisdk0"

SRCREV = "7dd57f12692213dfb08664fa7101792bdeb7a16b"

PACKAGES += "matrix-machinevision-demo-barcoderoi \
             matrix-machinevision-demo-barcoderoi-f2f \
            "

RDEPENDS_matrix-machinevision-demo-barcoderoi = " \
    ${MACHINEVISION_RDEPENDS} \
    barcode-roi \
"

RDEPENDS_matrix-machinevision-demo-barcoderoi-f2f = " \
    ${MACHINEVISION_RDEPENDS} \
    barcode-roi \
"

FILES_matrix-machinevision-demo-barcoderoi    = "${MATRIX_APP_DIR}/machinevision_barcode_roi/*"
FILES_matrix-machinevision-demo-barcoderoi   += "${bindir}/runBarcodeRoi.sh"
FILES_matrix-machinevision-demo-barcoderoi-f2f = "${MATRIX_APP_DIR}/machinevision_barcode_roi_f2f/*"
FILES_matrix-machinevision-demo-barcoderoi-f2f += "${bindir}/runBarcodeRoiSave2File.sh"

RDEPENDS_matrix-machinevision-demo-dlp3dscanner = "${MACHINEVISION_RDEPENDS}"
RDEPENDS_matrix-machinevision-demo-dlp3dscanner_dra7xx = "${MACHINEVISION_RDEPENDS} point-cloud-viewer"
