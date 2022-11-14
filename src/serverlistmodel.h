#pragma once

#include <QAbstractListModel>
#include <QStringList>

struct ServerItem {
    QString name;
    QString address;
    bool isOnline;
    QStringList users;
};

class ServerListModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum class ServerListRoles : int {
        AddressRole = Qt::UserRole + 1,
        NameRole,
        IsOnlineRole,
        UsersRole
    };

    explicit ServerListModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

public slots:
    void appendItem(QString name, QString address);

private:
    std::vector<ServerItem> data_;
};
