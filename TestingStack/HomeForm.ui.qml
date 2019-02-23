import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: page
    width: 600
    height: 400

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

}
