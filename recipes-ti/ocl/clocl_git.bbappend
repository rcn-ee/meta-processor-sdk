PR_append = ".tisdk0"

require ocl-1.1.7.inc

DEPENDS_remove = " ti-llvm3.3 ti-llvm3.3-native"
DEPENDS_append = " ti-llvm3.6 ti-llvm3.6-native"

export WANT_LLVM_RELEASE = "3.6-ti"
