import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window  {
    id: mainWindow

    signal addItemRequested(string name, string address)
    signal connectRequested(int modelRow)

    signal connectionFinished(bool success)

    property int firstRowHeight: 50
    property int firstRowWidth: 250

    onConnectionFinished: serverScreen.state = "connected"
    width: 900
    height: 600
    minimumWidth: 600
    minimumHeight: 400
    visible: true
    //flags: Qt.FramelessWindowHint // Disabled because resizing and movement controls are not implemented

    GridLayout {
        anchors.fill: parent
        columns: 2
        columnSpacing: 0
        rowSpacing: 0
        BorderRectangle {
            Layout.preferredWidth: mainWindow.firstRowWidth
            Layout.preferredHeight: mainWindow.firstRowHeight

            RowLayout {
                anchors.fill: parent
                anchors.margins: 5
                anchors.leftMargin: 15
                anchors.rightMargin: anchors.leftMargin
                Text { text: "Servers"; font.pointSize: 12; }
                Item { Layout.fillWidth: true }
                ToolButton { text: "+"; onClicked: addDialog.state = "open"; font.pointSize: 14 }
            }
        }
        BorderRectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: mainWindow.firstRowHeight
            RowLayout {
                anchors.fill: parent
                anchors.margins: 5
                anchors.leftMargin: 15
                anchors.rightMargin: anchors.leftMargin
                ToolButton { text: "0/1"; onClicked: serverScreen.state = "disconnected" }
                ToolButton { text: "Refresh" }
                Item { Layout.fillWidth: true }
                StyledButton {
                    text: "Connect"
                    isAccent: true
                    onClicked: mainWindow.connectRequested(serversListView.currentIndex)
                    enabled: serversListView.currentIndex !== -1 && serverScreen.state !== "connected"
                }
            }
        }
        BorderRectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: mainWindow.firstRowWidth
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 20
                ColumnLayout {
                    Layout.fillWidth: true
                    id: addDialog
                    states: [
                        State {
                            name: "closed"
                            PropertyChanges { target: addDialog; visible: false }
                        },
                        State {
                            name: "open"
                            PropertyChanges { target: addDialog; visible: true }
                        }
                    ]
                    state: "closed"

                    RowLayout {
                        ConnectionIndicator { isUnknown: true }
                        TextField { id: newServerNameField; Layout.fillWidth: true; placeholderText: "Server ip"; }
                    }
                    RowLayout {
                        Item { Layout.fillWidth: true }
                        StyledButton { text: "Cancel"; onClicked: addDialog.state = "closed" }
                        StyledButton { text: "Add";
                            onClicked: {
                                mainWindow.addItemRequested(newServerNameField.text,
                                                            newServerNameField.text.toLowerCase() + ".1440.space");
                            }
                            enabled: newServerNameField.text !== ""
                        }
                    }
                }
                ListView {
                    id: serversListView

                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    model: serversModel
                    delegate: ServerListDelegate {
                        name: model.name
                        address: model.address
                        isConnected: model.isOnline
                        users: model.users
                        width: ListView.view.width
                    }
                }
            }
        }
        BorderRectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 5
                anchors.leftMargin: 15
                anchors.rightMargin: anchors.leftMargin
                ServerScreen {
                    id: serverScreen

                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                StyledButton {
                    Layout.alignment: Qt.AlignRight

                    isAccent: true
                    isAlt: true
                    text: "Close SREDA"; onClicked: mainWindow.close()
                }
            }
        }
    }
}
