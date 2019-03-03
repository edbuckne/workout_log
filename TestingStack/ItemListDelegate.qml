import QtQuick 2.0

Item {
    x: 5
    width: 80
    height: 40

    property alias boxClick: delegateClick
    property alias boxColor: colorSquare.color
    property alias itemText: itemName.text

    Row {
        id: row1

        Rectangle {
            id: colorSquare
            width: 40
            height: 40
            border.width: 2
            border.color: "#0f0f0f"

            MouseArea { // What happens when we click an exercise on the list
                id: delegateClick
                anchors.fill: parent
            }
        }

        Text {
            id: itemName
            x: 5
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
        }

        spacing: 0
    }
}
