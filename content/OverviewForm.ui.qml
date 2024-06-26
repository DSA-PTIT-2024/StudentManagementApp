
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

Rectangle {
    id: overviewForm
    width: 1800
    height: 800
    property alias rowLayout1: rowLayout1
    property alias rbClearTable: rbClearTable
    property alias row2InGrid: row2InGrid
    property alias hhvTableViewStudent: hhvTableViewStudent
    property alias columnLayout2: columnLayout2
    property alias column2_2: column2_2
    property alias rowLayout3: rowLayout3
    property alias rowLayout2: rowLayout2
    property alias columnLayout3: columnLayout3
    property alias rowLayout4: rowLayout4
    property alias rectangle: rectangle
    property alias rowLayout5: rowLayout5
    property alias rectangle5: rectangle5
    property alias rowLayout6: rowLayout6
    property alias rectangle6: rectangle6
    property alias rowLayout7: rowLayout7
    property alias column2_1: column2_1
    property alias row2: row2
    property alias row1: row1
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

    RowLayout {
        id: row1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 20
        anchors.bottomMargin: 5
        TextField {
            id: tfSearchInfoStudent
            width: 800
            height: 50
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.family: "SF Pro Display"
            Layout.preferredHeight: -1
            Layout.fillHeight: false
            Layout.fillWidth: true
            clip: false
            placeholderText: qsTr("Search ...")
        }

        RoundButton {
            id: rbSearchInfoStudent
            text: ""
            Layout.fillHeight: false
            icon.source: "../asset_imports/searchIcon.png"
            flat: true
        }

        ComboBox {
            id: cbFilterInfoStudent
            width: 200
            height: 20
            font.family: "SF Pro Display"
            Layout.preferredWidth: 250
            Layout.fillWidth: false
        }
        CheckBox {
            id: cbReverseNameStudent
            height: 35
            text: qsTr("Let reverse name")
            font.pixelSize: 10
            font.family: "SF Pro Display"
            antialiasing: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
            topInset: 0
            bottomInset: 0
            padding: 0
            Layout.fillHeight: false
        }
    }

    RowLayout {
        id: row2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: row1.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 5
        anchors.bottomMargin: 0
        layoutDirection: Qt.LeftToRight
        ColumnLayout {
            id: column2_1
            clip: true
            Layout.rightMargin: 5
            spacing: 0
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.fillHeight: true
            Layout.fillWidth: true
            GridLayout {
                id: rowLayout7
                height: 70
                Layout.preferredWidth: 65
                Layout.fillWidth: true
                ComboBox {
                    id: cbSortedMethods
                    width: 400
                    height: 60
                    font.family: "SF Pro Display"
                    Layout.preferredWidth: 250
                    Layout.fillWidth: false
                    Layout.fillHeight: false
                    Layout.row: 0
                    Layout.column: 0
                    textRole: "sortedMethod"
                    model: ListModel {
                        ListElement {
                            sortedMethod: "Insertion Sort"
                            value: 0
                        }
                        ListElement {
                            sortedMethod: "Selection Sort"
                            value: 1
                        }
                        ListElement {
                            sortedMethod: "Bubble Sort"
                            value: 2
                        }
                        ListElement {
                            sortedMethod: "Quick Sort"
                            value: 3
                        }
                        ListElement {
                            sortedMethod: "Heap Sort"
                            value: 4
                        }
                        ListElement {
                            sortedMethod: "Merge Sort"
                            value: 55
                        }
                    }
                }

                Row {
                    id: row2InGrid
                    width: 200
                    layoutDirection: Qt.RightToLeft
                    Layout.fillWidth: true
                    Layout.row: 0
                    Layout.column: 1

                    RoundButton {
                        id: rbClearTable
                        width: 100
                        radius: 5
                        text: qsTr("Clear All")
                        font.pixelSize: 15
                        font.family: "SF Pro Display"
                        rightInset: 0
                        antialiasing: true
                        leftInset: 0
                        flat: true
                        clip: true
                        Material.background: "#d9d2e9"
                    }
                }
            }

            HorizontalHeaderView {
                id: hhvTableViewStudent
                Layout.topMargin: 5
                Layout.preferredWidth: 40
                Layout.fillHeight: false
                Layout.fillWidth: true
                syncView: tableViewStudent
            }

            TableView {
                id: tableViewStudent
                Layout.rightMargin: 0
                resizableColumns: true
                pixelAligned: true
                boundsMovement: Flickable.StopAtBounds
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                Layout.bottomMargin: 10
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
        ColumnLayout {
            id: column2_2
            Layout.topMargin: 10
            Layout.fillWidth: false
            Layout.alignment: Qt.AlignRight | Qt.AlignTop
            Layout.preferredWidth: 450
            spacing: 5

            ColumnLayout {
                id: columnLayout2
                width: 100
                height: 100
                Layout.fillWidth: true
                spacing: 10
                Label {
                    id: lbDetailInfoStudent
                    text: qsTr("Detail Info Student")
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    Layout.preferredWidth: 450
                    Layout.fillWidth: true
                    font.family: "SF Pro Display"
                    font.bold: true
                }
                TextField {
                    id: tfStudentId
                    height: 56
                    font.pixelSize: 15
                    verticalAlignment: Text.AlignVCenter
                    font.family: "SF Pro Display"
                    font.capitalization: Font.AllUppercase
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                    Layout.topMargin: 10
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
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.family: "SF Pro Display"
                        font.capitalization: Font.AllUppercase
                        Layout.fillHeight: false
                        Layout.fillWidth: true
                        Layout.rowSpan: 1
                        placeholderText: qsTr("Last Name")
                    }

                    TextField {
                        id: tfStudentFirstName
                        width: 170
                        verticalAlignment: Text.AlignVCenter
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.family: "SF Pro Display"
                        font.capitalization: Font.AllUppercase
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
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.family: "SF Pro Display"
                        font.styleName: "Regular"
                        font.capitalization: Font.AllUppercase
                        Layout.fillWidth: true
                        placeholderText: qsTr("ID Class")
                    }

                    TextField {
                        id: tfStudentScore
                        verticalAlignment: Text.AlignVCenter
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.family: "SF Pro Display"
                        font.capitalization: Font.AllUppercase
                        Layout.preferredWidth: 100
                        Layout.fillWidth: true
                        placeholderText: qsTr("Score")
                    }
                }

                RowLayout {
                    id: rowLayout3
                    width: 100
                    height: 100
                    spacing: 2
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    Layout.fillHeight: false

                    RoundButton {
                        id: rbInsertStudent
                        radius: 5
                        Layout.fillWidth: true
                        text: qsTr("Insert")
                        font.pixelSize: 15
                        font.family: "SF Pro Display"
                        topInset: 6
                        rightInset: 6
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
                        font.family: "SF Pro Display"
                        font.bold: true
                        icon.source: "../asset_imports/edituserIcon.png"
                        icon.color: "#b6a91d"
                        leftInset: 6

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
                        font.family: "SF Pro Display"
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
                        radius: 5
                        text: qsTr("Reset")
                        Layout.fillWidth: true
                        font.pixelSize: 15
                        Layout.fillHeight: false
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
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
                            font.family: "SF Pro Display"
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
                    font.styleName: "Black Italic"
                    font.family: "SF Pro Display"
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
                        font.family: "SF Pro Display"
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
                            font.family: "SF Pro Display"
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
                        font.styleName: "Black Italic"
                        font.family: "SF Pro Display"
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
                            font.family: "SF Pro Display"
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
                        font.family: "SF Pro Display"
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
                            font.family: "SF Pro Display"
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
