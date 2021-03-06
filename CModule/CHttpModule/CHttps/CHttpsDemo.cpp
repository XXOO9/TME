#include "CHttpsDemo.h"

CHttpsDemo::CHttpsDemo(QObject *parent)
    : QObject{parent}
{
    test();
}

void CHttpsDemo::test()
{
    m_pNetWorkMgr = new QNetworkAccessManager( this );

    QNetworkRequest request;
    request.setUrl( QUrl( "https://localhost:444/http-test/param?id=100" ) );


    m_pNetWorkMgr->get( request );
}

void CHttpsDemo::onNewReplyAvaulable(QNetworkReply *pReply)
{
    if( pReply->error() != QNetworkReply::NoError ){
        qDebug() << "error" << pReply->errorString();
        pReply->deleteLater();
        pReply = nullptr;
        return;
    }

    qDebug() << "ret = " << pReply->readAll();
}
