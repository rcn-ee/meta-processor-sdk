PR_append = ".tisdk0"

deltask do_install_srcipk
addtask install_srcipk after do_create_srcipk before do_package
