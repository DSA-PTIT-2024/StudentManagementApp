
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.6
import QtQuick.Controls 6.6
import QtQuick.Layouts 6.6
import StudentManagement
import QtCharts

Rectangle {
    id: mainBackground
    width: Constants.width
    height: Constants.height
    property alias tabbuttonOverview: tabbuttonOverview
    property alias tabbuttonStatistics: tabbuttonStatistics
    property alias rbImportData: rbImportData
    property alias rbExportData: rbExportData
    property alias cbDataStructures: cbDataStructures

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20

        Row {
            id: rowLayout
            height: 80
            Layout.rightMargin: 0
            Layout.leftMargin: 0
            Layout.fillWidth: true
            spacing: 5

            TabBar {
                id: tabBar
                width: 300
                height: 50
                anchors.verticalCenter: parent.verticalCenter
                Layout.fillWidth: false

                TabButton {
                    id: tabbuttonOverview
                    text: qsTr("Overview")
                    font.pixelSize: 25
                }

                TabButton {
                    id: tabbuttonStatistics
                    text: qsTr("Statistics")
                    font.pixelSize: 25
                }
            }

            ComboBox {
                id: cbDataStructures
                width: 300
                height: 50
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: rowLayout1.left
                anchors.rightMargin: 10
            }

            RowLayout {
                id: rowLayout1
                width: 300
                height: 100
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
                spacing: 5
                RoundButton {
                    id: rbExportData
                    width: 52
                    radius: 10
                    text: "Export"
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 18
                    antialiasing: false
                    Layout.rowSpan: 1
                    Layout.rightMargin: 0
                    Layout.columnSpan: 1
                    Layout.preferredWidth: 150
                }
                RoundButton {
                    id: rbImportData
                    width: 52
                    radius: 10
                    text: "Import"
                    font.pixelSize: 18
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    wheelEnabled: false
                    highlighted: false
                    Layout.preferredWidth: 150
                    flat: false
                }
            }
        }

        SwipeView {
            id: swipeView
            clip: true
            rightInset: 20
            leftInset: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            interactive: false
            Layout.topMargin: 0
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: tabBar.currentIndex

            Overview {
                id: tabOverview
            }

            Statistics {
                id: tabStatistics
            }
        }
    }
}
