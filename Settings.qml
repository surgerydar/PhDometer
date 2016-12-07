import QtQuick 2.7
import "Activity.js" as Activity
import "Settings.js" as Settings

SettingsForm {
    Component.onCompleted: {
        enableAlwaysOnTop.checked = Settings.get('always_on_top') === 'yes';
        if ( enableAlwaysOnTop.checkState ) {
            WindowControl.alwaysontop();
        } else {
            WindowControl.restore();
        }
        enableNotification.checked = Settings.get('enable_notification') === 'yes';
        Activity.notifyUser = enableNotification.checked;
        var notification_period = Settings.get('notification_period');
        if ( notification_period ) {
            notificationPeriod.value = parseInt(notification_period);
        }
    }

    enableNotification.onCheckedChanged: {
        notificationPeriod.enabled = enableNotification.checked;
        Activity.notifyUser = enableNotification.checked;
    }
    notificationPeriod.onValueChanged: {
        Activity.notificationFrequency = notificationPeriod.value;
    }
    enableAlwaysOnTop.onCheckStateChanged: {
        if ( enableAlwaysOnTop.checkState ) {
            WindowControl.alwaysontop();
        } else {
            WindowControl.restore();
        }
    }
    updatePassword.onClicked: {
        if ( newPassword.text.length < 6 ) {
            notificationDialog.text = "password must be longer than 6 characters";
            notificationDialog.visible = true;
        } else if ( newPassword.text !== confirmNewPassword.text ) {
            notificationDialog.text = "paswords must match";
            notificationDialog.visible = true;
        } else {
            var script = 'phdometer.community.modifyUserAccount(' + JSON.stringify( { password: newPassword.text } ) + ');';
            communityForm.communityView.runJavaScript(script);
        }
    }
    logout.onClicked: {
        console.log( 'logout' );
        communityForm.communityView.url = 'http://phdometer-surgeryda.rhcloud.com/logout';
    }
}
