import QtQuick 2.7

CommunityForm {
    communityView.onLoadProgressChanged : {
        console.log( "load progress changed" );
    }
    communityView.onUrlChanged: {
        console.log( "url changed" );
    }
    communityView.onJavaScriptConsoleMessage : {
        try {
            var command = JSON.parse(message);
            if ( command ) {
                switch ( command.subject ) {
                    case 'activity' : {
                        if ( command.status === 'ERROR' ) {
                            notificationDialog.text = command.message;
                            notificationDialog.visible = true;
                            tabBar.setCurrentIndex(1);
                        } else {
                            notificationDialog.text = command.message;
                            notificationDialog.visible = true;
                        }

                    }
                    case 'login' : {
                        if ( command.status === 'OK' ) {
                            // enable user account settings
                            console.log( 'logged in' );
                            settingsForm.accountPane.enabled = true;
                        } else {
                            settingsForm.accountPane.enabled = false;
                        }
                        break;
                    }
                    case 'logout' : {
                        if ( command.status === 'OK' ) {
                            // enable user account settings
                            console.log( 'logged out' );
                            settingsForm.accountPane.enabled = false;
                        }
                        break;
                    }
                    case 'user' : {
                        if ( command.status === 'OK' ) {
                            notificationDialog.text = 'password reset';
                         } else {
                            notificationDialog.text = 'unable to reset password : ' + command.message;
                        }
                        notificationDialog.visible = true;
                        break;
                    }
                }
            }
        } catch(err) {
            console.log( 'message from community : ' + message );
        }
    }
}
