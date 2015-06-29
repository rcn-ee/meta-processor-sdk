PR_append = ".tisdk1"

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
