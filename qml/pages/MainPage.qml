import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    objectName: mainPageName

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: parent.height
        contentWidth: parent.width

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
            }
            MenuItem {
                text: qsTr("Umask explained")
                onClicked: pageStack.push(Qt.resolvedUrl("Umask.qml"))
            }
            MenuItem {
                text: qsTr("Help")
                onClicked: pageStack.push(Qt.resolvedUrl("Help.qml"))
            }
        }

        SlideshowView {
            id: viewsSlideshow
            anchors.fill: parent
            itemWidth: width
            clip: true
            model: VisualItemModel {
                Loader {
                    width: viewsSlideshow.width
                    height: viewsSlideshow.height
                    property int index: index // makes attached property available from outside
                    source: Qt.resolvedUrl("Rwx.qml")
                    onSourceChanged: {
                        if (source == "")
                            console.log("OctalView unloaded", source)
                        else
                            console.log("RwxView loaded:", source)
                    }
                }
                Loader {
                    width: viewsSlideshow.width
                    height: viewsSlideshow.height
                    source: Qt.resolvedUrl("Octal.qml")
                    asynchronous: true
                    onSourceChanged: {
                        if (source == "") {
                            console.log("Rwx-view unloaded", source)
                        } else
                            console.log("OctalView loaded:", source)
                    }
                }
            }

            onCurrentIndexChanged: {
                tabBar.currentSelection = currentIndex
            }

            currentIndex: tabBar.currentSelection

            Connections {
                target: tabBar
                onCurrentSelectionChanged: {
                    reReadInfo()
                    //console.log("Current selection changed")
                    if (viewsSlideshow.currentIndex !== tabBar.currentSelection) {
                        viewsSlideshow.positionViewAtIndex(
                                    tabBar.currentSelection,
                                    PathView.SnapPosition)
                    }
                }
            }
        }
    }
}
