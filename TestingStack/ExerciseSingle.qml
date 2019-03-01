import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.LocalStorage 2.0
import "Database.js" as JS

Page {
    width: 640
    height: 480
    title:exName

    property int indexNum: 0
    property string exName: " "
    property string wtType: " "
    property string exType: " "
    property string des: " "
    property int rowid: 0

    property alias updateButton: updateButton

    Text {
        id: exNameText
        x: 45
        y: 56
        text: qsTr("Name of Exercise:")
        font.pixelSize: 12
    }

    Rectangle {
        id: exNameBox
        y: 56
        height: 20
        color: "#ffffff"
        border.width: 1
        anchors.left: exNameText.right
        anchors.leftMargin: 10
        anchors.verticalCenter: exNameText.verticalCenter
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 0

        TextEdit {
            id: exNameEdit
            text: exName
            anchors.fill: parent
            font.pixelSize: 12
            anchors.leftMargin: 5
            selectByMouse: true
        }
    }

    Text {
        id: wtTypeText
        x: 50
        text: qsTr("Weight Type:")
        anchors.right: exNameText.right
        anchors.rightMargin: 0
        anchors.top: exNameText.bottom
        anchors.topMargin: 15
        font.pixelSize: 12
    }

    Rectangle {
        id: wtTypeBox
        y: 54
        height: 20
        color: "#ffffff"
        anchors.left: wtTypeText.right
        anchors.right: parent.horizontalCenter
        anchors.verticalCenter: wtTypeText.verticalCenter
        anchors.rightMargin: 0
        border.width: 1
        anchors.leftMargin: 10

        TextEdit {
            id: wtTypeEdit
            text: wtType
            anchors.fill: parent
            font.pixelSize: 12
            anchors.leftMargin: 5
            selectByMouse: true
        }
    }

    Text {
        id: descText
        x: 69
        text: qsTr("Description:")
        anchors.top: wtTypeText.bottom
        anchors.right: wtTypeText.right
        font.pixelSize: 12
        anchors.rightMargin: 0
        anchors.topMargin: 15
    }

    Rectangle {
        id: desTextBox
        y: 111
        height: 129
        color: "#ffffff"
        anchors.left: descText.right
        anchors.right: parent.horizontalCenter
        border.width: 1
        anchors.rightMargin: 0
        anchors.leftMargin: 10

        TextEdit {
            id: desTextEdit
            text: des
            anchors.fill: parent
            font.pixelSize: 12
            anchors.leftMargin: 5
            selectByMouse: true
            wrapMode: TextEdit.WordWrap
        }
    }

    Button {
        id: updateButton
        x: 151
        y: 265
        width: 169
        height: 40
        text: qsTr("Update Information")
        onClicked: {
            JS.dbUpdate(exNameEdit.text, exType, wtTypeEdit.text, desTextEdit.text, rowid)
            exercisePage.listModelExercises.set(indexNum, {"name":exNameEdit.text, "exercise_type":exType, "weight_type":wtTypeEdit.text, "description":desTextEdit.text})
            stackView.pop()
        }
    }

    Button {
        id: deleteButton
        x: 151
        y: 311
        width: 169
        height: 40
        text: qsTr("Delete Exercise")
        onClicked: {
            JS.dbDeleteRow(rowid)
            exercisePage.listModelExercises.remove(indexNum)
            stackView.pop()
        }
    }
}