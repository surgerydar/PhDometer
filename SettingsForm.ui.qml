import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: item1
    property alias enableAlwaysOnTop: enableAlwaysOnTop
    property alias enableNotification: enableNotification
    property alias notificationPeriod: notificationPeriod
    property alias accountPane: accountPane
    property alias confirmNewPassword: confirmNewPassword
    property alias newPassword: newPassword
    property alias updatePassword: updatePassword
    property alias logout: logout

    Pane {
        id: pane1
        x: 135
        width: 371
        height: 71
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 16

        CheckBox {
            id: enableNotification
            x: 6
            y: 4
            text: qsTr("notify me every")
        }

        SpinBox {
            id: notificationPeriod
            x: 152
            y: 4
            enabled: false
            from: 50
            value: 50
            to: 1000
            stepSize: 50
        }

        Text {
            id: text1
            x: 298
            y: 4
            width: 38
            height: 40
            color: "#3c3c3c"
            text: qsTr("words")
            font.family: "Arial"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 12
        }


    }

    Pane {
        id: pane2
        x: 134
        y: 87
        width: 371
        height: 71
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 103

        CheckBox {
            id: enableAlwaysOnTop
            x: 7
            y: 4
            text: qsTr("always on top")
        }
    }

    Pane {
        id: accountPane
        x: 0
        width: 371
        height: 158
        anchors.horizontalCenterOffset: 1
        enabled: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 190

        TextField {
            id: newPassword
            x: 0
            y: 0
            width: 234
            height: 40
            placeholderText: qsTr("new password")
            echoMode: TextInput.Password
        }

        TextField {
            id: confirmNewPassword
            x: 0
            y: 46
            width: 234
            height: 40
            placeholderText: qsTr("confirm new password")
            echoMode: TextInput.Password
        }

        Button {
            id: updatePassword
            x: 247
            y: 0
            text: qsTr("Update")
        }

        Button {
            id: logout
            x: 247
            y: 94
            text: qsTr("Logout")
        }
    }
}
