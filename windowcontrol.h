#ifndef WINDOWCONTROL_H
#define WINDOWCONTROL_H

#include <QObject>

class WindowControl : public QObject
{
    Q_OBJECT
public:
    WindowControl();
    static WindowControl* shared();
private:
    static WindowControl* s_shared;
signals:

public slots:
    void alwaysontop();
    void restore();
};

#endif // WINDOWCONTROL_H
