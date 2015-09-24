PR_append = ".tisdk0"

# Qt5 related patches were pushed upstream
QT5_DIFF = ""

QT4_SRCREV = "83019b46fb3dec1a12667d251d35ba8682953a79"
QT5_SRCREV = "7bb8867f1edd4428cb1936178f4999b5c3e1081f"

SRCREV = "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_SRCREV}", "${QT4_SRCREV}", d)}"
