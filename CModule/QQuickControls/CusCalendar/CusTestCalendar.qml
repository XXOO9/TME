﻿import QtQuick 2.12
import QtQuick.Controls 2.12
import "./JavaScript/CommonDefine.js" as Common
import "./Components/"

Item {
    id: root
    width: perColumnWidth * 7
    height: perRowHeight * 8

    property real localFactor: 1

    readonly property real perColumnWidth: 100 * localFactor
    readonly property real perRowHeight: 100 * localFactor

    signal sigQueryDetailDateInfo( var dateIndex, var hour, var timeCnt, var cost )

    Component.onCompleted: {
        let today = Qt.formatDate( new Date(), 'yyyy-MM' ).split( '-' )
        queryDays( today[ 0 ], today[ 1 ] )
    }

    ListModel{  // dateIndex -> 日期 ,   hours  ->  加班时长 , timeCnt -> 倍率 , today -> 今天的日期,  cost -> 消耗的时长
        id: dateInfoModel

        function findDayIndex( tarDayIndex ){
            const size = dateInfoModel.count

            for( let index = 0; index < size; index++ ){
                if( dateInfoModel.get( index ).dateIndex === tarDayIndex ){
                    return index
                }
            }

            return -1
        }

        function findDay( tarDayIndex ){
            const size = dateInfoModel.count

            for( let index = 0; index < size; index++ ){
                if( dateInfoModel.get( index ).dateIndex === tarDayIndex ){
                    return dateInfoModel.get( index )
                }
            }

            return undefined
        }

        function setHighLight( tarDayIndex ){
            let ret = findDay( tarDayIndex )

            if( ret === undefined ){
                return
            }

            ret.today = rue
        }

        function setTargetDayInfo( newDayInfo ){

            dateInfoModel.setProperty( newDayInfo.modelIndex, 'hours', newDayInfo.hour )
            dateInfoModel.setProperty( newDayInfo.modelIndex, 'timeCnt', newDayInfo.timeCnt )
            console.log( 'set new day info finished...' )
        }

        function calculateTotalHours(){
            const size = dateInfoModel.count
            let hours = 0
            let afterCalculateHours = 0
            let costHours = 0

            let tmpDateInfo

            for( let i = 0; i < size; i++ ){
                tmpDateInfo = dateInfoModel.get( i )
                hours += tmpDateInfo.hours
                afterCalculateHours += ( tmpDateInfo.hours * tmpDateInfo.timeCnt )
                costHours += tmpDateInfo.cost
            }

            let ret = [ hours, afterCalculateHours, costHours ]

            return ret
        }
    }

    Rectangle{
        anchors.fill: parent
        color: 'cornflowerblue'
        border{ width: 1.5; color: 'black'}
    }

    Item{
        id: dateAdjustArea
        width: perColumnWidth * 7
        height: perRowHeight
        anchors{ top: parent.top;  horizontalCenter: parent.horizontalCenter }
        Rectangle{
            anchors.fill: parent
            color: 'cadetblue'
        }

        CusLabel{
            id: todayDateLabel
            preFix: '今天是: '
            suffFix: Qt.formatDate( new Date(), 'yyyy-MM-dd' )
            anchors{ top: parent.top; left: parent.left; topMargin: 5 * factor; leftMargin: 10 * factor }
        }

        CusLabel{
            id: userName
            preFix: '打工人: '
            suffFix: InterAction.getUserName()
            anchors{ bottom: parent.bottom; left: parent.left; bottomMargin: 5 * factor; leftMargin: 10 * factor }
        }

        Rectangle{
            id: menuBtn
            width: 30 * factor
            height: width
            color: 'transparent'
            anchors{ verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 15 * factor }
            z: 20
            Image{
                anchors.fill: parent
                source: 'qrc:/resource/menu.png'
                fillMode: Image.PreserveAspectFit

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: menuBtn.opacity = 0.7
                    onClicked: menuPop.open()

                    onEntered: {
                        menuBtn.border.width = 2 * factor
                    }

                    onExited: menuBtn.border.width = 0
                }
            }
        }



        Row{
            spacing: 0
            anchors.centerIn: parent
            z: 10
            NumberAdjustSpin{
                id: yearAdjust
                width: dateAdjustArea.width / 3
                height: dateAdjustArea.height
                onAdjustNumberChanged: queryDays( yearAdjust.adjustNumber, monthAdjust.adjustNumber )
            }

            CusTotalHoursOverview{
                id: hoursOverview
                width: dateAdjustArea.width / 3
                height: dateAdjustArea.height
                hours: 12
            }

            NumberAdjustSpin{
                id: monthAdjust
                width: dateAdjustArea.width / 3
                height: dateAdjustArea.height
                adjustNumber: 11
                adjustUnit: '月'
                max: 12
                min: 1
                onAdjustNumberChanged: {
                    display = String( monthAdjust.adjustNumber ).padStart( 2, '0' )
                    queryDays( yearAdjust.adjustNumber , monthAdjust.adjustNumber )
                }
            }
        }

        MouseArea{
            id: mousArea
            anchors.fill: parent
            enabled: true
            property var startPos

            onDoubleClicked: Qt.quit()

            onPressed: startPos = { 'x': mouseX, 'y': mouseY }

            onPositionChanged: {
                if( !mousArea.pressed ){
                    return
                }

                let xOffset = mousArea.mouseX - startPos.x
                let yOffset = mousArea.mouseY - startPos.y

                moveWindow( xOffset, yOffset )

            }
        }
    }

    Item{
        id: calendarArea
        width: perColumnWidth * 7
        height: perRowHeight * 7
        anchors{ top: dateAdjustArea.bottom; left: dateAdjustArea.left }

        Rectangle{
            anchors.fill: parent
            color: Qt.lighter( 'cornflowerblue', 0.7 )
        }

        Row{
            id: dayWeekRow
            anchors{ top: parent.top; left: parent.left }
            Repeater{
                model: [ '一', '二', '三', '四', '五', '六', '日' ]
                delegate: weekDayCmp
            }
        }

        GridView{
            id: calendarGridView
            width: perColumnWidth * 7
            height: perRowHeight * 6
            cellWidth: perColumnWidth
            cellHeight: perRowHeight
            model: dateInfoModel
            anchors{ top: dayWeekRow.bottom; left: dayWeekRow.left }
            delegate: perRectCmp
        }
    }

    function generateListModelData( days, startWeekDay, dayInfos, cost ){
        dateInfoModel.clear()
        let tmpDayInfo
        for( let index = 0; index < dayInfos.length; index++ ){
            tmpDayInfo = dayInfos[ index ]
            dateInfoModel.append( { 'dateIndex': tmpDayInfo.dateIndex,
                                     'hours': tmpDayInfo.hours,
                                     'today': false,
                                     'timeCnt': tmpDayInfo.timeCnt,
                                     'cost': tmpDayInfo.cost
                                 } )
        }

    }

    //调用后台函数查询月份信息
    function queryDays( year, month ){
        let ret = InterAction.queryTargetDateMonthInfo( year, month )
        generateListModelData( ret.daysInMonth, ret.startWeekDay, ret.dayDetailInfo )
        refreshTotalOverview()
    }

    function setTargetDateIndexInfo( targetDateIndex, hour, timeCnt ){
        let retIndex = dateInfoModel.findDayIndex( targetDateIndex )

        let tmpNewDayInfo = {
            'modelIndex': Number( retIndex ),
            'hour': Number( hour ),
            'timeCnt': Number( timeCnt )
        }

        dateInfoModel.setTargetDayInfo( tmpNewDayInfo )
        refreshTotalOverview()
    }

    function refreshTotalOverview(){
        let retArray = dateInfoModel.calculateTotalHours()
        hoursOverview.hours = retArray[ 0 ]
        hoursOverview.calculateHours = retArray[ 1 ]
        hoursOverview.costHours = retArray[ 2 ]
    }

    function getTargetDayInfo( tarDateIndex ){
        return dateInfoModel.findDay( tarDateIndex )
    }

    Component{
        id: weekDayCmp
        Rectangle{
            id: rect
            visible: modelData !== 0
            width: perColumnWidth
            height: perRowHeight
            color: 'cornflowerblue'
            Text {
                text: modelData
                font{ family: "Microsoft YaHei"; pixelSize: 20 * localFactor; bold: true }
                anchors.centerIn: parent
            }
        }
    }


    Component{
        id: perRectCmp
        Rectangle{
            id: rect
            visible: dateIndex !== 0
            property bool mousHoverd: false
            width: perColumnWidth
            height: perRowHeight
            color: perRectColorProvider( hours )

            Text {
                text: dateIndex
                font{ family: "Microsoft YaHei"; pixelSize: 20 * localFactor; bold: true }
                anchors.centerIn: parent
            }

            MouseArea{
                id: rectMouse
                hoverEnabled: true
                anchors.fill: parent
                onEntered: rect.mousHoverd = true
                onExited: rect.mousHoverd = false

                onDoubleClicked: {
                    Common.curYear = yearAdjust.adjustNumber
                    Common.curMonth = monthAdjust.adjustNumber
                    Common.curDateIndex = dateIndex
                    let targetDay = dateInfoModel.findDay( dateIndex )
                    console.log( "target date info: dateIndex = " + targetDay.dateIndex + ' hour = ' + targetDay.hours + ' timeCnt = ' + targetDay.timeCnt )
                    sigQueryDetailDateInfo( dateIndex, hours, timeCnt, cost )
                }
            }

            states: [
                State{
                    when: rect.mousHoverd
                    PropertyChanges{ target: rect; opacity: 0.8; border.color: 'black' }
                },

                State{
                    when: !rect.mousHoverd
                    PropertyChanges{ target: rect; opacity: 1; border.width: 0 }
                }

            ]

            function perRectColorProvider( hour ){

                if( hour <= 0 ){
                    return 'gray'
                }

                if( hour >=0 && hour <= 2.5 ){
                    return 'khaki'
                }

                if( hour > 2.5 && hour <= 5 ){
                    return 'salmon'
                }

                if( hour >= 6 ){
                    return 'red'
                }
            }
        }
    }
}
