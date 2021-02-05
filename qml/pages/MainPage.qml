import QtQuick 2.5
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.Portrait | Orientation.Landscape
                         | Orientation.LandscapeInverted
    property bool largeScreen: Screen.sizeCategory === Screen.Large
                               || Screen.sizeCategory === Screen.ExtraLarge

    onStatusChanged: {
        switch (status) {
        case PageStatus.Active:
            // add the octal page to the pagestack
            pageStack.pushAttached(Qt.resolvedUrl("Octal.qml"))
            break
        case PageStatus.Deactivating:
            mainapp.special_nbr = rwxbutton.text[0]
            mainapp.user_nbr = rwxbutton.text[1]
            mainapp.group_nbr = rwxbutton.text[2]
            mainapp.other_nbr = rwxbutton.text[3]
            break
        case PageStatus.Activating:
            var allACL = mainapp.getACL(mainapp.special_nbr, mainapp.user_nbr,
                                mainapp.group_nbr, mainapp.other_nbr)
            rwxbutton.text = mainapp.special_nbr.toString(
                        ) + mainapp.user_nbr + mainapp.group_nbr + mainapp.other_nbr + " " + allACL
            mainapp.rwxText = rwxbutton.text
            if (mainapp.special_nbr === 0) {
                setuid_portrait.checked = false
                setuid_landscape.checked = false
                setgid_portrait.checked = false
                setgid_landscape.checked = false
                stickybit_portrait.checked = false
                stickybit_landscape.checked = false
            }
            if (mainapp.special_nbr === 1) {
                setuid_portrait.checked = false
                setuid_landscape.checked = false
                setgid_portrait.checked = false
                setgid_landscape.checked = false
                stickybit_portrait.checked = true
                stickybit_landscape.checked = true
            }
            if (mainapp.special_nbr === 2) {
                setgid_portrait.checked = true
                setgid_landscape.checked = true
                stickybit_portrait.checked = false
                stickybit_landscape.checked = false
            }
            if (mainapp.special_nbr === 3) {
                setuid_portrait.checked = false
                setuid_landscape.checked = false
                setgid_portrait.checked = true
                setgid_landscape.checked = true
                stickybit_portrait.checked = true
                stickybit_landscape.checked = true
            }
            if (mainapp.special_nbr === 4) {
                setuid_portrait.checked = true
                setuid_landscape.checked = true
                setgid_portrait.checked = false
                setgid_landscape.checked = false
                stickybit_portrait.checked = false
                stickybit_landscape.checked = false
            }
            if (mainapp.special_nbr === 5) {
                setuid_portrait.checked = true
                setuid_landscape.checked = true
                setgid_portrait.checked = false
                setgid_landscape.checked = false
                stickybit_portrait.checked = true
                stickybit_landscape.checked = true
            }
            if (mainapp.special_nbr === 6) {
                setuid_portrait.checked = true
                setuid_landscape.checked = true
                setgid_portrait.checked = true
                setgid_landscape.checked = true
                stickybit_portrait.checked = false
                stickybit_landscape.checked = false
            }
            if (mainapp.special_nbr === 7) {
                setuid_portrait.checked = true
                setuid_landscape.checked = true
                setgid_portrait.checked = true
                setgid_landscape.checked = true
                stickybit_portrait.checked = true
                stickybit_landscape.checked = true
            }
            // user
            if (mainapp.user_nbr === 0) {
                readUser.checked = false
                writeUser.checked = false
                execUser.checked = false
            }
            if (mainapp.user_nbr === 1) {
                readUser.checked = false
                writeUser.checked = false
                execUser.checked = true
            }
            if (mainapp.user_nbr === 2) {
                readUser.checked = false
                writeUser.checked = true
                execUser.checked = false
            }
            if (mainapp.user_nbr === 3) {
                readUser.checked = false
                writeUser.checked = true
                execUser.checked = true
            }
            if (mainapp.user_nbr === 4) {
                readUser.checked = true
                writeUser.checked = false
                execUser.checked = false
            }
            if (mainapp.user_nbr === 5) {
                readUser.checked = true
                writeUser.checked = false
                execUser.checked = true
            }
            if (mainapp.user_nbr === 6) {
                readUser.checked = true
                writeUser.checked = true
                execUser.checked = false
            }
            if (mainapp.user_nbr === 7) {
                readUser.checked = true
                writeUser.checked = true
                execUser.checked = true
            }
            // group
            if (mainapp.group_nbr === 0) {
                readGroup.checked = false
                writeGroup.checked = false
                execGroup.checked = false
            }
            if (mainapp.group_nbr === 1) {
                readGroup.checked = false
                writeGroup.checked = false
                execGroup.checked = true
            }
            if (mainapp.group_nbr === 2) {
                readGroup.checked = false
                writeGroup.checked = true
                execGroup.checked = false
            }
            if (mainapp.group_nbr === 3) {
                readGroup.checked = false
                writeGroup.checked = true
                execGroup.checked = true
            }
            if (mainapp.group_nbr === 4) {
                readGroup.checked = true
                writeGroup.checked = false
                execGroup.checked = false
            }
            if (mainapp.group_nbr === 5) {
                readGroup.checked = true
                writeGroup.checked = false
                execGroup.checked = true
            }
            if (mainapp.group_nbr === 6) {
                readGroup.checked = true
                writeGroup.checked = true
                execGroup.checked = false
            }
            if (mainapp.group_nbr === 7) {
                readGroup.checked = true
                writeGroup.checked = true
                execGroup.checked = true
            }
            // other
            if (mainapp.other_nbr === 0) {
                readOther.checked = false
                writeOther.checked = false
                execOther.checked = false
            }
            if (mainapp.other_nbr === 1) {
                readOther.checked = false
                writeOther.checked = false
                execOther.checked = true
            }
            if (mainapp.other_nbr === 2) {
                readOther.checked = false
                writeOther.checked = true
                execOther.checked = false
            }
            if (mainapp.other_nbr === 3) {
                readOther.checked = false
                writeOther.checked = true
                execOther.checked = true
            }
            if (mainapp.other_nbr === 4) {
                readOther.checked = true
                writeOther.checked = false
                execOther.checked = false
            }
            if (mainapp.other_nbr === 5) {
                readOther.checked = true
                writeOther.checked = false
                execOther.checked = true
            }
            if (mainapp.other_nbr === 6) {
                readOther.checked = true
                writeOther.checked = true
                execOther.checked = false
            }
            if (mainapp.other_nbr === 7) {
                readOther.checked = true
                writeOther.checked = true
                execOther.checked = true
            }
        break
        }
    }

    function rwxButtonPressed() {
        // user
        var userReadVal = 0
        var userWriteVal = 0
        var userExecVal = 0
        if (readUser.checked)
            userReadVal = 4
        else
            userReadVal = 0
        if (writeUser.checked)
            userWriteVal = 2
        else
            userWriteVal = 0
        if (execUser.checked)
            userExecVal = 1
        else
            userExecVal = 0

        // group
        var groupReadVal = 0
        var groupWriteVal = 0
        var groupExecVal = 0
        var worldReadVal = 0
        var worldWriteVal = 0
        var worldExecVal = 0
        if (readGroup.checked)
            groupReadVal = 4
        else
            groupReadVal = 0
        if (writeGroup.checked)
            groupWriteVal = 2
        else
            groupWriteVal = 0
        if (execGroup.checked)
            groupExecVal = 1
        else
            groupExecVal = 0
        // world
        if (readOther.checked)
            worldReadVal = 4
        else
            worldReadVal = 0
        if (writeOther.checked)
            worldWriteVal = 2
        else
            worldWriteVal = 0
        if (execOther.checked)
            worldExecVal = 1
        else
            worldExecVal = 0

        //special
        var setuidVal = 0
        var setgidVal = 0
        var stickybitVal = 0
        if (setuid_portrait.checked)
            setuidVal = 4
        else
            setuidVal = 0
        if (setgid_portrait.checked)
            setgidVal = 2
        else
            setgidVal = 0
        if (stickybit_portrait.checked)
            stickybitVal = 1
        else
            stickybitVal = 0
        var specialVal = setuidVal + setgidVal + stickybitVal
        var userVal = userReadVal + userWriteVal + userExecVal
        var groupVal = groupReadVal + groupWriteVal + groupExecVal
        var worldVal = worldReadVal + worldWriteVal + worldExecVal

        var allACL = mainapp.getACL(specialVal, userVal, groupVal, worldVal)

        rwxbutton.text = specialVal.toString(
                    ) + userVal + groupVal + worldVal + " " + allACL
        mainapp.rwxText = rwxbutton.text
        mainapp.special_nbr = rwxbutton.text[0]
        mainapp.user_nbr = rwxbutton.text[1]
        mainapp.group_nbr = rwxbutton.text[2]
        mainapp.other_nbr = rwxbutton.text[3]
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
                text: qsTr("Umask explained")
                onClicked: pageStack.push(Qt.resolvedUrl("Umask.qml"))
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
            spacing: largeScreen ? Theme.paddingLarge : Theme.paddingSmall
            PageHeader {
                title: qsTr("rwx-calc")
            }
            Label {
                x: Theme.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Permissions calculator")
                font.bold: true
            }
            Separator {
                id: splitter
                color: Theme.primaryColor
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
            }
            Row {
                x: Theme.paddingLarge
                width: parent.width
                Label {
                    text: "        User"
                    width: isPortrait ? parent.width / 3 : parent.width / 4
                    color: Theme.secondaryColor
                }
                Label {
                    text: "     Group"
                    width: isPortrait ? parent.width / 3 : parent.width / 4
                    color: Theme.secondaryColor
                }
                Label {
                    text: "    Other"
                    width: isPortrait ? parent.width / 3 : parent.width / 4
                    color: Theme.secondaryColor
                }
                Label {
                    text: qsTr("Special")
                    width: parent.width / 4
                    color: Theme.secondaryColor
                    visible: isLandscape
                }
            }
            Separator {
                id: splitter2
                color: Theme.primaryColor
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                height: isPortrait ? (page.height / page.width > 1.6 ? Theme.itemSizeMedium : Theme.itemSizeSmall) : Theme.paddingLarge * 2.6

                TextSwitch {
                    id: readUser
                    text: "read"
                    rightMargin: Theme.paddingSmall
                    highlighted: checked
                    onClicked: {
                        rwxButtonPressed()
                    }
                    width: isPortrait ? parent.width / 3 : parent.width / 4
                }
                TextSwitch {
                    id: readGroup
                    text: "read"
                    rightMargin: Theme.paddingSmall
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    width: isPortrait ? parent.width / 3 : parent.width / 4
                    onClicked: {
                        rwxButtonPressed()
                    }
                }
                TextSwitch {
                    id: readOther
                    text: "read"
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    width: isPortrait ? parent.width / 3 : parent.width / 4
                    onClicked: {
                        rwxButtonPressed()
                    }
                }
                TextSwitch {
                    id: setuid_landscape
                    text: "setuid"
                    rightMargin: Theme.paddingSmall
                    highlighted: checked
                    onClicked: {
                        setuid_portrait.checked = !setuid_portrait.checked
                        rwxButtonPressed()
                    }
                    width: parent.width / 4
                    visible: isLandscape
                }
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                height: isPortrait ? (page.height / page.width > 1.6 ? Theme.itemSizeMedium : Theme.itemSizeSmall) : Theme.paddingLarge * 2.6
                TextSwitch {
                    id: writeUser
                    text: "write"
                    rightMargin: Theme.paddingSmall
                    highlighted: checked
                    onClicked: {
                        rwxButtonPressed()
                    }
                    width: isPortrait ? parent.width / 3 : parent.width / 4
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
                    width: isPortrait ? parent.width / 3 : parent.width / 4
                }
                TextSwitch {
                    id: writeOther
                    text: "write"
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    width: isPortrait ? parent.width / 3 : parent.width / 4
                    onClicked: {
                        rwxButtonPressed()
                    }
                }
                TextSwitch {
                    id: setgid_landscape
                    text: "setgid"
                    rightMargin: Theme.paddingSmall
                    highlighted: checked
                    onClicked: {
                        setgid_portrait.checked = !setgid_portrait.checked
                        rwxButtonPressed()
                    }
                    width: parent.width / 4
                    visible: isLandscape
                }
            }
            Row {
                x: Theme.paddingSmall
                width: parent.width
                height: isPortrait ? (page.height / page.width > 1.6 ? Theme.itemSizeMedium : Theme.itemSizeSmall) : Theme.paddingLarge * 2.6
                TextSwitch {
                    id: execUser
                    text: "exec"
                    rightMargin: Theme.paddingSmall
                    highlighted: checked
                    width: isPortrait ? parent.width / 3 : parent.width / 4
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
                    width: isPortrait ? parent.width / 3 : parent.width / 4
                }
                TextSwitch {
                    id: execOther
                    text: "exec"
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    width: isPortrait ? parent.width / 3 : parent.width / 4
                    onClicked: {
                        rwxButtonPressed()
                    }
                }
                TextSwitch {
                    id: stickybit_landscape
                    text: "sticky"
                    rightMargin: Theme.paddingSmall
                    highlighted: checked
                    onClicked: {
                        stickybit_portrait.checked = !stickybit_portrait.checked
                        rwxButtonPressed()
                    }
                    width: parent.width / 4
                    visible: isLandscape
                }
            }
            Separator {
                id: splitter3
                color: Theme.primaryColor
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
                visible: isPortrait
            }
            Label {
                x: Theme.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Special")
                color: Theme.secondaryColor
                visible: isPortrait
            }
            Separator {
                id: splitter4
                color: Theme.primaryColor
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
                visible: isPortrait
            }
            Row {
                width: parent.width
                x: Theme.paddingSmall
                TextSwitch {
                    id: setuid_portrait
                    text: "setuid"
                    rightMargin: Theme.paddingSmall
                    highlighted: checked
                    onClicked: {
                        setuid_landscape.checked = !setuid_landscape.checked
                        rwxButtonPressed()
                    }
                    visible: isPortrait
                    width: parent.width / 2.9
                }
                TextSwitch {
                    id: setgid_portrait
                    text: "setgid"
                    rightMargin: Theme.paddingSmall
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    width: parent.width / 3
                    onClicked: {
                        setgid_landscape.checked = !setgid_landscape.checked
                        rwxButtonPressed()
                    }
                    visible: isPortrait
                }
                TextSwitch {
                    id: stickybit_portrait
                    text: "sticky"
                    leftMargin: Theme.paddingSmall
                    highlighted: checked
                    width: parent.width / 3
                    onClicked: {
                        stickybit_landscape.checked = !stickybit_landscape.checked
                        rwxButtonPressed()
                    }
                    visible: isPortrait
                }
            }
            Separator {
                id: splitter5
                color: Theme.primaryColor
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Absolute (octal) and symbolic")
                color: Theme.secondaryColor
                visible: isPortrait
            }
            Row {
                // center it
                x: isLandscape ? (parent.width - rwxbutton.width - rwxText.width)
                                 / 2 : (parent.width - rwxbutton.width) / 2
                width: parent.width
                spacing: Theme.paddingMedium
                Label {
                    id: rwxText
                    text: qsTr("\nAbsolute (octal) & symbolic")
                    color: Theme.secondaryColor
                    visible: isLandscape
                }
                Item {
                    height: Theme.itemSizeMedium
                    width: rwxbutton.width
                    Rectangle {
                        anchors.fill: parent
                        opacity: 0.02
                        radius: 10.0
                    }
                    Label {
                        id: rwxbutton
                        font.pixelSize: Theme.fontSizeHuge
                        color: Theme.highlightColor
                        text: "0000 ---------"
                    }
                }
            }
        }
    }
}
