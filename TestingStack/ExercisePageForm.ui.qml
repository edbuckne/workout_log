import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: idPage
    width: 640
    height: 480

    property alias button: button
    property alias model: listView.model
    property string exerciseName: ""
    property alias comboBox: comboBox

    property alias textInput: textInput
    property alias textInput1: textInput1
    property alias textInput2: textInput2

    property alias mouseClick: mouseClick
    property alias mouseClick1: mouseClick1
    property alias mouseClick2: mouseClick2

    title: qsTr("Exercises")

    ScrollView {
        id: scrollView
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 320

        Rectangle {
            id: rectangle
            y: 47
            height: 30
            color: "#ffffff"
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.right: parent.right
            anchors.rightMargin: 5
            border.color: "#524d4d"

            MouseArea {
                id: mouseClick
                anchors.fill: parent
            }

            TextInput {
                id: textInput
                y: 0
                width: 62
                height: 14
                //text: qsTr("Enter here")
                text: "Enter here"
                anchors.verticalCenterOffset: 0
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
                onEditingFinished: idPage.exerciseName = text
            }
        }

        Text {
            id: element1
            y: 96
            text: qsTr("Exercise Type")
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 12
        }

        ComboBox {
            id: comboBox
            y: 88
            height: 30
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.right: parent.right
            anchors.rightMargin: 5
            model: ["Strength", "Duration", "Agility"]
        }

        Button {
            id: button
            x: -36
            y: 340
            width: 100
            height: 28
            text: qsTr("Create Exercise")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: element
            x: 13
            y: 56
            height: 15
            text: qsTr("Exercise Name")
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 12
        }

        Rectangle {
            id: rectangle1
            height: 30
            color: "#aac57f"
            anchors.top: parent.top
            anchors.topMargin: 10
            border.width: 2
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0

            Text {
                id: element2
                x: 144
                y: 8
                text: qsTr("Create New Exercise")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 12
            }
        }

        Rectangle {
            id: rectangle2
            x: -2
            y: 129
            height: 30
            color: "#ffffff"

            MouseArea {
                id: mouseClick1
                anchors.fill: parent
            }

            TextInput {
                id: textInput1
                y: 0
                text: qsTr("Enter here")
                font.pixelSize: 12
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
            }

            anchors.rightMargin: 5
            border.color: "#524d4d"
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 100
        }

        Text {
            id: element3
            x: 8
            y: 137
            height: 15
            text: qsTr("Weight Type")
            font.pixelSize: 12
            anchors.left: parent.left
            anchors.leftMargin: 5
        }

        Text {
            id: element4
            x: 16
            y: 182
            height: 15
            text: qsTr("Description (Optional)")
            font.pixelSize: 12
            anchors.left: parent.left
            anchors.leftMargin: 5
        }

        Rectangle {
            id: rectangle3
            x: 3
            y: 203
            height: 131
            color: "#ffffff"

            MouseArea {
                anchors.fill: parent
                id: mouseClick2
            }

            TextInput {
                id: textInput2
                text: qsTr("Enter here")
                anchors.top: parent.top
                anchors.topMargin: 5
                font.pixelSize: 12
                anchors.left: parent.left
                anchors.leftMargin: 5
            }

            anchors.rightMargin: 5
            border.color: "#524d4d"
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 5
        }
    }

    ListView {
        // List of existing exercises
        id: listView
        y: 0
        height: 160
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 320
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 50
        z: 2
        clip: true
        model: ListModel {
            id: listModel
        }
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1

                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                }

                Text {
                    text: name
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }

                spacing: 10
            }
        }
    }

    Rectangle {
        id: rectangle4
        x: 320
        y: 10
        height: 30
        color: "#aac57f"
        border.width: 2
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 320

        Text {
            id: element5
            x: 123
            y: 8
            text: qsTr("List of Exercises")
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
        }
    }
}
