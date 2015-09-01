require recipes-ti/ipc/ti-ipc-rtos.inc

PV = "3_40_00_06"
PR = "r0"

LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"

SRC_URI[ipczip.md5sum] = "866322f0a7c73c415bf1eebfda7c9aba"
SRC_URI[ipczip.sha256sum] = "b0be9eb0acc5a8d8474b3db1583390a9b828e8ded7292e73db4da7d2b0884356"
