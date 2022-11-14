import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import GlobalStyle

BaseDelegate {
    id: root

    property alias name: nameLabel.text
    property alias address: addressLabel.text
    property var users: []
    property bool isConnected: false

    withBorder: false
    height: 55
    selectable: true
    hoverEnabled: true

    GridLayout {
        columns: 3
        anchors.fill: parent

        ConnectionIndicator {
            isOnline: isConnected
        }
        Label {
            id: nameLabel

            Layout.fillWidth: true
            font.pointSize: 10
        }
        Label {
            id: usersLabel

            text: {
                var usersCount = root.users.length
                if (usersCount === 1)
                {
                    return root.users[0]
                }
                else if (usersCount === 0)
                {
                    return ""
                }
                else
                {
                    return usersCount;
                }
            }

            visible: root.users.length > 0

            topInset: -2
            leftInset: -5
            rightInset: -5
            bottomInset: -2
            Layout.alignment: Qt.AlignRight
            color: GlobalStyle.altTextColor
            background : Rectangle { color: GlobalStyle.altTextBgColor; radius: 4}
        }
        Label {
            id: addressLabel
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.row: 1
            Layout.column: 1
            Layout.alignment: Qt.AlignTop
            color: GlobalStyle.textColor
        }
    }
}
