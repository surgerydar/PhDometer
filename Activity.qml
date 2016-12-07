import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.1
import "Activity.js" as Activity
import "ActivityList.js" as ActivityList
import "Settings.js" as Settings

ActivityForm {
    id: activityForm
    /*
        keyboard hook
      */
    Connections {
        target: KeyboardMonitor
        onNewWord: {
            if ( activityTimer.running ) {
                if ( Activity.addWord() ) {
                    // notify user
                    playSound.play();
                    notificationDialog.text = "hooray you have typed another " + Activity.notificationFrequency + " words!"
                    notificationDialog.visible = true
                }

                refreshUI();
            }
            console.log("QML new word");
        }
    }
    Component.onCompleted: {
        KeyboardMonitor.install();
        //
        // load current activity
        //
        var activityId = Settings.get('current_activity');
        if ( activityId && activityId > 0 ) {
            console.log( 'got current activity : ' + activityId);
            var activity = ActivityList.getActivity( activityId );
            if ( activity ) {
                console.log( 'loaded activity : ' + activityId);
                Activity.setActivity( activity.activityid, activity.name, activity.type, activity.wordcount, activity.time );
                refreshUI();
                activityForm.state = "closeMenus";
            } else {
                state = "newActivityOpen"
            }
        } else {
            state = "newActivityOpen"
        }
    }
    //KeyboardMonitor.onNewWord: { activityForm.state = "newActivityOpen" }
    /*
        menus
    */
    activityNew.onClicked : state = "newActivityOpen"
    activityMenu.onClicked: {
        refreshActivityList()
        state = "activityListOpen"
    }
    closeActivityList.onClicked: state = "closeMenus"
    closeNewActivity.onClicked: state = "closeMenus"
    transitions : [
        Transition {
            NumberAnimation { properties: "x"; duration: 200 }
        }
    ]
    /*
      measure view
    */
    activityPreviousMeasure.onClicked: {
        var currentIndex = measureSwipeView.currentIndex - 1;
        if ( currentIndex < 0 ) currentIndex = measureSwipeView.count - 1;
        measureSwipeView.setCurrentIndex(currentIndex);
    }
    activityNextMeasure.onClicked: {
        var currentIndex = measureSwipeView.currentIndex + 1;
        if ( currentIndex >= measureSwipeView.count ) currentIndex = 0;
        measureSwipeView.setCurrentIndex(currentIndex);
    }
    /*
      activity control
      */
    activityPauseResume.onClicked: {
        activityTimer.running = activityTimer.running == false
        if ( activityTimer.running ) {
            activityPauseResume.background.source = "qrc:/icons/ic_pause_circle_filled_2x.png";
        } else {
            activityPauseResume.background.source = "qrc:/icons/ic_play_circle_filled_2x.png";
            /*
              Save activity
              */
            ActivityList.pushActivity(
                        Activity.activityId,
                        Activity.activityName,
                        Activity.activityType,
                        Activity.activityTime,
                        Activity.activityWords,
                        Activity.getWordsPerMinute()
                        );
            shareDialog.visible = true;
         }
    }

    Timer {
        id: activityTimer
        interval: 1000
        repeat: true
        onTriggered: {
            Activity.updateTime();
            activityTime.text = qsTr(Activity.getFormattedTime());
            activityWordCount.text = Activity.getWords();
            activityWordsPerMinute.text = Activity.getWordsPerMinute();
        }
    }

    newActivityConfirm.onClicked: {
        /*
          Create activity
          */
        Activity.newActivity( newActivityName.text, newActivityType.currentText )
        /*
          Save activity
          */
        ActivityList.pushActivity(
                    Activity.activityId,
                    Activity.activityName,
                    Activity.activityType,
                    Activity.activityTime,
                    Activity.activityWords,
                    Activity.getWordsPerMinute()
                    );
        /*
          Update UI
          */
        activityTitle.text = newActivityName.text + " / " + newActivityType.currentText;
        activityTime.text = Activity.getFormattedTime();
        activityWordCount.text = Activity.getWords();
        activityWordsPerMinute.text = Activity.getWordsPerMinute();
        state = "closeMenus"
    }

    newActivityCancel.onClicked: state = "closeMenus"
    /*
      activity list view
      */
    function refreshUI() {
        activityTitle.text = Activity.activityName + " / " + Activity.activityType;
        activityTime.text = Activity.getFormattedTime();
        activityWordCount.text = Activity.getWords();
        activityWordsPerMinute.text = Activity.getWordsPerMinute();
    }

    function refreshActivityList() {
        activityListModel.clear();
        var listItems = ActivityList.getActivityList();
        for ( var i = 0; i < listItems.length; i++ ) {
            activityListModel.append(listItems[i]);
            console.log( listItems[i].name + ',' + listItems[i].type );
        }
    }

    ListModel {
        id: activityListModel
    }
    Component {
        id: activityListDelegate

        Item {

            height: 52
            width: parent.width
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.right: parent.right
                anchors.rightMargin: 212
                anchors.verticalCenter: parent.verticalCenter
                text: name + ' / ' + type
                font.pixelSize: 18
            }
            Button {
                width: 64
                height: 48
                anchors.right: parent.right;
                anchors.rightMargin: 144
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("delete")
                onClicked: {
                    console.log( 'delete' + activityid );
                    ActivityList.deleteActivity(activityid);
                    refreshActivityList();
                }
            }
            Button {
                width: 64
                height: 48
                anchors.right: parent.right;
                anchors.rightMargin: 76
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("share")
                onClicked: {
                    onClicked: {
                        var script = Activity.getShareScript();
                        console.log( 'sharing : ' + script);
                        communityForm.communityView.runJavaScript( script );
                    }
                }
            }
            Button {
                width: 64
                height: 48
                anchors.right: parent.right;
                anchors.rightMargin: 8
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("resume")
                onClicked: {
                    onClicked: {
                        console.log( 'resume' + activityid );
                        Activity.setActivity( activityid, name, type, wordcount, time );
                        refreshUI();
                        activityForm.state = "closeMenus";
                    }
                }
            }
        }
    }
 }



