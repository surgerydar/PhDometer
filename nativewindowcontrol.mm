#include <Cocoa/Cocoa.h>
#include "nativewindowcontrol.h"

void setalwaysontop(bool ontop) {
    NSWindow* window = [[NSApplication sharedApplication] mainWindow];
    if ( ontop ) {
        [window setLevel:NSFloatingWindowLevel];
    } else {
        [window setLevel:NSNormalWindowLevel];
    }
}
