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
    harbour-rwx-calc.desktop \
    qml/pages/About.qml \
    qml/pages/MainPage.qml \
    qml/pages/Octal.qml \
    qml/pages/Help.qml

icon86.files += icons/86x86/harbour-rwx-calc.png
icon86.path = /usr/share/icons/hicolor/86x86/apps

icon108.files += icons/108x108/harbour-rwx-calc.png
icon108.path = /usr/share/icons/hicolor/108x108/apps

icon128.files += icons/128x128/harbour-rwx-calc.png
icon128.path = /usr/share/icons/hicolor/128x128/apps

icon172.files += icons/172x172/harbour-rwx-calc.png
icon172.path = /usr/share/icons/hicolor/172x172/apps

icon256.files += icons/256x256/harbour-rwx-calc.png
icon256.path = /usr/share/icons/hicolor/256x256/apps

INSTALLS += icon86 icon108 icon128 icon172 icon256
# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
# TRANSLATIONS += translations/rwx-calc-de.ts

HEADERS += \
