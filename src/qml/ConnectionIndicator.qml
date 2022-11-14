import QtQuick
import GlobalStyle

Rectangle {
    id: root

    property bool isOnline: false
    property bool isUnknown: false
    property int size: 10

    width: size
    height: size
    radius: size / 2
    border.color: "black"
    border.width: isUnknown ? 1 : 0
    color: isUnknown ? GlobalStyle.neutralColor : isOnline ? GlobalStyle.positiveColor : GlobalStyle.negativeColor
}
