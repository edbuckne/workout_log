import QtQuick 2.9
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.LocalStorage 2.0
import "Database.js" as JS

Page {
    id: idPage
    width: 640
    height: 480
    title: "Workouts"

    property alias listOfExercises: listOfExercises
    property alias workoutListModel: workoutListModel

    ScrollView { // Block to create a new workout
        id: scrollView
        y: 0
        height: 400
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 10

        Rectangle { // Create new workout header block
            id: rectangle1
            y: 11
            height: 30
            color: "#aac57f"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            border.width: 2

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
                id: workoutInput
                y: 0
                text: qsTr("Enter here")
                font.pixelSize: 12
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                selectByMouse: true
                wrapMode: TextEdit.WordWrap
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
            onClicked: { // This click will note all workouts that have been selected, put them in an array, and connect those to this specified workout
                var exList = []
                var count = listOfExercises.count
                console.log(count)
                for (var i = 0; i < count; i++){
                    if (listOfExercises.get(i).checked){
                        exList.push(listOfExercises.get(i).id)
                        console.log(listOfExercises.get(i).name)
                    }
                }
                console.log(exList)
                var wo_id = JS.dbInsertWorkout(workoutInput.text) // Put workout into the database
                JS.linkWorkoutsExercises(wo_id, exList)
                workoutListModel.append({"name":workoutInput.text, "id":wo_id}) // Put the workout into the app list
            }
        }

        Rectangle { // List of exercises header block
            id: rectangle3
            height: 30
            color: "#dee2d8"
            anchors.left: rectangle1.left
            anchors.leftMargin: 10
            anchors.right: rectangle1.right
            anchors.rightMargin: 10
            anchors.top: rectangle2.bottom
            anchors.topMargin: 25

            Text {
                id: element3
                x: 144
                y: 8
                text: qsTr("List of Exercises")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 12
            }
        }

        ListView {
            id: listViewExercisesInWorkouts
            anchors.left: rectangle3.left
            anchors.leftMargin: 0
            anchors.right: rectangle3.right
            anchors.rightMargin: 0
            anchors.top: rectangle3.bottom
            anchors.topMargin: 0
            anchors.bottom: button.top
            anchors.bottomMargin: 10
            model: ListModel {
                id: listOfExercises
            }

            delegate: ItemListDelegate {
                boxColor: exercise_type
                itemText: name + " (" + weight_type + ")"
                boxClick.onClicked: {
                    if(boxColor == "#ffffff"){
                        boxColor = exercise_type
                        listOfExercises.setProperty(index, "checked", false)
                    }
                    else {
                        boxColor = "#ffffff"
                        listOfExercises.setProperty(index, "checked", true)
                    }
                }
            }
//            delegate: CheckboxDelegate {
//                itemText: name + " (" + weight_type + ") - " + exercise_type
//            }
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
        anchors.left: scrollView.right
        anchors.leftMargin: 0

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
        anchors.left: scrollView.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 50
        z: 2
        clip: true
        model: ListModel {
            id: workoutListModel
        }
        delegate: ItemListDelegate {
            boxColor: "#f1f1f1"
            itemText: name
            boxClick.onClicked: {
                console.log(workoutListModel.get(index).name)
                var exList = JS.readWorkouts(workoutListModel.get(index).id)
                var exListIds = []
                for (var i = 0; i < exList.length; i++){
                    exListIds.push(exList[i].rows.item(0).id)
                }

                JS.dbReadAll(workoutSingle.exerciseList, exListIds)

                workoutSingle.woName = workoutListModel.get(index).name
                workoutSingle.id = workoutListModel.get(index).id
                stackView.push(workoutSingle)
            }
        }
    }

//    Component.onCompleted: {
//        JS.dbReadAll(listOfExercises) // When the ExercisePage has been instantiated, dbRealAll gets called
//        JS.dbReadAllWorkouts(workoutListModel) // It also gets all of the existing workouts
//    }


}
