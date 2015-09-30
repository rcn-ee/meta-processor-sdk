PR_append = ".tisdk1"

# Qt5 related patches were pushed upstream
QT5_DIFF = ""

QT4_SRCREV = "83019b46fb3dec1a12667d251d35ba8682953a79"
QT5_SRCREV = "5ab1350db5892f1fec9995b53670f27977c69f8d"

SRCREV = "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_SRCREV}", "${QT4_SRCREV}", d)}"
