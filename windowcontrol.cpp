#include "windowcontrol.h"
#include "nativewindowcontrol.h"
#include <QDebug>

WindowControl* WindowControl::s_shared = nullptr;

WindowControl::WindowControl()
{

}

WindowControl* WindowControl::shared() {
   if ( !s_shared ) {
       s_shared = new WindowControl();
   }
   return s_shared;
}

void WindowControl::alwaysontop() {
    qDebug() << "Called the C++ slot install";
    setalwaysontop(true);
}
void WindowControl::restore() {
    qDebug() << "Called the C++ slot install";
    setalwaysontop(false);
}
