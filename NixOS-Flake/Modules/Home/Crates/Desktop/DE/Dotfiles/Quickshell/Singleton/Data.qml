// 该行代码，将类型变成单例
pragma Singleton

import Quickshell
import QtQuick
import QtQml
    
Singleton {
    id: root

    // 一个表达式可以使用 {} 跨多行
    readonly property string value: {
        // 传递的格式字符串与 `date` 命令的默认输出相匹配
        Qt.formatDateTime(currentDate.date, "MM 月 dd 日 dddd")
    }

    SystemClock {
        id: currentDate
        precision: SystemClock.Seconds
    }
}
