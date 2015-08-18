# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-rwx-calc

CONFIG += sailfishapp

SOURCES += src/rwx-calc.cpp

OTHER_FILES += qml/rwx-calc.qml \
    qml/cover/CoverPage.qml \
    rpm/rwx-calc.changes.in \
    rpm/rwx-calc.spec \
    rpm/rwx-calc.yaml \
    harbour-rwx-calc.desktop \
    harbour-rwx-calc.png \
    qml/pages/About.qml \
    qml/pages/MainPage.qml \
    qml/pages/Octal.qml \
    qml/pages/Help.qml

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
# TRANSLATIONS += translations/rwx-calc-de.ts

HEADERS += \

