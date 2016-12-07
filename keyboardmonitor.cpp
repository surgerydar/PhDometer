#include "keyboardmonitor.h"
#include "keyboardhook.h"
#include <QDebug>

KeyboardMonitor* KeyboardMonitor::s_shared = nullptr;

KeyboardMonitor::KeyboardMonitor() {
}

KeyboardMonitor::~KeyboardMonitor() {

}
KeyboardMonitor* KeyboardMonitor::shared() {
   if ( !s_shared ) {
       s_shared = new KeyboardMonitor();
   }
   return s_shared;
}
//
//
//
void KeyboardMonitor::pushChar() {
    letter_count++;
    qDebug() << "KeyboardMonitor::pushChar()";
}

void KeyboardMonitor::pushBreak() {
    qDebug() << "KeyboardMonitor::pushBreak()";
    if ( letter_count > 0 ) {
        letter_count = 0;
        word_count++;
        emit newWord();
    }

}

void KeyboardMonitor::removeLastChar() {
    letter_count--;
}

void KeyboardMonitor::install() {
    qDebug() << "Called the C++ slot install";
    installkeyboardhook();
    emit newWord();
}

