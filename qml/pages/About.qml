import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    SilicaFlickable {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: col.height

        VerticalScrollDecorator {}

        Column {
            id: col
            spacing: Theme.paddingLarge
            width: parent.width
            PageHeader {
                title: "About"
            }
            SectionHeader {
                text: "Info"
            }
            Rectangle {
                color: "#999999"
                x: Theme.paddingLarge * 3
                width: parent.width - Theme.paddingLarge * 3 * 2
                height: 2
                anchors.leftMargin: 20
                anchors.topMargin: 30
            }
            Label {
                text: "rwx-calc"
                font.pixelSize: Theme.fontSizeExtraLarge
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Image {
               anchors.horizontalCenter: parent.horizontalCenter
               source: "/usr/share/icons/hicolor/86x86/apps/rwx-calc.png"
            }
            Label {
                text: "Version " + version
                anchors.horizontalCenter: parent.horizontalCenter
                color: Theme.secondaryHighlightColor
            }
            Label {
                text: "Calculating Unix/Linux file permissions"
                font.pixelSize: Theme.fontSizeSmall
                width: parent.width
                horizontalAlignment: Text.Center
                textFormat: Text.RichText
                wrapMode: Text.Wrap
            }
            SectionHeader {
                text: "Author"
            }
            Rectangle {
                color: "#999999"
                x: Theme.paddingLarge * 3
                width: parent.width - Theme.paddingLarge * 3 * 2
                height: 2
                anchors.leftMargin: 20
                anchors.topMargin: 30
            }

            Label {
                text: "© Arno Dekker 2014-2015"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
