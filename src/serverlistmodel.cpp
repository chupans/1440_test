#include "serverlistmodel.h"

ServerListModel::ServerListModel(QObject *parent)
    : QAbstractListModel(parent)
{
    data_ = {
        ServerItem {"localhost", "127.0.0.1", false, {} },
        ServerItem {"SPM-1", "spm1.sreda.1440.space", true, {"J.Tuesday", "J.Wednesday"} },
        ServerItem {"SPM-1", "192.168.1.42", true, {"J.Tuesday"} },
        ServerItem {"SPM-1", "spm1.sreda.1440.space", true, {"J.Wednesday"} },
        ServerItem {"SPM-1", "spm1.sreda.1440.space", true, {"J.Thurday"} },
        ServerItem {"SPM-1", "spm1.sreda.1440.space", true, {"J.Friday"} },
    };
}

int ServerListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    return data_.size();
}

QVariant ServerListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();


    if(index.row() >= rowCount())
        QVariant();

    auto castedRole = static_cast<ServerListRoles>(role);
    auto& requiredRow = data_[index.row()];

    switch (castedRole)
    {
    case ServerListRoles::NameRole:
        return requiredRow.name;
    case ServerListRoles::AddressRole:
        return requiredRow.address;
    case ServerListRoles::IsOnlineRole:
        return requiredRow.isOnline;
    case ServerListRoles::UsersRole:
        return requiredRow.users;
    default:
        break;

    }
    return QVariant();
}

QHash<int, QByteArray> ServerListModel::roleNames() const
{
    return {
        {static_cast<int>(ServerListRoles::NameRole), "name"},
        {static_cast<int>(ServerListRoles::AddressRole), "address"},
        {static_cast<int>(ServerListRoles::IsOnlineRole), "isOnline"},
        {static_cast<int>(ServerListRoles::UsersRole), "users"},
    };
}

void ServerListModel::appendItem(QString name, QString address)
{
    beginInsertRows(QModelIndex(), data_.size(), data_.size());
    data_.push_back({name, address, true, {}});
    endInsertRows();
}

