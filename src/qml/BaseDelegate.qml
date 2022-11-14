import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import GlobalStyle

Rectangle {
    id: root

    property alias hoverEnabled: mouseArea.hoverEnabled
    property bool selectable: false
    property bool withBorder: true

    property bool isSelected: state === "selected"
    property bool isHovered: state === "hovered"
    property bool _isSelected: ListView.isCurrentItem

    height: 50
    radius: 5
    border.width: withBorder ? 1 : 0
    border.color: GlobalStyle.borderColor

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    states: [
        State {
            name: "hovered"
            when: root.hoverEnabled && (!root.selectable || !root._isSelected) && mouseArea.containsMouse
            PropertyChanges {
                target: root
                border.width: withBorder ? 5 : 0

            }
        },
        State {
            name: "selected"
            when: root.selectable && root._isSelected
        }
    ]
    state: ""

}
