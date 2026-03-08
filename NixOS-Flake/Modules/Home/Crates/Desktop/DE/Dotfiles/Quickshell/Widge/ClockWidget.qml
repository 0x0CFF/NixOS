import QtQuick

import qs.Singleton     // 导入 Singleton 目录
import qs.Theme         // 导入 Theme 目录


Item {
    // 宽度和高度由内部的 Row 决定
    width: row.width + 12
    height: row.height

    // 背景矩形
    Rectangle {
        anchors.fill: parent
        color: "#231E22"
        radius: 6
    }

    Row {
        id: row
        spacing: 6      // 子项之间的间距
        height: 30      // 固定高度，比文字高
        anchors.centerIn: parent

        Text {
            // 直接访问时间单例的时间属性
            text: Time.value
            font.pixelSize: 12
            color: "#FFFFFF"
            height: parent.height                 // 填充整个 Row 的高度
            verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
        }

        Text {
            text: "•"
            font.pixelSize: 12
            color: "#FFFFFF"
            height: parent.height                 // 填充整个 Row 的高度
            verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
        }

        Text {
            // 直接访问时间单例的时间属性
            text: Data.value
            font.pixelSize: 10
            color: "#FFFFFF"
            height: parent.height                 // 填充整个 Row 的高度
            verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
        }

        Item {
            // 宽度和高度由内部的 Row 决定
            width: weather.width + 12
            height: weather.height

            // 让 Row 自己相对于父容器垂直居中
            anchors.verticalCenter: parent.verticalCenter

            // 背景矩形
            Rectangle {
                anchors.fill: parent
                color: "#3B3338"
                radius: 6
            }

            Text {
                id: weather
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter  // 水平也居中
                text: "⛅ +26°C"
                font.pixelSize: 12
                color: "#FFFFFF"
                height: 22                            // 填充整个 Row 的高度
                verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
            }
        }
    }
}
