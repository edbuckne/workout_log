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
            button.onClicked:{
                if(idPage1Form.comboBox.currentIndex===0){
                    idPage1Form.model.append({ "name": idPage1Form.exerciseName, "colorCode" : "Blue"})
                }
                if(idPage1Form.comboBox.currentIndex===1){
                    idPage1Form.model.append({ "name": idPage1Form.exerciseName, "colorCode" : "Green"})
                }
                if(idPage1Form.comboBox.currentIndex===2){
                    idPage1Form.model.append({ "name": idPage1Form.exerciseName, "colorCode" : "Red"})
                }
            }
        }
    }
    //button.onClicked: stackView.push("Page1Form.ui.qml")
}
