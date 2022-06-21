PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-FPD-Link-III-and-IMX390-support.patch \
    file://0001-HACK-dt-bindings-misc-Add-ti-dma_buf_phys-bindig-doc.patch \
    file://0002-HACK-misc-Add-dma-buf-to-physical-address-exporter.patch \
"
