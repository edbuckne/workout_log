import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 600
    height: 400

    title: qsTr("Home")

    Label {
        text: qsTr("You are on the home page.")
        anchors.centerIn: parent
    }

    Button {
        id: newExercise
        x: 69
        y: 35
        text: qsTr("Create new exercise")
        checkable: false
    }
}
