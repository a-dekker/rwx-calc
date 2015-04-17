import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    function getACL(specialval, userval, groupval, otherval) {
        if (userval == 0)
            var userACL = "---"
        if (userval == 1)
            var userACL = "--x"
        if (userval == 2)
            var userACL = "-w-"
        if (userval == 3)
            var userACL = "-wx"
        if (userval == 4)
            var userACL = "r--"
        if (userval == 5)
            var userACL = "r-x"
        if (userval == 6)
            var userACL = "rw-"
        if (userval == 7)
            var userACL = "rwx"
        if (groupval == 0)
            var groupACL = "---"
        if (groupval == 1)
            var groupACL = "--x"
        if (groupval == 2)
            var groupACL = "-w-"
        if (groupval == 3)
            var groupACL = "-wx"
        if (groupval == 4)
            var groupACL = "r--"
        if (groupval == 5)
            var groupACL = "r-x"
        if (groupval == 6)
            var groupACL = "rw-"
        if (groupval == 7)
            var groupACL = "rwx"
        if (otherval == 0)
            var otherACL = "---"
        if (otherval == 1)
            var otherACL = "--x"
        if (otherval == 2)
            var otherACL = "-w-"
        if (otherval == 3)
            var otherACL = "-wx"
        if (otherval == 4)
            var otherACL = "r--"
        if (otherval == 5)
            var otherACL = "r-x"
        if (otherval == 6)
            var otherACL = "rw-"
        if (otherval == 7)
            var otherACL = "rwx"
        if (specialval == 4 || specialval == 5 || specialval == 7
                || specialval == 6)
            // setuid
            if (userval == 7 || userval == 5 || userval == 3 || userval == 1)
                // exec bit on user
                var userACL = userACL.substring(0,
                                                2) + "s" + userACL.substring(3)
            else
                var userACL = userACL.substring(0,
                                                2) + "S" + userACL.substring(3)
        if (specialval == 2 || specialval == 6 || specialval == 7
                || specialval == 3)
            // setgid
            if (groupval == 7 || groupval == 5 || groupval == 3
                    || groupval == 1)
                // exec bit on group
                var groupACL = groupACL.substring(
                            0, 2) + "s" + groupACL.substring(3)
            else
                var groupACL = groupACL.substring(
                            0, 2) + "S" + groupACL.substring(3)
        if (specialval == 1 || specialval == 3 || specialval == 5
                || specialval == 7)
            // stickybit
            if (otherval == 7 || otherval == 5 || otherval == 3
                    || otherval == 1)
                // exec bit on other
                var otherACL = otherACL.substring(
                            0, 2) + "t" + otherACL.substring(3)
            else
                var otherACL = otherACL.substring(
                            0, 2) + "T" + otherACL.substring(3)
        var allACL = userACL + groupACL + otherACL
        return allACL
    }

    function rwxButtonPressed() {
        // user
        if (readUser.checked)
            var userReadVal = 4
        else
            var userReadVal = 0
        if (writeUser.checked)
            var userWriteVal = 2
        else
            var userWriteVal = 0
        if (execUser.checked)
            var userExecVal = 1
        else
            var userExecVal = 0
        // group
        if (readGroup.checked)
            var groupReadVal = 4
        else
            var groupReadVal = 0
        if (writeGroup.checked)
            var groupWriteVal = 2
        else
            var groupWriteVal = 0
        if (execGroup.checked)
            var groupExecVal = 1
        else
            var groupExecVal = 0
        // world
        if (readOther.checked)
            var worldReadVal = 4
        else
            var worldReadVal = 0
        if (writeOther.checked)
            var worldWriteVal = 2
        else
            var worldWriteVal = 0
        if (execOther.checked)
            var worldExecVal = 1
        else
            var worldExecVal = 0
        //special
        if (setuid.checked)
            var setuidVal = 4
        else
            var setuidVal = 0
        if (setgid.checked)
            var setgidVal = 2
        else
            var setgidVal = 0
        if (stickybit.checked)
            var stickybitVal = 1
        else
            var stickybitVal = 0
        var specialVal = setuidVal + setgidVal + stickybitVal
        var userVal = userReadVal + userWriteVal + userExecVal
        var groupVal = groupReadVal + groupWriteVal + groupExecVal
        var worldVal = worldReadVal + worldWriteVal + worldExecVal

        var allACL = getACL(specialVal, userVal, groupVal, worldVal)

        rwxbutton.text = specialVal.toString(
                    ) + userVal + groupVal + worldVal + " " + allACL
        mainapp.rwxText = rwxbutton.text
    }
    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
            }
            MenuItem {
                text: qsTr("Help")
                onClicked: pageStack.push(Qt.resolvedUrl("Help.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            // set spacing considering the width/height ratio
            spacing: page.height / page.width > 1.6 ? Theme.paddingMedium : Theme.paddingSmall
            PageHeader {
                title: qsTr("rwx-calc")
            }
            Label {
                x: Theme.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Permissions calculator")
                font.bold: true
            }
            Rectangle {
                id: splitter
                color: "#999999"
                x: 20
                width: parent.width - 40
                height: 2
                anchors.leftMargin: 20
                anchors.topMargin: 30
            }
            Row {
                x: Theme.paddingLarge
                width: parent.width
                Label {
                    text: "        User"
                    width: parent.width / 3
                    color: Theme.secondaryColor
                }
                Label {
                    text: "     Group"
                    width: parent.width / 3
                    color: Theme.secondaryColor
                }
                Label {
                    text: "    Other"
                    width: parent.width / 3
                    color: Theme.secondaryColor
                }
            }
            Rectangle {
                id: splitter2
                color: "#999999"
                x: 20
                width: parent.width - 40
                height: 2
                anchors.leftMargin: 20
                anchors.topMargin: 30
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                TextSwitch {
                    id: readUser
                    text: "read"
                    rightMargin: Theme.paddingSmall
                    highlighted: checked
                    onClicked: {
                        rwxButtonPressed()
                    }
                    width: parent.width / 3
                }
                TextSwitch {
                    id: readGroup
                    text: "read"
                    rightMargin: Theme.paddingSmall
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    width: parent.width / 3
                    onClicked: {
                        rwxButtonPressed()
                    }
                }
                TextSwitch {
                    id: readOther
                    text: "read"
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    width: parent.width / 3
                    onClicked: {
                        rwxButtonPressed()
                    }
                }
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                TextSwitch {
                    id: writeUser
                    text: "write"
                    rightMargin: Theme.paddingSmall
                    highlighted: checked
                    onClicked: {
                        rwxButtonPressed()
                    }
                    width: parent.width / 3
                }
                TextSwitch {
                    id: writeGroup
                    text: "write"
                    rightMargin: Theme.paddingSmall
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    onClicked: {
                        rwxButtonPressed()
                    }
                    width: parent.width / 3
                }
                TextSwitch {
                    id: writeOther
                    text: "write"
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    width: parent.width / 3
                    onClicked: {
                        rwxButtonPressed()
                    }
                }
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                TextSwitch {
                    id: execUser
                    text: "exec"
                    rightMargin: Theme.paddingSmall
                    highlighted: checked
                    width: parent.width / 3
                    onClicked: {
                        rwxButtonPressed()
                    }
                }
                TextSwitch {
                    id: execGroup
                    text: "exec"
                    rightMargin: Theme.paddingSmall
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    onClicked: {
                        rwxButtonPressed()
                    }
                    width: parent.width / 3
                }
                TextSwitch {
                    id: execOther
                    text: "exec"
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    width: parent.width / 3
                    onClicked: {
                        rwxButtonPressed()
                    }
                }
            }
            Rectangle {
                id: splitter3
                color: "#999999"
                x: 20
                width: parent.width - 40
                height: 2
                anchors.leftMargin: 20
                anchors.topMargin: 30
            }
            Label {
                x: Theme.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Special")
                color: Theme.secondaryColor
            }
            Rectangle {
                id: splitter4
                color: "#999999"
                x: 20
                width: parent.width - 40
                height: 2
                anchors.leftMargin: 20
                anchors.topMargin: 30
            }
            Row {
                width: parent.width
                x: Theme.paddingSmall
                TextSwitch {
                    id: setuid
                    text: "setuid"
                    rightMargin: Theme.paddingSmall
                    highlighted: checked
                    onClicked: {
                        rwxButtonPressed()
                    }
                    width: parent.width / 3
                }
                TextSwitch {
                    id: setgid
                    text: "setgid"
                    rightMargin: Theme.paddingSmall
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    width: parent.width / 3
                    onClicked: {
                        rwxButtonPressed()
                    }
                }
                TextSwitch {
                    id: stickybit
                    text: "sticky"
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    width: parent.width / 3
                    onClicked: {
                        rwxButtonPressed()
                    }
                }
            }
            Rectangle {
                id: splitter5
                color: "#999999"
                x: 20
                width: parent.width - 40
                height: 2
                anchors.leftMargin: 20
                anchors.topMargin: 30
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Absolute (octal) and symbolic")
                color: Theme.secondaryColor
            }
            Item {
                height: Theme.itemSizeLarge
                anchors.horizontalCenter: parent.horizontalCenter
                width: rwxbutton.width
                Rectangle {
                    anchors.fill: parent
                    opacity: 0.2
                    radius: 10.0
                }
                TextField {
                    id: rwxbutton
                    readOnly: true
                    font.pixelSize: Theme.fontSizeHuge
                    color: Theme.highlightColor
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "0000 ---------"
                    onClicked: {
                        var dialog = pageStack.push(Qt.resolvedUrl(
                                                        "Octal.qml"), {
                                                        special_nbr: rwxbutton.text[0],
                                                        user_nbr: rwxbutton.text[1],
                                                        group_nbr: rwxbutton.text[2],
                                                        other_nbr: rwxbutton.text[3]
                                                    })
                        dialog.accepted.connect(function () {
                            var allACL = getACL(dialog.special_nbr,
                                                dialog.user_nbr,
                                                dialog.group_nbr,
                                                dialog.other_nbr)
                            rwxbutton.text = dialog.special_nbr.toString(
                                        ) + dialog.user_nbr + dialog.group_nbr
                                    + dialog.other_nbr + " " + allACL
                            mainapp.rwxText = rwxbutton.text
                            if (dialog.special_nbr == "0") {
                                setuid.checked = false
                                setgid.checked = false
                                stickybit.checked = false
                            }
                            if (dialog.special_nbr == "1") {
                                setuid.checked = false
                                setgid.checked = false
                                stickybit.checked = true
                            }
                            if (dialog.special_nbr == "2") {
                                setuid.checked = false
                                setgid.checked = true
                                stickybit.checked = false
                            }
                            if (dialog.special_nbr == "3") {
                                setuid.checked = false
                                setgid.checked = true
                                stickybit.checked = true
                            }
                            if (dialog.special_nbr == "4") {
                                setuid.checked = true
                                setgid.checked = false
                                stickybit.checked = false
                            }
                            if (dialog.special_nbr == "5") {
                                setuid.checked = true
                                setgid.checked = false
                                stickybit.checked = true
                            }
                            if (dialog.special_nbr == "6") {
                                setuid.checked = true
                                setgid.checked = true
                                stickybit.checked = false
                            }
                            if (dialog.special_nbr == "7") {
                                setuid.checked = true
                                setgid.checked = true
                                stickybit.checked = true
                            }
                            // user
                            if (dialog.user_nbr == "0") {
                                readUser.checked = false
                                writeUser.checked = false
                                execUser.checked = false
                            }
                            if (dialog.user_nbr == "1") {
                                readUser.checked = false
                                writeUser.checked = false
                                execUser.checked = true
                            }
                            if (dialog.user_nbr == "2") {
                                readUser.checked = false
                                writeUser.checked = true
                                execUser.checked = false
                            }
                            if (dialog.user_nbr == "3") {
                                readUser.checked = false
                                writeUser.checked = true
                                execUser.checked = true
                            }
                            if (dialog.user_nbr == "4") {
                                readUser.checked = true
                                writeUser.checked = false
                                execUser.checked = false
                            }
                            if (dialog.user_nbr == "5") {
                                readUser.checked = true
                                writeUser.checked = false
                                execUser.checked = true
                            }
                            if (dialog.user_nbr == "6") {
                                readUser.checked = true
                                writeUser.checked = true
                                execUser.checked = false
                            }
                            if (dialog.user_nbr == "7") {
                                readUser.checked = true
                                writeUser.checked = true
                                execUser.checked = true
                            }
                            // group
                            if (dialog.group_nbr == "0") {
                                readGroup.checked = false
                                writeGroup.checked = false
                                execGroup.checked = false
                            }
                            if (dialog.group_nbr == "1") {
                                readGroup.checked = false
                                writeGroup.checked = false
                                execGroup.checked = true
                            }
                            if (dialog.group_nbr == "2") {
                                readGroup.checked = false
                                writeGroup.checked = true
                                execGroup.checked = false
                            }
                            if (dialog.group_nbr == "3") {
                                readGroup.checked = false
                                writeGroup.checked = true
                                execGroup.checked = true
                            }
                            if (dialog.group_nbr == "4") {
                                readGroup.checked = true
                                writeGroup.checked = false
                                execGroup.checked = false
                            }
                            if (dialog.group_nbr == "5") {
                                readGroup.checked = true
                                writeGroup.checked = false
                                execGroup.checked = true
                            }
                            if (dialog.group_nbr == "6") {
                                readGroup.checked = true
                                writeGroup.checked = true
                                execGroup.checked = false
                            }
                            if (dialog.group_nbr == "7") {
                                readGroup.checked = true
                                writeGroup.checked = true
                                execGroup.checked = true
                            }
                            // other
                            if (dialog.other_nbr == "0") {
                                readOther.checked = false
                                writeOther.checked = false
                                execOther.checked = false
                            }
                            if (dialog.other_nbr == "1") {
                                readOther.checked = false
                                writeOther.checked = false
                                execOther.checked = true
                            }
                            if (dialog.other_nbr == "2") {
                                readOther.checked = false
                                writeOther.checked = true
                                execOther.checked = false
                            }
                            if (dialog.other_nbr == "3") {
                                readOther.checked = false
                                writeOther.checked = true
                                execOther.checked = true
                            }
                            if (dialog.other_nbr == "4") {
                                readOther.checked = true
                                writeOther.checked = false
                                execOther.checked = false
                            }
                            if (dialog.other_nbr == "5") {
                                readOther.checked = true
                                writeOther.checked = false
                                execOther.checked = true
                            }
                            if (dialog.other_nbr == "6") {
                                readOther.checked = true
                                writeOther.checked = true
                                execOther.checked = false
                            }
                            if (dialog.other_nbr == "7") {
                                readOther.checked = true
                                writeOther.checked = true
                                execOther.checked = true
                            }
                        })
                    }
                }
            }
        }
    }
}
