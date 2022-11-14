#pragma once

#include <QObject>
#include <QQmlApplicationEngine>
#include "serverlistmodel.h"

class WindowController : public QObject
{
    Q_OBJECT
public:
    explicit WindowController(QQmlApplicationEngine &context);

public slots:
    void connect(int itemNo);

private:
    std::shared_ptr<ServerListModel> model_;
    QObject *rootObject_;

};
