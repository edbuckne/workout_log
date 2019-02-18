import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: idPage
    width: 600
    height: 400
    property alias button: button
    property alias model: listView.model
    property string exerciseName: ""
    property alias comboBox: comboBox
    //property alias eType:

    title: qsTr("Exercises")

    ListView {
        id: listView
        y: 0
        height: 160
        width: 306
        anchors.rightMargin: 4
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 48
        z: 2
        clip: true
        model: ListModel {
            id: listModel
            /*ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }*/
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

    ScrollView {
        id: scrollView
        y: 0
        height: 400
        anchors.left: parent.left
        anchors.leftMargin: 280
        anchors.right: parent.right
        anchors.rightMargin: 10

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

            TextInput {
                id: textInput
                y: 0
                text: qsTr("Enter here")
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
            text: qsTr("Workout Name")
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 12
        }

        Rectangle {
            id: rectangle1
            y: 11
            height: 30
            color: "#aac57f"
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

    Rectangle {
        id: rectangle4
        x: 5
        y: 13
        width: 269
        height: 29
        color: "#d3b5b5"

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








/*##^## Designer {
    D{i:5;anchors_height:20;anchors_width:80;anchors_x:60;anchors_y:12}D{i:13;anchors_x:0}
D{i:12;anchors_width:203;anchors_x:96}D{i:14;anchors_x:14}D{i:15;anchors_width:202;anchors_x:98}
D{i:17;anchors_x:293}D{i:18;anchors_width:275;anchors_x:35}D{i:21;anchors_x:0}D{i:20;anchors_width:203;anchors_x:96}
D{i:22;anchors_x:293}D{i:23;anchors_x:293}D{i:25;anchors_x:0;anchors_y:0}D{i:24;anchors_width:203;anchors_x:96}
D{i:11;anchors_width:304;anchors_x:286}
}
 ##^##*/
