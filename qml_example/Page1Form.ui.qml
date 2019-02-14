import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: thisPage
    width: 600
    height: 400

    title: qsTr("Create New Exercise")

    Item {
        id: element
        x: 8
        y: 7
        width: 582
        height: 386

        Button {
            id: button
            x: 271
            y: 304
            text: qsTr("Submit")
            topPadding: 6
            focusPolicy: Qt.ClickFocus
            visible: true
        }

        Column {
            id: column
            width: 200
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            ItemDelegate {
                width: parent.width
                height: 25

                Rectangle {
                    id: rectangle
                    width: parent.width
                    height: parent.height
                    color: "#f0f0f0"

                    TextInput {
                        id: textInput
                        width: parent.width
                        height: parent.height
                        text: qsTr("Name of exercise")
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 12
                    }
                }
            }

        }


    }
}






/*##^## Designer {
    D{i:6;anchors_x:333;anchors_y:64}D{i:4;anchors_x:20;anchors_y:25}D{i:3;anchors_height:400;anchors_x:0;anchors_y:-7}
}
 ##^##*/
