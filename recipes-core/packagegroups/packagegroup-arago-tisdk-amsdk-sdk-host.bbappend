PR:append = ".psdk3"

# Choose the kernel and u-boot recipe sources to use
UBOOT_SRC = "${PREFERRED_PROVIDER_virtual/bootloader}-src"
KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-src"

KERNEL_SHADOW_CLONE := "${PREFERRED_PROVIDER_virtual/kernel}"
KERNEL_SHADOW_CLONE_ENABLED := "${SRCIPK_SHALLOW_CLONE_pn-${KERNEL_SHADOW_CLONE}}"

EXTRA_FILES:prepend = "\
     ti-tisdk-makefile \
     uboot-flash-writer \
     ti-tisdk-setup \
     ${UBOOT_SRC} \
     ${KERNEL_SRC} \
     ${@oe.utils.conditional('KERNEL_SHADOW_CLONE_ENABLED','true','unshallow-repositories','',d)} \
"
