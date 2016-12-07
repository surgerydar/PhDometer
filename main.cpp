#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickView>
#include <QtWebEngine/qtwebengineglobal.h>
#include "keyboardmonitor.h"
#include "windowcontrol.h"

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QtWebEngine::initialize();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("KeyboardMonitor", KeyboardMonitor::shared());
    engine.rootContext()->setContextProperty("WindowControl", WindowControl::shared());
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
    /*
    QGuiApplication app(argc, argv);
    QtWebEngine::initialize();
    KeyboardMonitor monitor;
    QQuickView view;
    view.engine()->rootContext()->setContextProperty("KeyboardMonitor", &monitor);
    view.setSource(QUrl(QLatin1String("qrc:/main.qml"));
    view.show();

    return app.exec();
    */
}
