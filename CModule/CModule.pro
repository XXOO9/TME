TEMPLATE = subdirs


#CONFIG( debug, debug | release ){
#        DESTDIR     = $$PWD/debug
#}else
#{
#        DESTDIR     = $$PWD/release
#}


SUBDIRS += \
#    CHttpModule \               ##Qt自带的Http网络模块
#    unitTest     \              ## 单元测试
#    EnumWithQuick \
#    RightMouseClicked
#    MyTableView                   \
#    CustQQuickVirtualKeyBoard      \
#    CustDialog                      \
#    CustListView
#    DynamicCreateComponent
#    CustPopup
#    ShowOpenCVFrame
#    CustStackView
#    CTestShardLibrary \
#    GoogleTest
#     CustComboBox       ##### 自定义的下拉框( 可移植 )
#    MultiThreadDemo \
#    SqlDemo     #####   数据库sql操作( 批量插入GECG的假数据 )
#    CMultiThreadDemo
#    CustControls
#    ProcessChat
#    ProcessCommunication
#    QTimerDemo \
#    widgetSignPainter
#    SingletonHttpClicentThread
#    judgeDebugModel
#    SignalSync
#    CustProgressBar
#    UsageCfile
#    TableView_Version_2
#    CustLoading
#    QDateTimeIntervalDemo
#    EChartDemo
#    RegularExpressionDemo
#    QtTestFrameWork
#    gmy
#    DemoRadioBtn
#    QThreadControl
#    CreateDmpFile
#    DemoQMLUI
#    Demo
#    DemoJsModelTableView
#    DemoTextCode
#    DemoGrid
#    DemoTabView
#    DemoCircle
#    DemoQCustomplot
#    DemoVideoPlayer
#    DemoTextDisplayDifferentStyleText
#    DemoChartjs
#    DemoTreeView           #not yet
#    DemoChart
    QQuickControls         #####    qml demo
#    NetWorkGroup
#    FileAutoBackup
#    CusWidgetControl
#    JavaScriptDemos
#    QSqlTableModelDemo  ##据说一次最多只能查询256条数据，故暂时不研究这个
#    ffmpeg            #### ffmpeg 学习例子
#    QSqlTableModelDemo
#    opencvDemo     ############   opencv 例子
#    callQmlFuncsInCpp
#    DemoModelFilter     ##数据模型排序过滤
#    DemoEnumVal2KeyString  ## 枚举转字符串       包含了注册枚举类型到qml
#    QPainterDemo        ##  可以参考 opencv例子
#    CusTools
#    QQuickRender        #### qml 渲染

