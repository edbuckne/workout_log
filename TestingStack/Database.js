/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the documentation of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

/**/
function dbInit()
{
    var db = LocalStorage.openDatabaseSync("Workout_Log_DB", "", "Track exercise", 1000000) //openDatabaseSync(identifier, version, description, estimated_size, callback(db))
    try {
        db.transaction( // These two lines are necessary for calling sql commands
            function (tx) { // Create these three tables: exercise_log, workout_log, and ex_wo
                tx.executeSql('CREATE TABLE IF NOT EXISTS exercise_log (name text, exercise_type text, weight_type text, description text, id integer PRIMARY KEY);')
                tx.executeSql('CREATE TABLE IF NOT EXISTS workout_log (name text, id integer PRIMARY KEY)')
                tx.executeSql('CREATE TABLE IF NOT EXISTS ex_wo (ex_id integer, wo_id integer)')
            })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}

/* dbGetHandle is a function that takes in no inputs. It opens an sql database called 
   Workout_Log_DB with the display name of Track exercise. The returned value is the 
   database object.*/
function dbGetHandle()
{
    try {
        var db = LocalStorage.openDatabaseSync("Workout_Log_DB", "", "Track exercise", 1000000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

/* dbNewIdExercise returns a primary key in the exercise_log table that has not been
   used. It takes no inputs.*/
function dbNewIdExercise()
{
    var db = dbGetHandle() // Load the database into the variable db
    var newId = 0
    db.transaction(
        function (tx) { // db.transaction is a transaction of data from js to sql
            var results = tx.executeSql('SELECT name, exercise_type, weight_type, description, id FROM exercise_log ORDER BY id DESC')
            for (var j = 0; j < 10000; j++) {
                var found = 0
                for (var i = 0; i < results.rows.length; i++) {
                    if (results.rows.item(i).id === j){
                        found = 1
                        break
                    }
                }
                if (found === 0){ // If that id was never found, return it
                    console.log(String(j))
                    newId = j
                    return
                }
            }
        })
    return newId
}

/* dbNewIdWorkout returns a primary key in the workout_log table that has not been
   used. It takes no inputs.*/
function dbNewIdWorkout()
{
    var db = dbGetHandle() // Load the database into the variable db
    var newId = 0
    db.transaction(
        function (tx) { // db.transaction is a transaction of data from js to sql
            var results = tx.executeSql('SELECT name, id FROM workout_log ORDER BY id DESC')
            for (var j = 0; j < 10000; j++) {
                var found = 0
                for (var i = 0; i < results.rows.length; i++) {
                    if (results.rows.item(i).id === j){
                        found = 1
                        break
                    }
                }
                if (found === 0){ // If that id was never found, return it
                    console.log(String(j))
                    newId = j
                    return
                }
            }
        })
    return newId
}

/* dbInsertExercise is a function that takes in the name of the exercise (string), the color that the
   block will be (string), the type of weight used in this exercise (string), the discription 
   of the exercise (string), and the size of the current list of exercises (int).*/
function dbInsertExercise(Pname, Pexercisetype, PweightType, Pdesc)
{
    var db = dbGetHandle() // Load the database into the variable db
    var rowid = 0; // rowid is used to reference the row index
    var newId = dbNewIdExercise()
    console.log('Id of Inserted Exercise: ' + String(newId))
    db.transaction(
        function (tx) {
            tx.executeSql('INSERT INTO exercise_log VALUES(?, ?, ?, ?, ?)', [Pname, Pexercisetype, PweightType, Pdesc, newId])
            var result = tx.executeSql('SELECT last_insert_rowid()')
            rowid = result.insertId
        })
    return newId;
}

/* dbInsertWorkout inserts a workout sql entry into the database given the name of
   the workout (Pname).*/
function dbInsertWorkout(Pname)
{
    var db = dbGetHandle() // Load the database into the variable db
    var rowid = 0; // rowid is used to reference the row index
    var newId = dbNewIdWorkout()
    console.log('Id of Inserted Workout: ' + String(newId))
    db.transaction(
        function (tx) {
            tx.executeSql('INSERT INTO workout_log VALUES(?, ?)', [Pname, newId])
            var result = tx.executeSql('SELECT last_insert_rowid()')
            rowid = result.insertId
        })
    return newId;
}

/*  linkWorkoutsExercises adds to a table all of the connections between the workout
    specified by the workout id (wo_id) and the exercises by their exercise ids
    found in the array (exArray)*/
function linkWorkoutsExercises(wo_id, exArray)
{
    var db = dbGetHandle()
    db.transaction(
        function (tx) {
            for (var j = 0 ; j < exArray.length ; j++){
                tx.executeSql('INSERT INTO ex_wo VALUES(?, ?)', [exArray[j], wo_id])
            }
        })
}

/*  readWorkouts returns an array of the exercises
    found in the workout specified by the workout id (wo_id)*/
function readWorkouts(wo_id)
{
    var db = dbGetHandle()
    var exList = []
    db.transaction(
        function (tx) {
            var exWoConnections = tx.executeSql('SELECT ex_id FROM ex_wo WHERE wo_id = ' + String(wo_id)) // NEEDS WORK HERE
            for (var i = 0; i < exWoConnections.rows.length; i++){
                exList.push(tx.executeSql('SELECT name, exercise_type, weight_type, description, id FROM exercise_log WHERE id = ' + String(exWoConnections.rows.item(i).ex_id)))
            }
        })
    return exList
}

/* dbReadAll is a function that takes in no inputs. It loads the database and appends every 
   instance of an iten on the list model on the ExercisePage. It returns nothing.*/
function dbReadAll(modIn, list)
{
    modIn.clear()
    var db = dbGetHandle() // Load the database into the variable db
    db.transaction(function (tx) { // db.transaction is a transaction of data from js to sql
        if (list === -1){
        var results = tx.executeSql( // Executes the query in the follow line of code for sql
                    'SELECT name, exercise_type, weight_type, description, id FROM exercise_log ORDER BY id DESC')
            for (var i = 0; i < results.rows.length; i++) {
                modIn.append({
                                 id: results.rows.item(i).id,
                                 name: results.rows.item(i).name,
                                 exercise_type: results.rows.item(i).exercise_type,
                                 weight_type: results.rows.item(i).weight_type,
                                 description: results.rows.item(i).description
                             })
            }
        }
        else {
            var results
            for (var i = 0; i < list.length; i++){
                results = tx.executeSql(
                    'SELECT name, exercise_type, weight_type, description, id FROM exercise_log WHERE id = ' + String(list[i]))
                modIn.append({
                                 id: results.rows.item(0).id,
                                 name: results.rows.item(0).name,
                                 exercise_type: results.rows.item(0).exercise_type,
                                 weight_type: results.rows.item(0).weight_type,
                                 description: results.rows.item(0).description
                             })
            }
        }
    })
}

function dbReadAllWorkouts(modIn)
{
    var db = dbGetHandle() // Load the database into the variable db
    db.transaction(
        function (tx) { // db.transaction is a transaction of data from js to sql
            var results = tx.executeSql( // Executes the query in the follow line of code for sql
                    'SELECT name, id FROM workout_log ORDER BY id DESC')
            for (var i = 0; i < results.rows.length; i++) {
                modIn.append({
                                 name: results.rows.item(i).name,
                                 id: results.rows.item(i).id
                             })
            }
        })
}

function dbUpdate(Pname, PexerciseType, PweightType, Pdesc, Prowid)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql(
                    'UPDATE exercise_log SET name=?, exercise_type=?, weight_type=?, description=? WHERE rowid = ?', [Pname, PexerciseType, PweightType, Pdesc, Prowid])
    })
}

function dbDeleteRow(Prowid)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('delete from exercise_log where rowid = ?', [Prowid])
    })
}
