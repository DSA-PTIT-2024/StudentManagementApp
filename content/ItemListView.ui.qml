

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.6
import QtQuick.Controls 6.6
import QtQuick.Layouts 6.6

Rectangle {
    width: 600
    height: 120
    property alias rtStudentScore: rtStudentScore
    property alias lbDetailStudentId: lbDetailStudentId
    property alias lbStudentId: lbStudentId
    property alias rowLayout2: rowLayout2
    property alias lbDetailClass: lbDetailClass
    property alias lbStudentClass: lbStudentClass
    property alias rowLayout1: rowLayout1
    property alias lbDetailFullName: lbDetailFullName
    property alias lbFullName: lbFullName
    property alias rowLayout: rowLayout
    property alias columnLayout: columnLayout
    property alias lbStudentScore: lbStudentScore
    property alias gridLayout: gridLayout
    clip: true
    color: "#ebebeb"
    border.width: 1
    radius: 20
    GridLayout {
        id: gridLayout
        anchors.fill: parent
        columns: 2

        Rectangle {
            id: rtStudentScore
            width: 100
            height: 100
            color: "#1cc58f"
            radius: 100
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: Qt.rgba(Math.random(), Math.random(),
                                   Math.random(), 1)
                }

                GradientStop {
                    position: 1
                    color: Qt.rgba(Math.random(), Math.random(),
                                   Math.random(), 1)
                }
                orientation: Gradient.Vertical
            }
            Layout.minimumHeight: 100
            Layout.minimumWidth: 100
            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            clip: true
            Layout.leftMargin: 15

            Label {
                id: lbStudentScore
                width: 50
                height: 30
                text: qsTr("Label")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        ColumnLayout {
            id: columnLayout
            width: 100
            height: 100
            spacing: 15

            RowLayout {
                id: rowLayout
                width: 100
                height: 100

                Label {
                    id: lbFullName
                    text: qsTr("Full Name:")
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillWidth: false
                }

                Label {
                    id: lbDetailFullName
                    text: qsTr("Label")
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                id: rowLayout1
                width: 100
                height: 100

                Label {
                    id: lbStudentClass
                    text: qsTr("Class:")
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 11
                    font.bold: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillWidth: false
                }

                Label {
                    id: lbDetailClass
                    text: qsTr("Label")
                    font.pixelSize: 12
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
            }

            RowLayout {
                id: rowLayout2
                width: 100
                height: 100

                Label {
                    id: lbStudentId
                    text: qsTr("Student ID:")
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Label {
                    id: lbDetailStudentId
                    text: qsTr("S")
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    Layout.fillWidth: true
                }
            }
        }
    }
}
