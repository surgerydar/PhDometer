
.pragma library

.import QtQuick.LocalStorage 2.0 as Storage

function getDatabase() {
    var db = Storage.LocalStorage.openDatabaseSync("PhDometer", "3.0", "PhDometer 3.0 database", 1000000);
    db.transaction( function(tx) {
        // Create the database if it doesn't already exist
        tx.executeSql('CREATE TABLE IF NOT EXISTS settings(id TEXT UNIQUE, value TEXT)');
    });
    return db;
}

function get( key ) {
    var value = undefined;
    var db = getDatabase();
    db.transaction( function(tx) {
        var rs = tx.executeSql("SELECT * FROM settings where id = ?;",[key]);
        if ( rs.rows.length >= 1 ) {
            value = rs.rows.item(0).value;
        }
    });
    console.log( 'setttings : ' + key + '=' + value );
    return value;
}

function set( key, value ) {
    var ok = false;
    var db = getDatabase();
    db.transaction( function(tx) {
        var rs = tx.executeSql('INSERT OR REPLACE INTO settings VALUES (?,?);', [key, value]);
        ok = rs.rowsAffected > 0;
    });
    return ok;
}
