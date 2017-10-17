import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: diaVal
    allowedOrientations: Orientation.Portrait | Orientation.Landscape
                         | Orientation.LandscapeInverted
    property bool largeScreen: Screen.sizeCategory === Screen.Large
                               || Screen.sizeCategory === Screen.ExtraLarge

    Connections {
        target: Qt.application
        onActiveChanged: {
            if(!Qt.application.active) {
                // reset text to have cover page up to date if we are minimized from this page
                var allACL = mainapp.getACL(mainapp.special_nbr, mainapp.user_nbr,
                                    mainapp.group_nbr, mainapp.other_nbr)
                mainapp.rwxText = mainapp.special_nbr.toString(
                            ) + mainapp.user_nbr + mainapp.group_nbr + mainapp.other_nbr + " " + allACL
            }
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: col.height

        clip: true

        ScrollDecorator {
        }

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

        Column {
            id: col
            // set spacing considering the width/height ratio
            spacing: isPortrait ? (largeScreen ? Theme.paddingLarge : Theme.paddingSmall) : (largeScreen ? Theme.paddingLarge : -Theme.paddingSmall)
            width: parent.width
            PageHeader {
                //acceptText: "Set as Default"
            }
            Separator {
                color: Theme.primaryColor
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
                visible: isPortrait || largeScreen
            }
            Row {
                x: Theme.paddingLarge
                width: parent.width
                height: isPortrait ? (diaVal.height / diaVal.width
                                      > 1.6 ? Theme.paddingLarge : Theme.paddingLarge
                                              * 1.2) : Theme.paddingLarge
                Label {
                    text: "   Special"
                    width: parent.width / 4
                    color: Theme.secondaryColor
                }
                Label {
                    text: "   User"
                    width: parent.width / 4
                    color: Theme.secondaryColor
                }
                Label {
                    text: " Group"
                    width: parent.width / 4
                    color: Theme.secondaryColor
                }
                Label {
                    text: " Other"
                    width: parent.width / 4
                    color: Theme.secondaryColor
                }
            }
            Separator {
                color: Theme.primaryColor
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
                visible: isPortrait || largeScreen
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                height: isPortrait ? Theme.itemSizeSmall : (diaVal.height / diaVal.width > 1.6 ? Theme.paddingLarge * 2.5 : Theme.paddingLarge * 2.3)
                TextSwitch {
                    id: zeroSpecial
                    text: "0"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.special_nbr === 0 ? true : false
                    onClicked: {
                        mainapp.special_nbr = 0
                    }
                    width: parent.width / 4
                }
                TextSwitch {
                    id: zeroUser
                    text: "0"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.user_nbr === 0 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.user_nbr = 0
                    }
                }
                TextSwitch {
                    id: zeroGroup
                    text: "0"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.group_nbr === 0 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.group_nbr = 0
                    }
                }
                TextSwitch {
                    id: zeroOther
                    text: "0"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.other_nbr === 0 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.other_nbr = 0
                    }
                }
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                height: isPortrait ? Theme.itemSizeSmall : (diaVal.height / diaVal.width > 1.6 ? Theme.paddingLarge * 2.5 : Theme.paddingLarge * 2.3)
                TextSwitch {
                    id: oneSpecial
                    text: "1"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.special_nbr === 1 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.special_nbr = 1
                    }
                }
                TextSwitch {
                    id: oneUser
                    text: "1"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.user_nbr === 1 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.user_nbr = 1
                    }
                }
                TextSwitch {
                    id: oneGroup
                    text: "1"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.group_nbr === 1 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.group_nbr = 1
                    }
                }
                TextSwitch {
                    id: oneOther
                    text: "1"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.other_nbr === 1 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.other_nbr = 1
                    }
                }
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                height: isPortrait ? Theme.itemSizeSmall : (diaVal.height / diaVal.width > 1.6 ? Theme.paddingLarge * 2.5 : Theme.paddingLarge * 2.3)
                TextSwitch {
                    id: twoSpecial
                    text: "2"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.special_nbr === 2 ? true : false
                    onClicked: {
                        mainapp.special_nbr = 2
                    }
                    width: parent.width / 4
                }
                TextSwitch {
                    id: twoUser
                    text: "2"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.user_nbr === 2 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.user_nbr = 2
                    }
                }
                TextSwitch {
                    id: twoGroup
                    text: "2"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.group_nbr === 2 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.group_nbr = 2
                    }
                }
                TextSwitch {
                    id: twoOther
                    text: "2"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.other_nbr === 2 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.other_nbr = 2
                    }
                }
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                height: isPortrait ? Theme.itemSizeSmall : (diaVal.height / diaVal.width > 1.6 ? Theme.paddingLarge * 2.5 : Theme.paddingLarge * 2.3)
                TextSwitch {
                    id: threeSpecial
                    text: "3"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.special_nbr === 3 ? true : false
                    onClicked: {
                        mainapp.special_nbr = 3
                    }
                    width: parent.width / 4
                }
                TextSwitch {
                    id: threeUser
                    text: "3"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.user_nbr === 3 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.user_nbr = 3
                    }
                }
                TextSwitch {
                    id: threeGroup
                    text: "3"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.group_nbr === 3 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.group_nbr = 3
                    }
                }
                TextSwitch {
                    id: threeOther
                    text: "3"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.other_nbr === 3 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.other_nbr = 3
                    }
                }
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                height: isPortrait ? Theme.itemSizeSmall : (diaVal.height / diaVal.width > 1.6 ? Theme.paddingLarge * 2.5 : Theme.paddingLarge * 2.3)
                TextSwitch {
                    id: fourSpecial
                    text: "4"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.special_nbr === 4 ? true : false
                    onClicked: {
                        mainapp.special_nbr = 4
                    }
                    width: parent.width / 4
                }
                TextSwitch {
                    id: fourUser
                    text: "4"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.user_nbr === 4 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.user_nbr = 4
                    }
                }
                TextSwitch {
                    id: fourGroup
                    text: "4"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.group_nbr === 4 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.group_nbr = 4
                    }
                }
                TextSwitch {
                    id: fourOther
                    text: "4"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.other_nbr === 4 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.other_nbr = 4
                    }
                }
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                height: isPortrait ? Theme.itemSizeSmall : (diaVal.height / diaVal.width > 1.6 ? Theme.paddingLarge * 2.5 : Theme.paddingLarge * 2.3)
                TextSwitch {
                    id: fiveSpecial
                    text: "5"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.special_nbr === 5 ? true : false
                    onClicked: {
                        mainapp.special_nbr = 5
                    }
                    width: parent.width / 4
                }
                TextSwitch {
                    id: fiveUser
                    text: "5"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.user_nbr === 5 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.user_nbr = 5
                    }
                }
                TextSwitch {
                    id: fiveGroup
                    text: "5"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.group_nbr === 5 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.group_nbr = 5
                    }
                }
                TextSwitch {
                    id: fiveOther
                    text: "5"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.other_nbr === 5 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.other_nbr = 5
                    }
                }
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                height: isPortrait ? Theme.itemSizeSmall : (diaVal.height / diaVal.width > 1.6 ? Theme.paddingLarge * 2.5 : Theme.paddingLarge * 2.3)
                TextSwitch {
                    id: sixSpecial
                    text: "6"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.special_nbr === 6 ? true : false
                    onClicked: {
                        mainapp.special_nbr = 6
                    }
                    width: parent.width / 4
                }
                TextSwitch {
                    id: sixUser
                    text: "6"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.user_nbr === 6 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.user_nbr = 6
                    }
                }
                TextSwitch {
                    id: sixGroup
                    text: "6"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.group_nbr === 6 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.group_nbr = 6
                    }
                }
                TextSwitch {
                    id: sixOther
                    text: "6"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.other_nbr === 6 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.other_nbr = 6
                    }
                }
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                height: isPortrait ? Theme.itemSizeSmall : (diaVal.height / diaVal.width > 1.6 ? Theme.paddingLarge * 2.5 : Theme.paddingLarge * 2.3)
                TextSwitch {
                    id: sevenSpecial
                    text: "7"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.special_nbr === 7 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.special_nbr = 7
                    }
                }
                TextSwitch {
                    id: sevenUser
                    text: "7"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.user_nbr === 7 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.user_nbr = 7
                    }
                }
                TextSwitch {
                    id: sevenGroup
                    text: "7"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.group_nbr === 7 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.group_nbr = 7
                    }
                }
                TextSwitch {
                    id: sevenOther
                    text: "7"
                    highlighted: checked
                    automaticCheck: false
                    checked: mainapp.other_nbr === 7 ? true : false
                    width: parent.width / 4
                    onClicked: {
                        mainapp.other_nbr = 7
                    }
                }
            }
        }
    }
}
