import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Stack")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
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

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent

        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Exercises")
                width: parent.width
                onClicked: {
                    stackView.push(idPage1Form)
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 2")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.ui.qml")
                    drawer.close()
                }
            }
        }
    }


    StackView {
        id: stackView
        initialItem: idHomeForm
        anchors.fill: parent

        HomeForm{
            id: idHomeForm
        }

        Page1Form{
            id: idPage1Form
            visible: false
            mouseClick.onClicked: { // Clear the text when the area is clicked
                textInput.selectAll()
                textInput.forceActiveFocus()
            }
            mouseClick1.onClicked: {
                textInput1.selectAll()
                textInput1.forceActiveFocus()
            }
            mouseClick2.onClicked: {
                textInput2.selectAll()
                textInput2.forceActiveFocus()
            }
            button.onClicked:{ // When the "Create exercise" button is clicked, add an element to the list according to color
                if(idPage1Form.comboBox.currentIndex===0){
                    idPage1Form.model.append({ "name": idPage1Form.exerciseName, "colorCode" : "Blue"})
                }
                if(idPage1Form.comboBox.currentIndex===1){
                    idPage1Form.model.append({ "name": idPage1Form.exerciseName, "colorCode" : "Green"})
                }
                if(idPage1Form.comboBox.currentIndex===2){
                    idPage1Form.model.append({ "name": idPage1Form.exerciseName, "colorCode" : "Red"})
                }
                comboBox.currentIndex = 0 // Set values back to default
                textInput.text = "Enter here"
                textInput1.text = "Enter here"
                textInput2.text = "Enter here"
            }
        }
    }
}
