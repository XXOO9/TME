/****************************************************************************
** Meta object code from reading C++ file 'ThreadMgr.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../ThreadMgr.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ThreadMgr.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ThreadMgr_t {
    QByteArrayData data[8];
    char stringdata0[76];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ThreadMgr_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ThreadMgr_t qt_meta_stringdata_ThreadMgr = {
    {
QT_MOC_LITERAL(0, 0, 9), // "ThreadMgr"
QT_MOC_LITERAL(1, 10, 10), // "startPrint"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 10), // "stopThread"
QT_MOC_LITERAL(4, 33, 10), // "killThread"
QT_MOC_LITERAL(5, 44, 14), // "timerControler"
QT_MOC_LITERAL(6, 59, 2), // "ok"
QT_MOC_LITERAL(7, 62, 13) // "deletePrinter"

    },
    "ThreadMgr\0startPrint\0\0stopThread\0"
    "killThread\0timerControler\0ok\0deletePrinter"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ThreadMgr[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   39,    2, 0x02 /* Public */,
       3,    0,   40,    2, 0x02 /* Public */,
       4,    0,   41,    2, 0x02 /* Public */,
       5,    1,   42,    2, 0x02 /* Public */,
       7,    0,   45,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    6,
    QMetaType::Void,

       0        // eod
};

void ThreadMgr::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ThreadMgr *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->startPrint(); break;
        case 1: _t->stopThread(); break;
        case 2: _t->killThread(); break;
        case 3: _t->timerControler((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 4: _t->deletePrinter(); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject ThreadMgr::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_ThreadMgr.data,
    qt_meta_data_ThreadMgr,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *ThreadMgr::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ThreadMgr::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ThreadMgr.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ThreadMgr::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
