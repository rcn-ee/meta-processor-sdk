# Use the recipe-data class to collect SRC_URI for the manifest.
#
# While this will need to be globally INHERIT'd to work properly, inherit
# locally so that parsing does not fail.
inherit recipe-data

# Instead of re-adding the do_rootfs task, re-add the do_emit_recipe_data_all
#  task to run before do_rootfs.
deltask do_emit_recipe_data_all

# There seems to be something special with the rootfs task and task dependencies
# are not working as expected, so use the install task instead.
addtask emit_recipe_data_all after do_emit_recipe_data before do_install

get_sources_from_recipe(){
    [ ! -z "$1" ] || return 0

    pn=$(echo "$1" | sed -e 's|_.*$||')

    recipe_data_get_var_sh "$pn" "SRC_URI"
}

# This function expects to be passed the following parameter
#   - The location to the opkg info directory containing the control files
#     of the installed packages
# Optionally if the second parameter is set to true then only GPLv3 contents
# will be listed.  This is for TI SW Manifests where GPLv3 content is
# highlighted as a separate table.
generate_sw_manifest_table() {
    control_dir="$1"
    gplv3_only="$2"

    # Call this here so that the function gets added to the task script
    get_sources_from_recipe

    if [ ! -d "$control_dir" ]
    then
        echo "Could not find the control directory ($control_dir)"
        return 1
    fi

    if [ "$gplv3_only" == "" ]
    then
        # The second parameter was not passed so set to false
        gplv3_only="false"
    fi

echo "
<table border=1 cellspacing=1 cellpadding=1 width=80%>
<tr bgcolor=#c0c0c0  color=white>
    <td><b>Software Name</b></td>
    <td><b>Version</b></td>
    <td><b>License</b></td>
    <td><b>Location</b></td>
    <td><b>Delivered As</b></td>
    <td><b>Modified by TI</b></td>
    <td><b>Obtained from</b></td>
</tr>
" >> ${SW_MANIFEST_FILE}

cat >> ${SW_MANIFEST_TEXT} << EOF
<tbody>
<!-- Software Name
| Version
| License Type
| Delivered As
| Modified by TI
| Location
| Obtained from -->

EOF

    control_files_there=0
    for possible_control_file in $control_dir/*.control
    do
        if [ -f $possible_control_file ]
        then
            control_files_there=1
            break
        fi
    done

    if [ $control_files_there -eq 0 ]
    then
        for pkg_idx in $control_dir/oe*; do
            package_start=`grep -n "^Package" $pkg_idx || true`

            IFS_OLD=${IFS}
            IFS="
"

            begin=""
            end=""
            for pkg in ${package_start}; do
                end=`echo $pkg | cut -d: -f1`

                if [ -z $begin ]; then
                    pkg_name=`echo $pkg | cut -d: -f3`
                    begin=`echo $pkg | cut -d: -f1`
                    continue
                fi
                cnt=$[$cnt+1]
                head -n $[$end - 1] $pkg_idx | tail -n $[$end - $begin] > ${control_dir}/${pkg_name// /}.control

                pkg_name=`echo $pkg | cut -d: -f3`
                begin=$end
            done
            if [ ! -z $end ]; then
                end=`wc -l $pkg_idx | awk '{ print $1 }'`
                end=$[$end + 1]
                tail -n $[$end - $begin] $pkg_idx > ${control_dir}/${pkg_name// /}.control
            fi

            IFS=${IFS_OLD}
        done
    fi

    for i in $control_dir/*.control
    do
        package="`cat $i | grep Package: | awk {'print $2'}`"
        version="`cat $i | grep Version: | awk {'print $2'} | cut -f1-2 -d-`"
        long_version="`cat $i | grep Version: | awk {'print $2'}`"
        license="`cat $i | grep License: | cut -d: -f2 `"
        architecture="`cat $i | grep Architecture: | awk {'print $2'}`"
        recipe="`cat $i | grep Source: | cut -d ':' -f2-`"
        sources="`get_sources_from_recipe $recipe`"
        location="$package""_""$long_version""_""$architecture"".ipk"

        # Set the highlight color if the license in GPLv3.  If this is
        # a GPLv3 only table then skip this package.
        case "$license" in
            *GPLv3*)
                highlight="bgcolor=yellow" ;;
            *unknown*)
                if [ "$gplv3_only" != "true" ]
                then
                    highlight="bgcolor=yellow"
                else
                    continue
                fi
                ;;
            *)
                if [ "$gplv3_only" != "true" ]
                then
                    highlight=""
                else
                    continue
                fi
                ;;
        esac

        # source variable contains the text to be used in the manifest
        source=""
        # Are there additional files in the package that come from the
        # arago/OE metadata?
        extra_files="0"
        modified="No"
        for s in $sources
        do
            case "$s" in
                file://*)
                    extra_files="1"
                    ;;
                http://install.source.dir.local*)
                    # If we are pulling something from a local file system then
                    # it is not a public modification and this should be marked
                    # as modified.  This should not be the normal case.
                    modified="Yes"
                    ;;
                *)
                    source="$source""<a href=$s>$s</a>";;
            esac
        done

        if [ "$extra_files" == "1" ]
        then
            source="$source"" <br>Files from:<br><a href=git://arago-project.org/git/meta-arago.git>git://arago-project.org/git/meta-arago.git</a><br><a href=git://arago-project.org/git/meta-ti.git>git://arago-project.org/git/meta-ti.git</a>"
        fi

        case "$package" in
            task-*)
                continue ;;
            *-src*)
                delivered_as="Source"
                ;;
            *)
                delivered_as="Binary"
                ;;
        esac

echo "
<tr>
    <td>${package} </td>
    <td>${version}</td>
    <td $highlight>${license}</td>
    <td>${location}</td>
    <td>${delivered_as}</td>
    <td>${modified}</td>
    <td>${source}</td>
</tr>
" >> ${SW_MANIFEST_FILE}

cat >> ${SW_MANIFEST_TEXT} << EOF
| ${package} | ${version} | ${license//\|/or} | ${delivered_as} | ${modified} | ${location} | ${source}
EOF
    done

    echo "</table><br><br>" >> ${SW_MANIFEST_FILE}

cat >> ${SW_MANIFEST_TEXT} << EOF
</tbody>

EOF

}
