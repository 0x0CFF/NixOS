import QtQuick

import qs.Singleton     // 导入 Singleton 目录
import qs.Theme         // 导入 Theme 目录

Item {

    property real margin: 4
    
    // 宽度和高度由内部的 Row 决定
    width: row.width + margin * 2
    height: row.height

    // 背景矩形
    Rectangle {
        anchors.fill: parent
        color: "#27282C"
        radius: 6
    }

    Row {
        id: row
        spacing: 4      // 子项之间的间距
        height: 30      // 固定高度，比文字高
        // 将组件的垂直中心对齐到父项的垂直中心
        anchors.verticalCenter: parent.verticalCenter
        // 将组件的水平中心对齐到父项的水平中心
        anchors.horizontalCenter: parent.horizontalCenter

        Item {
            width: child.width + margin * 2
            height: child.height
            // 将组件的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter
            
            Row {
                id: child
                height: 22
                spacing: 4                          // 子项之间的间距
                // 将组件的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将组件的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    // 直接访问时间单例的时间属性
                    text: Time.value
                    font.pixelSize: 13
                    color: "#FFFFFF"
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }
        
                Text {
                    text: "•"
                    font.pixelSize: 13
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
            }
        }

        Item {
            // 宽度和高度由内部的 Row 决定
            width: weather.width + margin * 2
            height: weather.height

            // 将组件的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter

            // 背景矩形
            Rectangle {
                anchors.fill: parent
                color: "#46474E"
                radius: 6
            }

            Text {
                id: weather
                // 将组件的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将组件的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter
                text: "⛅ +26°C"
                font.pixelSize: 11
                color: "#FFFFFF"
                height: 22
                verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
            }
        }
    }
}
