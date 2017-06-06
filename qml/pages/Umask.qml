import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: umaskPage
    allowedOrientations: Orientation.Portrait | Orientation.Landscape | Orientation.LandscapeInverted
    property bool largeScreen: Screen.sizeCategory === Screen.Large ||
                               Screen.sizeCategory === Screen.ExtraLarge
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
                title: "Umask"
            }
            Label {
                width: parent.width - 40
                x: Theme.paddingLarge
                y: Theme.paddingLarge
                text: "<html>When you create a file or directory, the default file permissions assigned to the \
                file or directory are controlled by the user mask.<br> \
                The user mask is set by the umask command in a user initialization file. You can display the current \
                value of the user mask by typing 'umask' and pressing Return.<br><br> \
                <b>The user mask contains the following octal values:</b> \
                <ul> \
                <li>The first digit sets permissions for the user</li> \
                <li>The second sets permissions for group</li> \
                <li>The third sets permissions for other, also referred to as “world”</li> \
                </ul>"
                font.pixelSize: largeScreen ? Theme.fontSizeSmall : Theme.fontSizeExtraSmall
                wrapMode: Text.Wrap
            }
            Label {
                width: parent.width - 40
                x: Theme.paddingLarge
                y: Theme.paddingLarge
                textFormat: Text.RichText
                text: "<table border='1'> \
                  <tr> \
                    <th>Umask</th> \
                    <th>Created files</th> \
                    <th>Created directories</th> \
                  </tr> \
                  <tr> \
                    <td>000</td> \
                    <td>666(rw-rw-rw-)</td> \
                    <td>777(rwxrwxrwx)</td> \
                  </tr> \
                  <tr> \
                    <td>002</td> \
                    <td>664(rw-rw-r--)</td> \
                    <td>775(rwxrwxr-x)</td> \
                  </tr> \
                  <tr> \
                    <td>022</td> \
                    <td>644(rw-r--r--)</td> \
                    <td>755(rwxr-xr-x)</td> \
                  </tr> \
                  <tr> \
                    <td>027</td> \
                    <td>640(rw-r-----)</td> \
                    <td>750(rwxr-x---)</td> \
                  </tr> \
                  <tr> \
                    <td>077</td> \
                    <td>600(rw-------)</td> \
                    <td>700(rwx------)</td> \
                  </tr> \
                  <tr> \
                    <td>277</td> \
                    <td>400(r--------)</td> \
                    <td>500(r-x------)</td> \
                  </tr> \
                </table><br>"
                font.family: 'monospace'
                font.pixelSize: largeScreen ? Theme.fontSizeSmall : Theme.fontSizeExtraSmall
                wrapMode: Text.Wrap
            }
        }
    }
}
