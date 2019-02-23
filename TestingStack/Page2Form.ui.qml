import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: idPage
    width: 640
    height: 480
    title: "Workouts"

    ScrollView {
        id: scrollView
        y: 0
        height: 400
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 300

        Text {
            // Text that simply says Workout Name
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
            text: qsTr("Create Exercise")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
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
}






/*##^## Designer {
    D{i:2;anchors_width:203;anchors_x:96}D{i:3;anchors_y:129}D{i:9;anchors_width:202;anchors_x:98}
D{i:1;anchors_width:304;anchors_x:286}
}
 ##^##*/
