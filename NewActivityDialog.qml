import QtQuick 2.3
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

Dialog {
    visible: false
    title: "New Activity"
    standardButtons: StandardButton.Ok | StandardButton.Cancel

    TextField {
        id: activityName
        placeholderText: qsTr("activity name")
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
        font.pixelSize: 24
    }

    ComboBox {
        id: activityType
        model: ["Draft", "Write", "Edit", "Proofread", "Note Taking"]
        anchors.top: activityName.bottom
        anchors.topMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
        font.pixelSize: 24
    }
}
