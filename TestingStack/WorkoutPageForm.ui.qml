import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: idPage
    width: 640
    height: 480
    title: "Workouts"

    ScrollView { // Block to create a new workout
        id: scrollView
        y: 0
        height: 400
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 300

        Rectangle { // Create new workout header block
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
                text: qsTr("Create New Workout")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 12
            }
        }

        Text { // Text that simply says Workout Name
            id: element
            x: 13
            y: 56
            height: 15
            text: qsTr("Workout Name")
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 12
        }

        Rectangle { // Workout name input block
            id: rectangle2
            x: -2
            height: 30
            color: "#ffffff"
            anchors.top: parent.top
            anchors.topMargin: 50

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

        Button {
            id: button
            x: -36
            y: 340
            width: 100
            height: 28
            text: qsTr("Create Workout")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle { // List of exercises header block
            id: rectangle3
            y: 11
            height: 30
            color: "#dee2d8"
            anchors.left: scrollViewExercises.left
            anchors.leftMargin: 0
            anchors.right: scrollViewExercises.right
            anchors.rightMargin: 0
            anchors.bottom: scrollViewExercises.top
            anchors.bottomMargin: 0

            Text {
                id: element3
                x: 144
                y: 8
                text: qsTr("List of Exercises")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 12
            }
        }

        ScrollView { // Holds a scrollable list of checkable exercise items
            id: scrollViewExercises
            height: 196
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 125

            ListView {
                anchors.fill: parent
                model: ListModel {
                    id: listOfExercises
                }
            }
        }
    }

    Rectangle { // List of workouts header block
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
            text: qsTr("List of Workouts")
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
        }
    }

    ListView { // List of workouts
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
}
