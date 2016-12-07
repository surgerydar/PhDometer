#ifndef KEYBOARDMONITOR_H
#define KEYBOARDMONITOR_H
#include <QObject>

class KeyboardMonitor : public QObject {
    Q_OBJECT
public:
    KeyboardMonitor();
    virtual ~KeyboardMonitor();
    static KeyboardMonitor* shared();
    void pushChar();
    void pushBreak();
    void removeLastChar();
private:
    static KeyboardMonitor* s_shared;
    int letter_count;
    int word_count;
    int last_word_count;
signals:
    void newWord();
    void deletedWord();
public slots:
    void install();
};

#endif // KEYBOARDMONITOR_H
