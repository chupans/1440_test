#include <memory>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "windowcontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;
    const QUrl surl(u"qrc:/test_task/src/qml/Style/Globals.qml"_qs);
    qmlRegisterSingletonType(surl, "GlobalStyle", 1, 0, "GlobalStyle");

    WindowController controller(engine);

    return app.exec();
}
