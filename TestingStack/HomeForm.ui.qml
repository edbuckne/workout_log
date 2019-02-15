import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: page
    width: 600
    height: 400
    property alias model: listView.model
    property alias button: button

    title: qsTr("Home")

    Label {
        width: 149
        height: 31
        text: qsTr("Welcome to our workout app!")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: image.top
        anchors.bottomMargin: -25
        wrapMode: Text.WordWrap
        z: 1
    }

    Rectangle {
        id: rectangle
        x: 200
        width: 306
        height: 169
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: image.bottom
        anchors.topMargin: 0

        Button {
            id: button
            x: 206
            text: qsTr("Add Workout")
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            font.pointSize: 7
            font.wordSpacing: -0.2
            topPadding: 5
        }

        ListView {
            id: listView
            y: 0
            height: 160
            anchors.right: button.left
            anchors.rightMargin: 4
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            z: 2
            clip: true
            model: ListModel {
                ListElement {
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
                }
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

    Image {
        id: image
        x: 125
        y: 22
        width: 260
        height: 194
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "qrc:///TheWorkout.jpg"
    }

    Connections {
        target: button
        onClicked: print("clicked")
    }
}




/*##^## Designer {
    D{i:3;anchors_y:0}D{i:4;anchors_width:110;anchors_x:0}D{i:2;anchors_y:188}
}
 ##^##*/
