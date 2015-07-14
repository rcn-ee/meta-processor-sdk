
ECLIPSE_PLUGIN_EXTENSION_FILE = ".eclipseextension"
create_eclipse_plugin_extension() {
    mkdir -p "${D}${ECLIPSE_PLUGIN_DIR}"
    cat > "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_EXTENSION_FILE}" << EOF
id=org.eclipse.platform
name=Eclipse Platform
version=3.2.0
EOF
}


ECLIPSE_PLUGIN_FEATURE_DIR  = "features/${ECLIPSE_PLUGIN_RTSC}_${ECLIPSE_PLUGIN_VERSION}"
ECLIPSE_PLUGIN_FEATURE_FILE = "${ECLIPSE_PLUGIN_FEATURE_DIR}/feature.xml"
create_eclipse_plugin_feature() {
    mkdir -p "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_FEATURE_DIR}"

    cat > "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_FEATURE_FILE}" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<feature
      id="${ECLIPSE_PLUGIN_RTSC}_${ECLIPSE_PLUGIN_VERSION}"
      label="${ECLIPSE_PLUGIN_NAME}"
      version="${ECLIPSE_PLUGIN_VERSION}"
      provider-name="${ECLIPSE_PLUGIN_PROVIDER}">

   <description url="${ECLIPSE_PLUGIN_DESC_URL}">
      ${ECLIPSE_PLUGIN_NAME}
   </description>

   <copyright>
      ${ECLIPSE_PLUGIN_COPYRIGHT}
   </copyright>

   <license>
      Released under the Eclipse Public License 1.0 (http://www.eclipse.org/legal/epl-v10.html)
   </license>

   <plugin
        id="${ECLIPSE_PLUGIN_RTSC}.rtscRegistry_${ECLIPSE_PLUGIN_VERSION}"
        version="${ECLIPSE_PLUGIN_VERSION}"
        unpack="false" />

</feature>
EOF
}

ECLIPSE_PLUGIN_PLUGIN_DIR  = "plugins/${ECLIPSE_PLUGIN_RTSC}.rtscRegistry_${ECLIPSE_PLUGIN_VERSION}"
ECLIPSE_PLUGIN_PLUGIN_FILE = "${ECLIPSE_PLUGIN_PLUGIN_DIR}/plugin.xml"
create_eclipse_plugin_plugin() {
    mkdir -pv "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_PLUGIN_DIR}"

    cat > "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_PLUGIN_FILE}" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<?eclipse version="3.2"?>
<plugin
    name="${ECLIPSE_PLUGIN_NAME} ${ECLIPSE_PLUGIN_VERSION}"
    id="${ECLIPSE_PLUGIN_RTSC}.rtscRegistry_${ECLIPSE_PLUGIN_VERSION}"
    version="${ECLIPSE_PLUGIN_VERSION}"
    provider-name="${ECLIPSE_PLUGIN_PROVIDER}">
EOF

    if [ ! -z "${ECLIPSE_PLUGIN_CDOC}" ]
    then
        cat >> "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_PLUGIN_FILE}" << EOF
    <extension point="org.eclipse.help.toc">
        <toc file="toc_top.xml" primary="true"/>
        <toc file="toc_cdoc.xml"/>
    </extension>
EOF
    fi

    cat >> "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_PLUGIN_FILE}" << EOF
    <extension point="org.eclipse.help.contentProducer">
        <contentProducer>
            <producer class="org.eclipse.rtsc.xdctools.ui.help.HelpContentProducer"/>
        </contentProducer>
    </extension>

    <extension point="org.eclipse.rtsc.xdctools.ui.productInfo">
        <repository location="${ECLIPSE_PLUGIN_REPO}"/>
        <docs location="${ECLIPSE_PLUGIN_DOCS}"/>
        <info
            installLocation="${ECLIPSE_PLUGIN_ROOT}"
            productName="${ECLIPSE_PLUGIN_NAME}"
            versionNumber="${ECLIPSE_PLUGIN_VERSION}"
        />
    </extension>


    <extension point="org.eclipse.rtsc.xdctools.managedbuild.core.rtscProductTypes">
        <productType
            id="${ECLIPSE_PLUGIN_RTSC}"
            name="${ECLIPSE_PLUGIN_NAME}"
            folderPrefix="${ECLIPSE_PLUGIN_NAME}"
            rootMacroName="TI_PDK_INSTALL_DIR"/>
    </extension>

    <extension point="org.eclipse.rtsc.xdctools.managedbuild.core.rtscProducts">
        <product
            productTypeId="${ECLIPSE_PLUGIN_RTSC}"
            version="${ECLIPSE_PLUGIN_VERSION}"/>
    </extension>

</plugin>
EOF
}

ECLIPSE_PLUGIN_TOC_FILE = "${ECLIPSE_PLUGIN_PLUGIN_DIR}/toc_top.xml"
ECLIPSE_PLUGIN_CDOC_FILE = "${ECLIPSE_PLUGIN_PLUGIN_DIR}/toc_cdoc.xml"
create_eclipse_plugin_toc() {
    cat > "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_TOC_FILE}" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<?NLS TYPE="org.eclipse.help.toc"?>

<toc label="${ECLIPSE_PLUGIN_NAME} ${ECLIPSE_PLUGIN_VERSION}">
    <topic label="API Reference"><link toc="toc_cdoc.xml"/></topic>
</toc>
EOF

    cat > "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_CDOC_FILE}" << EOF
<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet type="text/xsl" href="toc.xsl"?>
<toc label="${ECLIPSE_PLUGIN_NAME}" topic="packages.html">
EOF

    for cdoc in ${ECLIPSE_PLUGIN_CDOC}
    do
        cat "${WORKDIR}/$cdoc" >> \
            "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_CDOC_FILE}"
    done

    cat >> "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_CDOC_FILE}" << EOF
</toc>
EOF
}

ECLIPSE_PLUGIN_MANIFEST_DIR  = "${ECLIPSE_PLUGIN_PLUGIN_DIR}/META-INF"
ECLIPSE_PLUGIN_MANIFEST_FILE = "${ECLIPSE_PLUGIN_MANIFEST_DIR}/MANIFEST.MF"
create_eclipse_plugin_manifest() {
    mkdir -p "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_MANIFEST_DIR}"

    cat > "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_MANIFEST_FILE}" << EOF
Manifest-Version: 1.0
Bundle-ManifestVersion: 2
Bundle-Name: ${ECLIPSE_PLUGIN_NAME} ${ECLIPSE_PLUGIN_VERSION}
Bundle-SymbolicName: ${ECLIPSE_PLUGIN_RTSC}.rtscRegistry_${ECLIPSE_PLUGIN_VERSION};singleton:=true
Bundle-Version: ${ECLIPSE_PLUGIN_VERSION}
Bundle-Activator: org.eclipse.rtsc.xdctools.ui.CCSActivator
Bundle-Vendor: ${ECLIPSE_PLUGIN_PROVIDER}
Require-Bundle: org.eclipse.ui,
 org.eclipse.core.runtime,
 org.eclipse.help,
 org.eclipse.rtsc.xdctools.ui
Eclipse-LazyStart: true
EOF
}

create_eclipse_plugin() {
    create_eclipse_plugin_extension
    create_eclipse_plugin_feature
    create_eclipse_plugin_plugin

    if [ ! -z "${ECLIPSE_PLUGIN_CDOC}" ]
    then
        create_eclipse_plugin_toc
    fi

    create_eclipse_plugin_manifest
}

do_install_append() {
    bbwarn "CDOC = \"${ECLIPSE_PLUGIN_CDOC}\""
    bbwarn "SRC_URI = \"${SRC_URI}\""
    create_eclipse_plugin
}

def string_set(iterable):
    return ' '.join(set(iterable))

SRC_URI_append = "${@string_set('file://%s' %cdoc for cdoc in (d.getVar("ECLIPSE_PLUGIN_CDOC", True) or "").split())}"

FILES_${PN} = "${ECLIPSE_PLUGIN_DIR}"
