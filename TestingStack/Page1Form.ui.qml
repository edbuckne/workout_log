import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: idPage
    width: 600
    height: 400
    property alias button: button
    property string exerciseName: ""

    title: qsTr("Page 1")

    Label {
        text: qsTr("You are on Page 1.")
        anchors.verticalCenterOffset: -166
        anchors.horizontalCenterOffset: -231
        anchors.centerIn: parent
    }

    Button {
        id: button
        x: 250
        y: 321
        text: qsTr("Button")
    }

    ComboBox {
        id: comboBox
        x: 230
        y: 216
    }

    Rectangle {
        id: rectangle
        x: 173
        y: 168
        width: 320
        height: 32
        color: "#ffffff"
        border.color: "#524d4d"

        TextInput {
            id: textInput
            text: qsTr("Text Input")
            anchors.fill: parent
            font.pixelSize: 12

            onEditingFinished: idPage.exerciseName = text
        }
    }

    Text {
        id: element
        x: 50
        y: 168
        text: qsTr("Workout Name")
        font.pixelSize: 12
    }

    Text {
        id: element1
        x: 50
        y: 229
        text: qsTr("Exercise Type")
        font.pixelSize: 12
    }
}




/*##^## Designer {
    D{i:5;anchors_height:20;anchors_width:80;anchors_x:60;anchors_y:12}
}
 ##^##*/
