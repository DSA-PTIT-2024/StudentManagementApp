
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.6
import QtQuick.Controls 6.6
import QtQuick.Layouts 6.6
import QtQuick.Controls.Material
import QtQml.Models
import Qt.labs.qmlmodels

Rectangle {
    id: overviewForm
    width: 1800
    height: 800
    property alias lbSearchingTime: lbSearchingTime
    property alias label4: label4
    property alias lbSortingTime: lbSortingTime
    property alias lbTitleSortingTime: lbTitleSortingTime
    property alias lbTotalRcords: lbTotalRcords
    property alias lbTitleTotalRecords: lbTitleTotalRecords
    property alias lbRecordInformation: lbRecordInformation
    property alias rbResetForm: rbResetForm
    property alias rbRemoveStudent: rbRemoveStudent
    property alias rbUpdateStudent: rbUpdateStudent
    property alias rbInsertStudent: rbInsertStudent
    property alias tfStudentScore: tfStudentScore
    property alias tfStudentClassId: tfStudentClassId
    property alias tfStudentFirstName: tfStudentFirstName
    property alias tfStudentLastName: tfStudentLastName
    property alias tfStudentId: tfStudentId
    property alias lbDetailInfoStudent: lbDetailInfoStudent
    property alias tableViewStudent: tableViewStudent
    property alias cbSortedMethods: cbSortedMethods
    property alias cbReverseNameStudent: cbReverseNameStudent
    property alias cbFilterInfoStudent: cbFilterInfoStudent
    property alias rbSearchInfoStudent: rbSearchInfoStudent
    property alias tfSearchInfoStudent: tfSearchInfoStudent

    Row {
        id: row1
        height: 80
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0

        RowLayout {
            id: row1_1
            width: 820
            height: 60
            anchors.verticalCenter: parent.verticalCenter
            spacing: 0

            TextField {
                id: tfSearchInfoStudent
                width: 800
                font.pixelSize: 18
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                Layout.fillWidth: true
                clip: false
                placeholderText: qsTr("Search ...")
            }

            RoundButton {
                id: rbSearchInfoStudent
                text: ""
                icon.source: "../asset_imports/searchIcon.png"
                flat: true
                layer.smooth: true
                layer.effect: tfSearchInfoStudent
                layer.enabled: true
            }
        }

        RowLayout {
            id: column1_1
            width: 350
            anchors.left: row1_1.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 5
            anchors.topMargin: 0
            anchors.bottomMargin: 0

            ComboBox {
                id: cbFilterInfoStudent
                width: 200
                height: 20
                Layout.fillWidth: true
            }
            CheckBox {
                id: cbReverseNameStudent
                height: 35
                text: qsTr("Let reverse name")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 10
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
                topInset: 0
                bottomInset: 0
                padding: 0
                Layout.fillHeight: false
            }
        }
    }

    Row {
        id: row2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: row1.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 10
        anchors.bottomMargin: 0
        layoutDirection: Qt.LeftToRight

        Column {
            id: column2_1
            anchors.left: parent.left
            anchors.right: column2_2.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 10
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            RowLayout {
                id: rowLayout7
                height: 70
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0

                ComboBox {
                    id: cbSortedMethods
                    width: 400
                    height: 60
                    Layout.preferredWidth: 250
                    Layout.fillWidth: false
                    Layout.fillHeight: false
                }
            }
            TableView {
                id: tableViewStudent
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rowLayout7.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 5
            }
        }
        ColumnLayout {
            id: column2_2
            width: 400
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.topMargin: 0
            spacing: 5

            ColumnLayout {
                id: columnLayout2
                width: 100
                height: 100
                Label {
                    id: lbDetailInfoStudent
                    text: qsTr("Detail Info Student")
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }
                TextField {
                    id: tfStudentId
                    height: 56
                    font.pixelSize: 15
                    verticalAlignment: Text.AlignVCenter
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    placeholderText: qsTr("ID Student")
                }

                RowLayout {
                    id: rowLayout1
                    width: 400
                    Layout.fillHeight: false
                    spacing: 5
                    Layout.fillWidth: true
                    TextField {
                        id: tfStudentLastName
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                        Layout.fillHeight: false
                        Layout.fillWidth: true
                        Layout.rowSpan: 1
                        placeholderText: qsTr("Last Name")
                    }

                    TextField {
                        id: tfStudentFirstName
                        width: 170
                        verticalAlignment: Text.AlignVCenter
                        Layout.fillHeight: false
                        Layout.preferredWidth: 90
                        Layout.fillWidth: true
                        placeholderText: qsTr("First Name")
                    }
                }

                RowLayout {
                    id: rowLayout2
                    Layout.fillHeight: false
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    spacing: 5
                    Layout.fillWidth: true
                    TextField {
                        id: tfStudentClassId
                        verticalAlignment: Text.AlignVCenter
                        Layout.fillWidth: true
                        placeholderText: qsTr("ID Class")
                    }

                    TextField {
                        id: tfStudentScore
                        verticalAlignment: Text.AlignVCenter
                        Layout.preferredWidth: 100
                        Layout.fillWidth: false
                        placeholderText: qsTr("Score")
                    }
                }

                RowLayout {
                    id: rowLayout3
                    width: 100
                    height: 100
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    Layout.fillHeight: false

                    RoundButton {
                        id: rbInsertStudent
                        radius: 5
                        Layout.fillWidth: true
                        text: qsTr("Insert")
                        font.pixelSize: 15
                        leftInset: 0
                        leftPadding: 12
                        font.bold: true
                        icon.source: "../asset_imports/adduserIcon.png"
                        icon.color: "#cc1e00"
                        font.weight: Font.Normal
                        flat: true
                        Material.background: Material.Green
                        Material.foreground: "#FFFFFF"
                    }

                    RoundButton {
                        id: rbUpdateStudent
                        radius: 5
                        text: qsTr("Update")
                        font.pixelSize: 15
                        font.bold: true
                        icon.source: "../asset_imports/edituserIcon.png"
                        icon.color: "#b6a91d"
                        leftInset: 0
                        font.hintingPreference: Font.PreferDefaultHinting
                        Layout.fillWidth: true
                        font.weight: Font.Normal
                        flat: true
                        Material.background: "#7acde5"
                        Material.foreground: "#FFFFFF"
                    }

                    RoundButton {
                        id: rbRemoveStudent
                        radius: 5
                        text: qsTr("Remove")
                        Layout.fillWidth: true
                        font.pixelSize: 15
                        font.bold: true
                        icon.color: "#5dc4a1"
                        icon.source: "../asset_imports/removeuserIcon.png"
                        font.weight: Font.Normal
                        flat: true
                        Material.background: Material.Orange
                        Material.foreground: "#FFFFFF"
                    }

                    RoundButton {
                        id: rbResetForm
                        text: qsTr("Reset")
                        Layout.fillWidth: true
                        font.pixelSize: 15
                        icon.color: "#ddcf3131"
                        font.bold: true
                        font.weight: Font.Normal
                        flat: true
                        contentItem: Text {
                            text: rbResetForm.text
                            font.pixelSize: rbResetForm.font.pixelSize
                            opacity: enabled ? 1.0 : 0.3
                            color: "white"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        background: Rectangle {
                            border.color: "black"
                            border.width: 1
                            anchors.fill: parent
                            radius: 5
                            color: rbResetForm.down ? "lightgrey" : "grey"
                        }
                    }
                }
            }

            ColumnLayout {
                id: columnLayout3
                width: 100
                height: 100
                Layout.topMargin: 30
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Layout.margins: 0
                Layout.fillWidth: true

                Label {
                    id: lbRecordInformation
                    text: qsTr("Record Information")
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    clip: false
                    Layout.fillHeight: false
                    font.bold: true
                    Layout.fillWidth: true
                }

                RowLayout {
                    id: rowLayout4
                    width: 400
                    height: 100
                    Layout.leftMargin: 0
                    Layout.fillHeight: false
                    Layout.fillWidth: true

                    Label {
                        id: lbTitleTotalRecords
                        width: 114
                        text: qsTr("Total records")
                        font.pixelSize: 20
                        Layout.fillWidth: true
                    }

                    Rectangle {
                        id: rectangle
                        width: 40
                        height: 30
                        Layout.fillWidth: true
                        Layout.leftMargin: 0

                        Label {
                            id: lbTotalRcords
                            text: qsTr("180")
                            anchors.fill: parent
                            font.pixelSize: 20
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
                RowLayout {
                    id: rowLayout5
                    width: 400
                    height: 100
                    Layout.leftMargin: 0
                    Layout.fillHeight: false
                    Layout.fillWidth: true

                    Label {
                        id: lbTitleSortingTime
                        width: 114
                        text: qsTr("Latest sorting time")
                        font.pixelSize: 20
                        verticalAlignment: Text.AlignVCenter
                        Layout.fillWidth: true
                    }

                    Rectangle {
                        id: rectangle5
                        width: 40
                        height: 30
                        Layout.fillWidth: true
                        Layout.leftMargin: 0

                        Label {
                            id: lbSortingTime
                            text: qsTr("180")
                            anchors.fill: parent
                            font.pixelSize: 20
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }

                RowLayout {
                    id: rowLayout6
                    width: 400
                    height: 100
                    Layout.leftMargin: 0
                    Layout.fillHeight: false
                    Layout.fillWidth: true

                    Label {
                        id: label4
                        width: 114
                        text: qsTr("Latest searching time")
                        font.pixelSize: 20
                        verticalAlignment: Text.AlignVCenter
                        Layout.fillWidth: true
                    }

                    Rectangle {
                        id: rectangle6
                        width: 40
                        height: 30
                        Layout.fillWidth: true
                        Layout.leftMargin: 0

                        Label {
                            id: lbSearchingTime
                            text: qsTr("180")
                            anchors.fill: parent
                            font.pixelSize: 20
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }
    }

    Item {
        id: __materialLibrary__
    }
}
