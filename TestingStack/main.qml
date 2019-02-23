import QtQuick 2.9
import QtQuick.Controls 2.2

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
                    stackView.push(exercisePage)
                    drawer.close()
                }
            }
            ItemDelegate { // Workouts tab
                text: qsTr("Workouts")
                width: parent.width
                onClicked: {
                    stackView.push(workoutPage)
                    drawer.close()
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

        ExercisePage{ // This is the exercise Page
            id: exercisePage
            visible: false
        }

        WorkoutPage{
            id: workoutPage
            visible: false
        }
    }
}
