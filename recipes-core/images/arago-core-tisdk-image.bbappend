PR_append = ".tisdk3"

DTB_FILTER_k2hk-evm = "k2hk"
DTB_FILTER_k2e-evm = "k2e"
DTB_FILTER_k2l-evm = "k2l"

SW_MANIFEST_QT5_FOOTER = "Any Qt package referenced in this manifest that has LGPL 2.1 or LGPL 3 as a licensing option is only being used and distributed by TI under LGPL 2.1. The choice of having both, as reflected in the manifest table, comes from the licensing line the corresponding recipe. TI has opted to only use LGPL 2.1."

SW_MANIFEST_FOOTER = "\
${@base_conditional('QT_PROVIDER', 'qt5', '${SW_MANIFEST_QT5_FOOTER}', '', d)}\
"

sw_manifest_table_footer() {
cat >> ${SW_MANIFEST_FILE} << EOF
<p>
${SW_MANIFEST_FOOTER}
</p>
EOF

cat >> ${SW_MANIFEST_TEXT} << EOF
<Footnotes>
${SW_MANIFEST_FOOTER}
</footnotes>
</table>
EOF
}


tisdk_image_build_append () {
    for u in ${DEPLOY_DIR_IMAGE}/u-boot*-${MACHINE}.gph
    do
        if [ -e $u ]
        then
            cp $u ${prebuilt_dir}/
        fi
    done

    for s in ${DEPLOY_DIR_IMAGE}/skern-*.bin
    do
        if [ -e $s ]
        then
            cp $s ${prebuilt_dir}/
        fi
    done

    for fw in ${DEPLOY_DIR_IMAGE}/pmmc-firmware*.bin
    do
        if [ -e $fw ]
        then
            cp $fw ${prebuilt_dir}/
        fi
    done
}
