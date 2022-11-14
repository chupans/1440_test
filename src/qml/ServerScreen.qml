import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import GlobalStyle

Item {
    property bool isConnected: false


    states: [
        State {
            name: "connected"
            PropertyChanges { target: disconnectedScreen; visible: false }
            PropertyChanges { target: connectedScreen; visible: true }
        },
        State {
            name: "disconnected"
            PropertyChanges { target: connectedScreen; visible: false }
            PropertyChanges { target: disconnectedScreen; visible: true }
        }
    ]

    state: "disconnected"

    RowLayout {
        id: disconnectedScreen
        anchors.fill: parent
    }

    RowLayout {
        id: connectedScreen
        anchors.fill: parent
        spacing: 20

        ColumnLayout {
            Layout.fillWidth: true

            spacing: 20

            Label {
                Layout.alignment: Qt.AlignHCenter
                text: "Remote servers"
                font.pointSize: 12
            }
            ListView {
                Layout.fillWidth: true
                Layout.fillHeight: true

                spacing: 5

                model: ListModel {
                    ListElement { name: 'localhost'; addr: "127.0.0.1"; isOnline: true }
                    ListElement { name: 'SPM-1'; addr: "spm.sreda.1440.space"; isOnline: true }
                }

                delegate: BaseDelegate {
                    width: ListView.view.width
                    height: 30

                    hoverEnabled: true

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        ConnectionIndicator { isOnline: model.isOnline }
                        Label { Layout.fillWidth: true; text: model.name }
                        Label { text: model.addr; color: GlobalStyle.textColor }
                    }
                }
            }

            Label {
                Layout.alignment: Qt.AlignHCenter
                text: "Users"
                font.pointSize: 12
            }
            ListView {
                Layout.fillWidth: true
                Layout.fillHeight: true

                spacing: 5

                model: ListModel {
                    ListElement { name: 'J.Monday'; addr: "192.168.34.245" }
                    ListElement { name: 'J.Tuesday'; addr: "192.168.34.245" }
                    ListElement { name: 'J.Wednesday'; addr: "192.168.34.245" }
                    ListElement { name: 'J.Hammond'; addr: "192.168.34.245" }
                }

                delegate: BaseDelegate {
                    width: ListView.view.width
                    height: 30

                    hoverEnabled: true

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        Label { text: model.name }
                        Label { text: model.addr; Layout.alignment: Qt.AlignRight; color: GlobalStyle.textColor }
                    }
                }
            }
        }

        ColumnLayout {
            spacing: 20
            Layout.maximumWidth: 200
            Label {
                Layout.alignment: Qt.AlignHCenter
                text: "Modules"
                font.pointSize: 12
            }
            ListView {
                Layout.fillWidth: true
                Layout.fillHeight: true

                spacing: 5

                model: ListModel {
                    ListElement { name: 'Timbrel ETH'; isOnline: true }
                    ListElement { name: 'Timbrel IXXAT-0'; isOnline: true }
                    ListElement { name: 'Timbrel IXXAT-1'; isOnline: true }
                    ListElement { name: 'Module'; isOnline: true }
                    ListElement { name: 'Module'; isOnline: true }
                    ListElement { name: 'Module'; isOnline: true }
                    ListElement { name: 'Module'; isOnline: true }
                }

                delegate: BaseDelegate {
                    width: ListView.view.width
                    height: 30

                    hoverEnabled: true

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        ConnectionIndicator { isOnline: model.isOnline }
                        Label { Layout.fillWidth: true; text: model.name }
                    }
                }
            }
        }
    }
}
