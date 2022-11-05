﻿#include "CTestDate.h"

#include <QRandomGenerator>

CTestDate::CTestDate()
{
    testQueryDays();
}

void CTestDate::testQueryDays()
{
    QDate curDate = QDate::fromString( "20221101", "yyyyMMdd" );
    qDebug() << curDate.day();
    qDebug() << curDate.dayOfWeek();
    qDebug() << curDate.dayOfYear();
    qDebug() << curDate.daysInMonth();
    qDebug() << curDate.daysInYear();
}

QVariantMap CTestDate::queryResult(int year, int month) const
{
    QVariantMap retMap;
    QDate targetDate;


    targetDate.setDate( year, month, 1 );

    int totalDays = targetDate.daysInMonth();

    QString startDay = QString::number( year ) + QString::number( month ) + "01";
    QString endDay = QString::number( year ) + QString::number( month ) + QString::number( totalDays );

    QVariantList eachDayDetailInfo = m_databaseMgr.queryRangeDateInfo( startDay, endDay );

    retMap =
    {
        { Keys::daysInMonth, totalDays },
        { Keys::startWeekDay, targetDate.dayOfWeek() },
        { Keys::eachDayDetaileInfo, eachDayDetailInfo },
    };

    return retMap;
}

void CTestDate::testInsertTestData()
{
    QDate startDay = QDate::fromString( "20221101", "yyyyMMdd" );
    QDate endDay = QDate::fromString( "20221130", "yyyyMMdd" );
    QDate tmpDay = startDay;

    QRandomGenerator tmpRandom;
    while( tmpDay <= endDay ){
        qDebug() << tmpDay.toString( "yyyyMMdd" );
        int hour = tmpRandom.bounded(0, 10);
        int timeCnt = tmpRandom.bounded( 0, 5 );
        m_databaseMgr.insertNewDateInfo( tmpDay.toString( "yyyyMMdd" ), hour, timeCnt );
        tmpDay = tmpDay.addDays( 1 );
    }
}
