import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.1
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.0

import "Activity.js" as Activity
import "Settings.js" as Settings

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    minimumWidth: 400
    minimumHeight: 360
    property bool applicationClosing: false

    title: qsTr("PhDometer 3.0")
    /*
    onWidthChanged:{
        console.log( 'width: ' + width + ' height: ' + height );
    }
    onHeightChanged: {
        console.log( 'width: ' + width + ' height: ' + height );
    }
    */
    onClosing : {
        Settings.set('current_activity',Activity.activityId);
        Settings.set('always_on_top', settingsForm.enableAlwaysOnTop.checkState ? 'yes' : 'no');
        Settings.set('enable_notification', settingsForm.enableNotification.checkState ? 'yes' : 'no');
        Settings.set('notification_period', settingsForm.notificationPeriod.value.toString());
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Activity {

        }

        Community {
            id : communityForm
        }

        Settings {
            id : settingsForm
        }

    }

    header: TabBar {
        id: tabBar

        TabButton {
            id: activityTab
            text: qsTr("Activity")
            height: 40
            contentItem: Label {
                    text: activityTab.text
                    font: activityTab.font
                    anchors.horizontalCenter: parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: activityTab.checked ? "#284EFF" : "white"
                }
            background: Rectangle {
                color: activityTab.checked ? "white" : "#284EFF"
                anchors.fill: parent;
            }
        }
        TabButton {
            id: communityTab
            text: qsTr("Community")
            height: 40
            contentItem: Label {
                    text: communityTab.text
                    font: communityTab.font
                    anchors.horizontalCenter: parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: communityTab.checked ? "#284EFF" : "white"
                }
            background: Rectangle {
                color: communityTab.checked ? "white" : "#284EFF"
                anchors.fill: parent;
            }
        }
        TabButton {
            id: settingsTab
            text: qsTr("Settings")
            height: 40
            contentItem: Label {
                    text: settingsTab.text
                    font: settingsTab.font
                    anchors.horizontalCenter: parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: settingsTab.checked ? "#284EFF" : "white"
                }
            background: Rectangle {
                color: settingsTab.checked ? "white" : "#284EFF"
                anchors.fill: parent;
            }
        }
    }

    footer: Rectangle {
        height: 64
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.bottomMargin: -1
        color: "white"
        border.color: "#284EFF"
        border.width: 1
        Button {
            id: website
            y: 432
            width: 48
            height: 48
            text: qsTr("")
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            background: Image {
                source: "qrc:/icons/website.png"
                opacity: parent.down ? .5 : parent.enabled ? 1. : .25
            }
            onClicked: {
                Qt.openUrlExternally('http://www.phd2published.com');
            }
        }
        Button {
            id: twitter
            y: 432
            width: 48
            height: 48
            text: qsTr("")
            anchors.left: parent.left
            anchors.leftMargin: 64
            anchors.verticalCenter: parent.verticalCenter
            background: Image {
                source: "qrc:/icons/twitter_circle.png"
                opacity: parent.down ? .5 : parent.enabled ? 1. : .25
            }
            onClicked: {
                Qt.openUrlExternally('https://twitter.com/phd2published');
            }
        }
        Button {
            id: facebook
            y: 432
            width: 48
            height: 48
            text: qsTr("")
            anchors.left: parent.left
            anchors.leftMargin: 120
            anchors.verticalCenter: parent.verticalCenter
            background: Image {
                source: "qrc:/icons/facebook_circle.png"
                opacity: parent.down ? .5 : parent.enabled ? 1. : .25
            }
            onClicked: {
                Qt.openUrlExternally('https://www.facebook.com/PhD2Published');
            }
        }
     }

    MessageDialog {
        id: shareDialog
        title: "PhDometer 3.0"
        text: "do you want to share your activity?"
        standardButtons: StandardButton.Yes | StandardButton.No
        onYes: {
            var script = Activity.getShareScript();
            console.log( 'sharing : ' + script);
            communityForm.communityView.runJavaScript( script );
         }
    }

    MessageDialog {
        id: notificationDialog
        title: "PhDometer 3.0"
        standardButtons: StandardButton.Ok
    }
    MessageDialog {
        id: closeConfirmation
        title: "PhDometer 3.0"
        text: "are you sure you want to quit?"
        standardButtons: StandardButton.Yes | StandardButton.No
        onNo: {
            applicationClosing = false;
        }
        onYes: {
            applicationClosing = true;
            Qt.quit();
        }

    }

    SoundEffect {
         id: playSound
         source: "qrc:/applause.wav"
     }

}
