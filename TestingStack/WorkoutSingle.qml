import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.LocalStorage 2.0
import "Database.js" as JS

Page {
    id: page
    width: 640
    height: 480
    title: woName

    property string woName: " "
    property int id: 0
    property var exList: [0, 0]
    property alias exerciseList: exerciseList

    Rectangle {
        id: listOfExerciseHeader
        y: 50
        height: 30
        color: "#aac57f"
        anchors.right: listView.right
        anchors.rightMargin: 0
        anchors.bottom: listView.top
        anchors.bottomMargin: 0
        anchors.left: listView.left
        anchors.leftMargin: 0

        Text {
            id: element
            text: qsTr("List of Exercises")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            renderType: Text.NativeRendering
            textFormat: Text.PlainText
            font.pixelSize: 12
        }
    }

    ListView {
        // List of existing exercises
        id: listView
        y: 71
        height: 252
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 10
        z: 2
        clip: true
        model: ListModel {
            id: exerciseList
        }
        delegate: ItemListDelegate { // This is a custom component to describe what the components in our lists look like
            boxColor: exercise_type
            itemText: name + " (" + weight_type + ")"
//            boxClick.onClicked: {
//                exerciseSingle.indexNum = index
//                exerciseSingle.exName = listModel.get(index).name
//                exerciseSingle.wtType = listModel.get(index).weight_type
//                exerciseSingle.exType = listModel.get(index).exercise_type
//                exerciseSingle.des = listModel.get(index).description
//                exerciseSingle.rowid = listModel.get(index).id
            //                console.log(listModel.get(index).id)
            //                stackView.push(exerciseSingle)
            //            }
        }
    }
}
