.pragma library

var activityId = 0;
var activityName = "Default Activity";
var activityType = "Writing";
var activityWords = 0;
var activityTime = 0;
var notifyUser = false;
var notificationFrequency = 50;
var userNotified = false;

function newActivity( name, type ) {
    activityId = new Date().getTime().toString();
    activityName = name;
    activityType = type;
    activityWords = 0;
    activityTime = 0;
    userNotified = false;
}

function setActivity( id, name, type, words, time ) {
    activityId = id;
    activityName = name;
    activityType = type;
    activityWords = words;
    activityTime = time;
    userNotified = false;
}

function updateTime() {
    activityTime++;
}

function getTime() {
}
function getFormattedTime() {
    function pad( string, length ) {
        while( string.length < length ) string = "0" + string;
        return string;
    }
    //
    //
    //
    var hours = Math.floor( activityTime / ( 60 * 60 ) );
    var minutes = Math.floor( ( activityTime - ( hours * 60 * 60 ) ) / 60 );
    var seconds = activityTime - ((minutes*60)+(hours*60*60))

    var string = "";
    if ( hours > 0 ) {
        string += pad(hours.toString(), 2 ) + ":";
    }
    if ( minutes > 0 ) {
        string += pad(minutes.toString(), 2 ) + ":";
    }
    string += pad(seconds.toString(),2);

    return string;
}

function addWord() {
    activityWords++;
    return ( notifyUser && activityWords > 0 && activityWords % notificationFrequency === 0 );
}

function removeWord() {
    activityWords--;
}

function getWords() {
    return activityWords;
}

function getWordsPerMinute() {
    if ( activityTime <= 0 ) return 0;
    return Math.round(activityWords / (activityTime/60));
}

function share(cb) {
    var payload = {
        activity_id : activityId,
        name : activityName,
        type : activityType,
        time : activityTime,
        wordcount : activityWords,
        wordsperminute : getWordsPerMinute()
    };
    console.log( 'sharing : ' + JSON.stringify(payload) );
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState == XMLHttpRequest.HEADERS_RECEIVED) {
            /*
            showRequestInfo("Headers -->");
            showRequestInfo(doc.getAllResponseHeaders ());
            showRequestInfo("Last modified -->");
            showRequestInfo(doc.getResponseHeader ("Last-Modified"));
            */
        } else if (xhr.readyState == XMLHttpRequest.DONE) {
            var response = xhr.response === undefined ? xhr.responseText : xhr.response;
            try {
                response = JSON.parse(response);
            } catch(e) {

            }

            console.log(response);
            /*
            showRequestInfo("Headers -->");
            showRequestInfo(doc.getAllResponseHeaders ());
            showRequestInfo("Last modified -->");
            showRequestInfo(doc.getResponseHeader ("Last-Modified"));
            */
            if ( cb ) {
                cb(response);
            }
        }
    }
    xhr.open('PUT', 'http://phdometer-surgeryda.rhcloud.com/activity', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify(payload));
}
function getShareScript() {
    var payload = {
        activity_id : activityId,
        name : activityName,
        type : activityType,
        time : activityTime,
        wordcount : activityWords,
        wordsperminute : getWordsPerMinute()
    };

    return "phdometer.community.shareActivity('" + JSON.stringify(payload) + "');";
}
