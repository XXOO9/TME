﻿#ifndef CHTTPGETVIDEOURLS_H
#define CHTTPGETVIDEOURLS_H

#include <QObject>
#include "../CHttpAbstractNetWork/CHttpAbstractNetWork.h"
#include "../chttpmodule_global.h"
#include "CGetSyncVideoUrlsRet.h"

class CHTTPMODULESHARED_EXPORT CHttpGetVideoUrls : public CHttpAbstractNetWork
{
public:
    CHttpGetVideoUrls( QString timeStamp );

    virtual ~CHttpGetVideoUrls() override;

    virtual void initConfig() override;
    virtual void initConnection() override;
    virtual void httpRequest() override;
    virtual bool parseJson() override;
    virtual bool isParameterEmpty() override;

    int resultCount();

    QMap<QString, QString> getGroupRet( int index );
    QString getSingleRet( int index, QString key );

public slots:
    virtual void onNewReplyAvailable( QNetworkReply *pReply ) override;
    virtual void onTimeoutHandler() override;

private:
    CGetSyncVideoUrlsRet m_rets;
};

#endif // CHTTPGETVIDEOURLS_H
