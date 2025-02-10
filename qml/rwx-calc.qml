

/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
import QtQuick 2.5
import Sailfish.Silica 1.0
import "pages"
import "sf-docked-tab-bar"

ApplicationWindow {
    id: mainapp
    property string rwxText: '0000 ----------'
    property int special_nbr: 0
    property int user_nbr: 0
    property int group_nbr: 0
    property int other_nbr: 0
    signal reReadInfo

    property alias tabBar: _tabBar
    readonly property string mainPageName: "MainPage"

    function getACL(specialval, userval, groupval, otherval) {
        var userACL = "---"
        var groupACL = "---"
        var otherACL = "---"
        if (userval === 0)
            userACL = "---"
        if (userval === 1)
            userACL = "--x"
        if (userval === 2)
            userACL = "-w-"
        if (userval === 3)
            userACL = "-wx"
        if (userval === 4)
            userACL = "r--"
        if (userval === 5)
            userACL = "r-x"
        if (userval === 6)
            userACL = "rw-"
        if (userval === 7)
            userACL = "rwx"
        if (groupval === 0)
            groupACL = "---"
        if (groupval === 1)
            groupACL = "--x"
        if (groupval === 2)
            groupACL = "-w-"
        if (groupval === 3)
            groupACL = "-wx"
        if (groupval === 4)
            groupACL = "r--"
        if (groupval === 5)
            groupACL = "r-x"
        if (groupval === 6)
            groupACL = "rw-"
        if (groupval === 7)
            groupACL = "rwx"
        if (otherval === 0)
            otherACL = "---"
        if (otherval === 1)
            otherACL = "--x"
        if (otherval === 2)
            otherACL = "-w-"
        if (otherval === 3)
            otherACL = "-wx"
        if (otherval === 4)
            otherACL = "r--"
        if (otherval === 5)
            otherACL = "r-x"
        if (otherval === 6)
            otherACL = "rw-"
        if (otherval === 7)
            otherACL = "rwx"
        if (specialval === 4 || specialval === 5 || specialval === 7
                || specialval === 6)
            // setuid
            if (userval === 7 || userval === 5 || userval === 3
                    || userval === 1)
                // exec bit on user
                userACL = userACL.substring(0, 2) + "s" + userACL.substring(3)
            else
                userACL = userACL.substring(0, 2) + "S" + userACL.substring(3)
        if (specialval === 2 || specialval === 6 || specialval === 7
                || specialval === 3)
            // setgid
            if (groupval === 7 || groupval === 5 || groupval === 3
                    || groupval === 1)
                // exec bit on group
                groupACL = groupACL.substring(0,
                                              2) + "s" + groupACL.substring(3)
            else
                groupACL = groupACL.substring(0,
                                              2) + "S" + groupACL.substring(3)
        if (specialval === 1 || specialval === 3 || specialval === 5
                || specialval === 7)
            // stickybit
            if (otherval === 7 || otherval === 5 || otherval === 3
                    || otherval === 1)
                // exec bit on other
                otherACL = otherACL.substring(0,
                                              2) + "t" + otherACL.substring(3)
            else
                otherACL = otherACL.substring(0,
                                              2) + "T" + otherACL.substring(3)
        var allACL = userACL + groupACL + otherACL
        return allACL
    }

    allowedOrientations: defaultAllowedOrientations
    _defaultPageOrientations: defaultAllowedOrientations

    initialPage: Component {
        MainPage {}
    }
    DockedTabBar {
        id: _tabBar
        enabledOnPage: "MainPage"
        currentSelection: 0

        DockedTabButton {
            icon.source: "image://theme/icon-m-other"
            label: qsTr("Symbolic")
            fontSize: Theme.fontSizeSmall
        }
        DockedTabButton {
            icon.source: "image://theme/icon-m-dialpad"
            label: qsTr("Octal")
            fontSize: Theme.fontSizeSmall
        }
    }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
}
