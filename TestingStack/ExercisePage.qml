import QtQuick 2.4

ExercisePageForm {
    id: exercisePageForm
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
        if(comboBox.currentIndex===0){
            model.append({ "name": exerciseName, "colorCode" : "Blue"})
        }
        if(comboBox.currentIndex===1){
            model.append({ "name": exerciseName, "colorCode" : "Green"})
        }
        if(comboBox.currentIndex===2){
            model.append({ "name": exerciseName, "colorCode" : "Red"})
        }
        comboBox.currentIndex = 0 // Set values back to default
        textInput.text = "Enter here"
        textInput1.text = "Enter here"
        textInput2.text = "Enter here"
    }
}

