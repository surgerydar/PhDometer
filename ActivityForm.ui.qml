import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: activityPage
    state: "closeMenus"
    property alias activityMenu: activityMenu
    property alias activityPauseResume: activityPauseResume
    property alias activityNew: activityNew
    property alias newActivity: newActivity
    property alias activityList: activityList
    property alias closeActivityList: closeActivityList
    property alias closeNewActivity: closeNewActivity
    property alias activityPreviousMeasure: activityPreviousMeasure
    property alias activityNextMeasure: activityNextMeasure
    property alias measureSwipeView: measureSwipeView
    property alias activityTime: activityTime
    property alias newActivityConfirm: newActivityConfirm
    property alias newActivityName: newActivityName
    property alias newActivityType: newActivityType
    property alias activityTitle: activityTitle
    property alias activityWordCount: activityWordCount
    property alias activityWordsPerMinute: activityWordsPerMinute
    property alias newActivityCancel: newActivityCancel
    property alias activityListView: activityListView
    clip: true

    Text {
        id: activityTitle
        height: 33
        text: qsTr("Default Activity / Writing")
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 8
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: 24
        color: "#284EFF"
    }

    SwipeView {
        id: measureSwipeView
        anchors.right: parent.right
        anchors.rightMargin: 64
        anchors.left: parent.left
        anchors.leftMargin: 64
        anchors.top: parent.top
        anchors.topMargin: 41
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 82

        Item {
            id: measure1
            Text {
                id: activityTime
                text: qsTr("0")
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.right: parent.right
                anchors.rightMargin: 64
                anchors.left: parent.left
                anchors.leftMargin: 64
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 41
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                font.pixelSize: 128
                color: "#284EFF"
            }

            Text {
                id: activityTimeUnits
                y: 365
                height: 33
                text: qsTr("time")
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                color: "#284EFF"
            }
        }

        Item {
            id: measure2
            Text {
                id: activityWordCount
                text: qsTr("0")
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.right: parent.right
                anchors.rightMargin: 64
                anchors.left: parent.left
                anchors.leftMargin: 64
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 41
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                font.pixelSize: 128
                color: "#284EFF"
            }

            Text {
                id: activityWordCountUnits
                y: 365
                height: 33
                text: qsTr("words")
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                color: "#284EFF"
            }
        }

        Item {
            id: measure3
            Text {
                id: activityWordsPerMinute
                text: qsTr("0")
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.right: parent.right
                anchors.rightMargin: 64
                anchors.left: parent.left
                anchors.leftMargin: 64
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 41
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                font.pixelSize: 128
                color: "#284EFF"
            }

            Text {
                id: activityWordsPerMinuteUnits
                y: 365
                height: 33
                text: qsTr("words/minute")
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                color: "#284EFF"
            }
        }

    }


    Button {
        id: activityMenu
        y: 432
        width: 48
        height: 48
        text: qsTr("")
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        background: Image {
            source: "qrc:/icons/ic_menu_2x.png"
            opacity: parent.down ? .5 : parent.enabled ? 1. : .25
        }
    }

    Button {
        id: activityPauseResume
        y: 432
        width: 48
        height: 48
        text: qsTr("")
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        background: Image {
            source: "qrc:/icons/ic_play_circle_filled_2x.png"
            opacity: parent.down ? .5 : parent.enabled ? 1. : .25
        }
    }

    Button {
        id: activityNew
        x: 532
        y: 432
        width: 48
        height: 48
        text: qsTr("")
        enabled: true
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        background: Image {
            source: "qrc:/icons/ic_add_circle_2x.png"
            opacity: parent.down ? .5 : parent.enabled ? 1. : .25
        }
    }

    Button {
        id: activityPreviousMeasure
        width: 48
        height: 48
        text: qsTr("")
        anchors.verticalCenter: measureSwipeView.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 8
        enabled: measureSwipeView.currentIndex > 0
        background: Image {
            source: "qrc:/icons/ic_chevron_left_2x.png"
            opacity: parent.down ? .5 : parent.enabled ? 1. : .25
        }
    }

    Button {
        id: activityNextMeasure
        width: 48
        height: 48
        text: qsTr("")
        anchors.verticalCenter: measureSwipeView.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 8
        enabled: measureSwipeView.currentIndex < measureSwipeView.count - 1
        background: Image {
            source: "qrc:/icons/ic_chevron_right_2x.png"
            opacity: parent.down ? .5 : parent.enabled ? 1. : .25
        }
    }

    Rectangle {
        id: activityList
        width: parent.width
        height: parent.height
        x: -parent.width
        ListView {
            id: activityListView
            anchors.fill: parent
            anchors.topMargin: 64
            orientation: ListView.Vertical
            model: activityListModel
            delegate: activityListDelegate
        }
        Button {
            id: closeActivityList
            width: 48
            height: 48
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.right: parent.right
            anchors.rightMargin: 8
            background: Image {
                source: "qrc:/icons/ic_chevron_left_2x.png"
                opacity: parent.down ? .5 : parent.enabled ? 1. : .25
            }
        }
    }
    Rectangle {
        id: newActivity
        width: parent.width
        height: parent.height
        x: newActivity.width
        Text {
            id: title
            text: qsTr("New Activity")
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.left: parent.left;
            anchors.leftMargin: 8
            anchors.right: parent.right
            anchors.rightMargin: 8
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
        }
        Rectangle {
            anchors.top: parent.top
            anchors.topMargin: 64
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 16
            anchors.left: parent.left
            anchors.leftMargin: 16
            anchors.right: parent.right
            anchors.rightMargin: 16
            TextField {
                id: newActivityName
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                placeholderText: qsTr("Project Name")
            }
            ComboBox {
                id: newActivityType
                anchors.top: parent.top
                anchors.topMargin: 64
                anchors.left: parent.left
                anchors.right: parent.right
                model: ["Drafting","Writing","Editing","Proofreading", "Note Taking"]
            }
            Button {
                id: newActivityCancel
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                text: qsTr("cancel")
            }
            Button {
                id: newActivityConfirm
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                text: qsTr("ok")
                enabled: newActivityName.length > 0
            }
        }
        Button {
            id: closeNewActivity
            width: 48
            height: 48
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
            background: Image {
                source: "qrc:/icons/ic_chevron_right_2x.png"
                opacity: parent.down ? .5 : parent.enabled ? 1. : .25
            }
        }
     }
    states: [
        State {
            name: "newActivityOpen"
            PropertyChanges {
                target: newActivity
                x: 0
            }
            PropertyChanges {
                target: activityList
                x: -activityList.width
            }
        },
        State {
            name: "activityListOpen"
            PropertyChanges {
                target: newActivity
                x: parent.width
            }
            PropertyChanges {
                target: activityList
                x: 0
            }
            /*
            PropertyChanges {
                target: activityListView
                contentHeight: 0
                boundsBehavior: Flickable.StopAtBounds
                orientation: ListView.Vertical
            }
            */
        },
        State {
            name: "closeMenus"
            PropertyChanges {
                target: newActivity
                x: parent.width
            }
            PropertyChanges {
                target: activityList
                x: -activityList.width
            }
        }
    ]
}
