PR_append = ".tisdk2"

SRCREV = "1add806dd47c8c50736e66d68760ed1435560ebd"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-create-sdcard-update-for-switch-to-tar.xz-image-form.patch \
    file://0002-setup-target-nfs-update-for-switch-to-tar.xz-image-f.patch \
"
