PR_append = ".tisdk0"

# libgphoto depends on gettext as the do_configure_append will copy gettext
# files from the STAGING_DIR into its source tree. Therefore we need to
# explicitly depend on the target gettext as the gettext.bbclass may only add a
# dependency on the native gettext.
DEPENDS_prepend = "virtual/gettext "
