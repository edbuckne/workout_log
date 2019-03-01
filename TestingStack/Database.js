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

function dbInit()
{
    var db = LocalStorage.openDatabaseSync("Workout_Log_DB", "", "Track exercise", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS exercise_log (name text, exercise_type text, weight_type text, description text, rowid integer)')
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
        var db = LocalStorage.openDatabaseSync("Workout_Log_DB", "",
                                               "Track exercise", 1000000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

/* dbInsert is a function that takes in the name of the exercise (string), the color that the
   block will be (string), the type of weight used in this exercise (string), the discription 
   of the exercise (string), and the size of the current list of exercises (int).*/
function dbInsert(Pname, Pexercisetype, PweightType, Pdesc, Prowid)
{
    var db = dbGetHandle() // Load the database into the variable db
    var rowid = 0; // rowid is used to reference the row index
    db.transaction(function (tx) {
        var result = tx.executeSql('SELECT last_insert_rowid()')
        rowid = result.insertId + 1
        tx.executeSql('INSERT INTO exercise_log VALUES(?, ?, ?, ?, ?)',
                      [Pname, Pexercisetype, PweightType, Pdesc, rowid])
    })
    return rowid;
}

/* dbReadAll is a function that takes in no inputs. It loads the database and appends every 
   instance of an iten on the list model on the ExercisePage. It returns nothing.*/
function dbReadAll(modIn)
{
    var db = dbGetHandle() // Load the database into the variable db
    db.transaction(function (tx) { // db.transaction is a transaction of data from js to sql
        var results = tx.executeSql( // Executes the query in the follow line of code for sql
                    'SELECT name, exercise_type, weight_type, description, rowid FROM exercise_log ORDER BY rowid DESC')
        for (var i = 0; i < results.rows.length; i++) {
            modIn.append({
                                 id: results.rows.item(i).rowid,
                                 name: results.rows.item(i).name,
                                 exercise_type: results.rows.item(i).exercise_type,
                                 weight_type: results.rows.item(i).weight_type,
                                 description: results.rows.item(i).description
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
