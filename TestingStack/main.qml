import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.LocalStorage 2.0
import "Database.js" as JS

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Stack")

    header: ToolBar { // Top bar of the window
        contentHeight: toolButton.implicitHeight

        ToolButton { // Top left three-stripped icon or back icon depending on how big the stack is
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label { // Shows the name of the current page on top in the center
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer { // Option window that opens when the toolButton is opened
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column { // A column of options
            anchors.fill: parent

            ItemDelegate { // Exercises tab
                text: qsTr("Exercises")
                width: parent.width
                onClicked: {
                    exercisePage.listModelExercises.clear()
                    JS.dbReadAll(exercisePage.listModelExercises, -1)
                    stackView.push(exercisePage)
                    drawer.close()
                }
            }
            ItemDelegate { // Workouts tab
                text: qsTr("Workouts")
                width: parent.width
                onClicked: {
                    workoutPage.listOfExercises.clear() // Clear the two lists and repopulate occordingly
                    JS.dbReadAll(workoutPage.listOfExercises, -1)
                    workoutPage.workoutListModel.clear()
                    JS.dbReadAllWorkouts(workoutPage.workoutListModel)

                    stackView.push(workoutPage) // Pull up the workout page
                    drawer.close() // Close the drawer that comes out for these options
                }
            }
        }
    }

    StackView { // Module that opens new windows from given signals
        id: stackView
        initialItem: idHomeForm
        anchors.fill: parent

        HomeForm{ // The home page
            id: idHomeForm
        }

        ExercisePage_02{ // This is the exercise Page
            id: exercisePage
            visible: false
        }

        WorkoutPage_02{
            id: workoutPage
            visible: false
        }

        ExerciseSingle{
            id: exerciseSingle
            visible: false
        }

        WorkoutSingle{
            id: workoutSingle
            visible: false
        }
    }

    Component.onCompleted: {
        JS.dbInit()
    }
}
