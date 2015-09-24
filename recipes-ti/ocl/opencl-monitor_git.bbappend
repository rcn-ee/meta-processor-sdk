PR_append = ".tisdk0"

do_install_append_dra7xx() {
    mv ${D}/lib/firmware/dra7-dsp1-fw.xe66 \
       ${D}/lib/firmware/dra7-dsp1-fw.xe66.ocl

    mv ${D}/lib/firmware/dra7-dsp2-fw.xe66 \
       ${D}/lib/firmware/dra7-dsp2-fw.xe66.ocl

    ln -s dra7-dsp1-fw.xe66.ocl \
          ${D}/lib/firmware/dra7-dsp1-fw.xe66

    ln -s dra7-dsp2-fw.xe66.ocl \
          ${D}/lib/firmware/dra7-dsp2-fw.xe66
}
