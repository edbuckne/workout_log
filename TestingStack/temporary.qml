import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: idPage
    width: 640
    height: 480
    property alias descriptionInput: descriptionInput
    property alias weightTypeInput: weightTypeInput
    property alias exerciseNameInput: exerciseNameInput

    property alias button: button
    property alias listModel: listView.model
    property string exerciseName: ""
    property alias comboBox: comboBox

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
            // Header block that says Create New Exercise
            id: rectangle1
            height: 30
            color: "#aac57f" // Greenish
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

        Text {
            // Exercise Name text
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
            // Exercise Name input block
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
                id: exerciseNameInput
                y: 0
                width: 62
                height: 14
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
            // Text that says Exercise Type
            id: element1
            y: 96
            text: qsTr("Exercise Type")
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 12
        }

        ComboBox {
            // Allows the user to pick, from a list, the type of exercise
            id: comboBox
            y: 88
            height: 30
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.right: parent.right
            anchors.rightMargin: 5
            model: ["Strength", "Duration", "Agility"]
        }

        Text {
            // Text that says weight type
            id: element3
            x: 8
            y: 137
            height: 15
            text: qsTr("Weight Type")
            font.pixelSize: 12
            anchors.left: parent.left
            anchors.leftMargin: 5
        }

        Rectangle {
            // Weight type input block
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
                id: weightTypeInput
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
            // Text that says Description (Optional)
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
            // Description input block
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
                id: descriptionInput
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

        Button {
            // Button to press when finished filling out information
            id: button
            x: -36
            y: 340
            width: 100
            height: 28
            text: qsTr("Create Exercise")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        // List of exercises header block
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
            ListElement {
                exerciseId: 1
                name: "Test"
                exercise_type: "Blue"
                weight_type: "BB"
                description: "blah"
            }
        }
        delegate: Item {
            x: 5
            width: 80
            height: 40

            Row {
                id: row1

                Rectangle {
                    id: colorSquare
                    width: 40
                    height: 40
                    color: exercise_type
                }

                Text {
                    text: name
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }

                spacing: 10
            }
        }
        MouseArea {
            anchors.fill: parent
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
