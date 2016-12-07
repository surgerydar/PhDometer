.import QtQuick.LocalStorage 2.0 as Storage

function getDatabase() {
    var db = Storage.LocalStorage.openDatabaseSync("PhDometer", "3.0", "PhDometer 3.0 database", 1000000);
    db.transaction( function(tx) {
        // Create the database if it doesn't already exist
        tx.executeSql('CREATE TABLE IF NOT EXISTS activity(id TEXT UNIQUE, name TEXT, type TEXT, time BIGINT, wordcount BIGINT, wordsperminute BIGINT)');
    });
    return db;
}

function getActivityList() {
    var db = getDatabase();
    var activities = [];
    db.transaction( function(tx) {
        var rs = tx.executeSql('SELECT * FROM activity;');
        for(var i = 0; i < rs.rows.length; i++) {
            activities.push({
                                activityid: rs.rows.item(i).id,
                                name: rs.rows.item(i).name,
                                type: rs.rows.item(i).type,
                                time: rs.rows.item(i).time,
                                wordcount: rs.rows.item(i).wordcount,
                                wordsperminute: rs.rows.item(i).wordsperminute
                            });
        }
    });
    return activities;
}

function pushActivity( id, name, type, time, wordcount, wordsperminute ) {
    var ok = false;
    var db = getDatabase();
    db.transaction( function(tx) {
        var rs = tx.executeSql('INSERT OR REPLACE INTO activity VALUES (?,?,?,?,?,?);', [id, name, type, time, wordcount, wordsperminute]);
        ok = rs.rowsAffected > 0;
    });
    return ok;
}

function deleteActivity(id) {
    var db = getDatabase();
    db.transaction( function(tx) {
        var rs = tx.executeSql('DELETE FROM activity WHERE id=?', [id]);
        return rs.rowsAffected > 0;
    });
    return false;
}

function getActivity(id) {
    var activity = undefined;
    var db = getDatabase();
    db.transaction( function(tx) {
        var rs = tx.executeSql("SELECT * FROM activity where id = '" + id + "';");
        if ( rs.rows.length >= 1 ) {
            activity = {
                activityid: rs.rows.item(0).id,
                name: rs.rows.item(0).name,
                type: rs.rows.item(0).type,
                time: rs.rows.item(0).time,
                wordcount: rs.rows.item(0).wordcount,
                wordsperminute: rs.rows.item(0).wordsperminute
            };
        }
    });
    return activity;
}
