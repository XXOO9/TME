#ifndef CINTERACTION_H
#define CINTERACTION_H

#include <QObject>
#include <QDebug>

class CInterAction : public QObject
{
    Q_OBJECT
public:
    explicit CInterAction(QObject *parent = nullptr);

    Q_INVOKABLE void testVariantMap( QVariantMap map );

signals:

public slots:
};

#endif // CINTERACTION_H