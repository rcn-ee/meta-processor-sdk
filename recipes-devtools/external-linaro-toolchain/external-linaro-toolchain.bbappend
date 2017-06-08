PR_append = ".tisdk0"

do_install_append() {
	# Restore spec files based on upstream installation logic
	cp -a ${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/lib/*.spec  ${D}${base_libdir}
	if [ -d ${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/libc/lib/${ELT_TARGET_SYS} ]; then
		cp -a ${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/libc/lib/${ELT_TARGET_SYS}/*.spec  ${D}${base_libdir}
	else
		if [ -f ${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/libc/lib/ld-${ELT_VER_LIBC}.so ]; then
			cp -a ${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/libc/lib/*.spec  ${D}${base_libdir}
		fi
	fi
}
