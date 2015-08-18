import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: diaVal
    property int special_nbr: 0
    property int user_nbr: 0
    property int group_nbr: 0
    property int other_nbr: 0

    anchors.fill: parent
    canAccept: true

    DialogHeader {
        //acceptText: "Set as Default"
    }

    onAccepted: {

    }

    onRejected: {

        //reject
    }

    Column {
        //    anchors.fill: parent
        id: col
        // set spacing considering the width/height ratio
        spacing: parent.height / parent.width > 1.6 ? Theme.paddingMedium : Theme.paddingSmall
        width: parent.width
        height: parent.height
        PageHeader {
            title: " "
        }
        Separator {
            color: Theme.primaryColor
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Qt.AlignHCenter
        }
        Row {
            x: Theme.paddingLarge
            width: parent.width
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
        }
        Row {
            x: Theme.paddingSmall
            width: parent.width
            TextSwitch {
                id: zeroSpecial
                text: "0"
                highlighted: checked
                automaticCheck: false
                checked: special_nbr == 0 ? true : false
                onClicked: {
                    special_nbr = 0
                }
                width: parent.width / 4
            }
            TextSwitch {
                id: zeroUser
                text: "0"
                highlighted: checked
                automaticCheck: false
                checked: user_nbr == 0 ? true : false
                width: parent.width / 4
                onClicked: {
                    user_nbr = 0
                }
            }
            TextSwitch {
                id: zeroGroup
                text: "0"
                highlighted: checked
                automaticCheck: false
                checked: group_nbr == 0 ? true : false
                width: parent.width / 4
                onClicked: {
                    group_nbr = 0
                }
            }
            TextSwitch {
                id: zeroOther
                text: "0"
                highlighted: checked
                automaticCheck: false
                checked: other_nbr == 0 ? true : false
                width: parent.width / 4
                onClicked: {
                    other_nbr = 0
                }
            }
        }
        Row {
            x: Theme.paddingSmall
            width: parent.width
            TextSwitch {
                id: oneSpecial
                text: "1"
                highlighted: checked
                automaticCheck: false
                checked: special_nbr == 1 ? true : false
                width: parent.width / 4
                onClicked: {
                    special_nbr = 1
                }
            }
            TextSwitch {
                id: oneUser
                text: "1"
                highlighted: checked
                automaticCheck: false
                checked: user_nbr == 1 ? true : false
                width: parent.width / 4
                onClicked: {
                    user_nbr = 1
                }
            }
            TextSwitch {
                id: oneGroup
                text: "1"
                highlighted: checked
                automaticCheck: false
                checked: group_nbr == 1 ? true : false
                width: parent.width / 4
                onClicked: {
                    group_nbr = 1
                }
            }
            TextSwitch {
                id: oneOther
                text: "1"
                highlighted: checked
                automaticCheck: false
                checked: other_nbr == 1 ? true : false
                width: parent.width / 4
                onClicked: {
                    other_nbr = 1
                }
            }
        }
        Row {
            x: Theme.paddingSmall
            width: parent.width
            TextSwitch {
                id: twoSpecial
                text: "2"
                highlighted: checked
                automaticCheck: false
                checked: special_nbr == 2 ? true : false
                onClicked: {
                    special_nbr = 2
                }
                width: parent.width / 4
            }
            TextSwitch {
                id: twoUser
                text: "2"
                highlighted: checked
                automaticCheck: false
                checked: user_nbr == 2 ? true : false
                width: parent.width / 4
                onClicked: {
                    user_nbr = 2
                }
            }
            TextSwitch {
                id: twoGroup
                text: "2"
                highlighted: checked
                automaticCheck: false
                checked: group_nbr == 2 ? true : false
                width: parent.width / 4
                onClicked: {
                    group_nbr = 2
                }
            }
            TextSwitch {
                id: twoOther
                text: "2"
                highlighted: checked
                automaticCheck: false
                checked: other_nbr == 2 ? true : false
                width: parent.width / 4
                onClicked: {
                    other_nbr = 2
                }
            }
        }
        Row {
            x: Theme.paddingSmall
            width: parent.width
            TextSwitch {
                id: threeSpecial
                text: "3"
                highlighted: checked
                automaticCheck: false
                checked: special_nbr == 3 ? true : false
                onClicked: {
                    special_nbr = 3
                }
                width: parent.width / 4
            }
            TextSwitch {
                id: threeUser
                text: "3"
                highlighted: checked
                automaticCheck: false
                checked: user_nbr == 3 ? true : false
                width: parent.width / 4
                onClicked: {
                    user_nbr = 3
                }
            }
            TextSwitch {
                id: threeGroup
                text: "3"
                highlighted: checked
                automaticCheck: false
                checked: group_nbr == 3 ? true : false
                width: parent.width / 4
                onClicked: {
                    group_nbr = 3
                }
            }
            TextSwitch {
                id: threeOther
                text: "3"
                highlighted: checked
                automaticCheck: false
                checked: other_nbr == 3 ? true : false
                width: parent.width / 4
                onClicked: {
                    other_nbr = 3
                }
            }
        }
        Row {
            x: Theme.paddingSmall
            width: parent.width
            TextSwitch {
                id: fourSpecial
                text: "4"
                highlighted: checked
                automaticCheck: false
                checked: special_nbr == 4 ? true : false
                onClicked: {
                    special_nbr = 4
                }
                width: parent.width / 4
            }
            TextSwitch {
                id: fourUser
                text: "4"
                highlighted: checked
                automaticCheck: false
                checked: user_nbr == 4 ? true : false
                width: parent.width / 4
                onClicked: {
                    user_nbr = 4
                }
            }
            TextSwitch {
                id: fourGroup
                text: "4"
                highlighted: checked
                automaticCheck: false
                checked: group_nbr == 4 ? true : false
                width: parent.width / 4
                onClicked: {
                    group_nbr = 4
                }
            }
            TextSwitch {
                id: fourOther
                text: "4"
                highlighted: checked
                automaticCheck: false
                checked: other_nbr == 4 ? true : false
                width: parent.width / 4
                onClicked: {
                    other_nbr = 4
                }
            }
        }
        Row {
            x: Theme.paddingSmall
            width: parent.width
            TextSwitch {
                id: fiveSpecial
                text: "5"
                highlighted: checked
                automaticCheck: false
                checked: special_nbr == 5 ? true : false
                onClicked: {
                    special_nbr = 5
                }
                width: parent.width / 4
            }
            TextSwitch {
                id: fiveUser
                text: "5"
                highlighted: checked
                automaticCheck: false
                checked: user_nbr == 5 ? true : false
                width: parent.width / 4
                onClicked: {
                    user_nbr = 5
                }
            }
            TextSwitch {
                id: fiveGroup
                text: "5"
                highlighted: checked
                automaticCheck: false
                checked: group_nbr == 5 ? true : false
                width: parent.width / 4
                onClicked: {
                    group_nbr = 5
                }
            }
            TextSwitch {
                id: fiveOther
                text: "5"
                highlighted: checked
                automaticCheck: false
                checked: other_nbr == 5 ? true : false
                width: parent.width / 4
                onClicked: {
                    other_nbr = 5
                }
            }
        }
        Row {
            x: Theme.paddingSmall
            width: parent.width
            TextSwitch {
                id: sixSpecial
                text: "6"
                highlighted: checked
                automaticCheck: false
                checked: special_nbr == 6 ? true : false
                onClicked: {
                    special_nbr = 6
                }
                width: parent.width / 4
            }
            TextSwitch {
                id: sixUser
                text: "6"
                highlighted: checked
                automaticCheck: false
                checked: user_nbr == 6 ? true : false
                width: parent.width / 4
                onClicked: {
                    user_nbr = 6
                }
            }
            TextSwitch {
                id: sixGroup
                text: "6"
                highlighted: checked
                automaticCheck: false
                checked: group_nbr == 6 ? true : false
                width: parent.width / 4
                onClicked: {
                    group_nbr = 6
                }
            }
            TextSwitch {
                id: sixOther
                text: "6"
                highlighted: checked
                automaticCheck: false
                checked: other_nbr == 6 ? true : false
                width: parent.width / 4
                onClicked: {
                    other_nbr = 6
                }
            }
        }
        Row {
            x: Theme.paddingSmall
            width: parent.width
            TextSwitch {
                id: sevenSpecial
                text: "7"
                highlighted: checked
                automaticCheck: false
                checked: special_nbr == 7 ? true : false
                width: parent.width / 4
                onClicked: {
                    special_nbr = 7
                }
            }
            TextSwitch {
                id: sevenUser
                text: "7"
                highlighted: checked
                automaticCheck: false
                checked: user_nbr == 7 ? true : false
                width: parent.width / 4
                onClicked: {
                    user_nbr = 7
                }
            }
            TextSwitch {
                id: sevenGroup
                text: "7"
                highlighted: checked
                automaticCheck: false
                checked: group_nbr == 7 ? true : false
                width: parent.width / 4
                onClicked: {
                    group_nbr = 7
                }
            }
            TextSwitch {
                id: sevenOther
                text: "7"
                highlighted: checked
                automaticCheck: false
                checked: other_nbr == 7 ? true : false
                width: parent.width / 4
                onClicked: {
                    other_nbr = 7
                }
            }
        }
    }
}
