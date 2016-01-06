PR_append = ".tisdk1"

require ocl-1.1.7.inc

COMPATIBLE_MACHINE_append = "|k2l-evm|k2e-evm"

OCL_EXAMPLE_LIST_append = " sgemm \
                            vecadd_openmp \
                            vecadd_openmp_t \
                            dgemm \
"
