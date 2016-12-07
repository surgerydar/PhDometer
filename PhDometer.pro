
QT += qml quick webengine multimedia

CONFIG += c++11

SOURCES += main.cpp \
    keyboardmonitor.cpp \
    windowcontrol.cpp

RESOURCES += qml.qrc

LIBS += -framework Cocoa

ICON = phdometer.icns

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

OBJECTIVE_SOURCES += \
    keyboardhook.mm \
    nativewindowcontrol.mm

HEADERS += \
    keyboardmonitor.h \
    keyboardhook.h \
    windowcontrol.h \
    nativewindowcontrol.h

DISTFILES += \
    default.html
