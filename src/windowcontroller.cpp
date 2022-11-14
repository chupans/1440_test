#include "windowcontroller.h"
#include <QQmlContext>
#include <QCoreApplication>


WindowController::WindowController(QQmlApplicationEngine &engine)
    : QObject{nullptr}, model_(std::make_shared<ServerListModel>())
{
    engine.rootContext()->setContextProperty("serversModel", model_.get());

    const QUrl url(u"qrc:/test_task/src/qml/main.qml"_qs);

    engine.load(url);

    rootObject_ = engine.rootObjects().first();
    QObject::connect(rootObject_, SIGNAL(addItemRequested(QString, QString)),
                     model_.get(), SLOT(appendItem(QString, QString)));

    QObject::connect(rootObject_, SIGNAL(connectRequested(int)),
                     this, SLOT(connect(int)));
}

void WindowController::connect(int itemNo)
{
    QMetaObject::invokeMethod(rootObject_, "connectionFinished",
            Q_ARG(bool, true));
}
