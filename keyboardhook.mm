#include <Cocoa/Cocoa.h>
#include "keyboardmonitor.h"

void installkeyboardhook() {
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask
       handler:^(NSEvent *event){

           NSLog( @"keydown" );
           NSString *chars = [[event characters] lowercaseString];
           unichar character = [chars characterAtIndex:0];
           if ( character == ' ' || character == NSCarriageReturnCharacter ) {
               NSLog( @"word break" );
               KeyboardMonitor::shared()->pushBreak();
           } else {
               KeyboardMonitor::shared()->pushChar();
           }
       }];
}
