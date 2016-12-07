import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtWebEngine 1.0

Item {
    property alias communityView: communityView
    WebEngineView {
        id: communityView
        url: "http://phdometer-surgeryda.rhcloud.com/community"
        /*url: "http://localhost:3000/community"*/
        anchors.fill: parent
    }
}
