import QtQuick 2.4
import QtQuick.LocalStorage 2.0
import "Database.js" as JS

Temp {
    id: exercisePageForm
    mouseClick.onClicked: { // Clear the text when the area is clicked
        exerciseNameInput.selectAll()
        exerciseNameInput.forceActiveFocus()
    }
    mouseClick1.onClicked: {
        weightTypeInput.selectAll()
        weightTypeInput.forceActiveFocus()
    }
    mouseClick2.onClicked: {
        descriptionInput.selectAll()
        descriptionInput.forceActiveFocus()
    }
    button.onClicked:{ // When the "Create exercise" button is clicked, add an element to the list according to color
        var rowid
        if(comboBox.currentIndex===0){
            rowid = parseInt(JS.dbInsert(exerciseNameInput.text, "Blue", weightTypeInput.text, descriptionInput.text, listModel.count), 10)
            listModel.append({ "exerciseId": rowid, "name": exerciseNameInput.text, "exercise_type" : "Blue", "weight_type": weightTypeInput.text, "description": descriptionInput.text})

        }
        else if(comboBox.currentIndex===1){
            rowid = parseInt(JS.dbInsert(exerciseNameInput.text, "Green", weightTypeInput.text, descriptionInput.text, listModel.count), 10)
            listModel.append({ "exerciseId": rowid, "name": exerciseNameInput.text, "exercise_type" : "Green", "weight_type": weightTypeInput.text, "description": descriptionInput.text})

        }
        else if(comboBox.currentIndex===2){
            rowid = parseInt(JS.dbInsert(exerciseNameInput.text, "Red", weightTypeInput.text, descriptionInput.text, listModel.count), 10)
            listModel.append({ "exerciseId": rowid, "name": exerciseNameInput.text, "exercise_type" : "Red", "weight_type": weightTypeInput.text, "description": descriptionInput.text})

        }

        comboBox.currentIndex = 0 // Set values back to default
        exerciseNameInput.text = "Enter here"
        weightTypeInput.text = "Enter here"
        descriptionInput.text = "Enter here"
    }

    Component.onCompleted: JS.dbReadAll() // When the ExercisePage has been instantiated, dbRealAll gets called
}

