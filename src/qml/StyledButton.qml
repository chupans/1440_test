import QtQuick
import QtQuick.Controls
import GlobalStyle

RoundButton  {
    property bool isAccent: false;
    property bool isAlt: false;
    background: Rectangle {
        color: isAccent ? (isAlt ? GlobalStyle.negativeColor : GlobalStyle.positiveColor) : GlobalStyle.neutralColor
        radius: isAccent ? 14 : 5
    }
}
