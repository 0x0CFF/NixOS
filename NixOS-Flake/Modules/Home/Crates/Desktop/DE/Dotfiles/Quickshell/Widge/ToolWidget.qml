import QtQuick

Item {

    property real margin: 4
    
    // 宽度和高度由内部的 Row 决定
    width: row.width + margin * 2
    height: 30

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
        // 将项目的垂直中心对齐到父项的垂直中心
        anchors.verticalCenter: parent.verticalCenter
        // 将项目的水平中心对齐到父项的水平中心
        anchors.horizontalCenter: parent.horizontalCenter

        Item {
            // 宽度和高度由内部的 Row 决定
            width: 22
            height: 22

            // 将项目的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter

            // 背景矩形
            Rectangle {
                anchors.fill: parent
                color: "#46474E"
                radius: 6
            }

            Image {
                source: "../Assets/SVG/HugeiconsTextSquare.svg"
                width: 14
                height: 14
                // 将项目的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将项目的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Item {
            // 宽度和高度由内部的 Row 决定
            width: 22
            height: 22

            // 将项目的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter

            // 背景矩形
            Rectangle {
                anchors.fill: parent
                color: "#46474E"
                radius: 6
            }

            Image {
                source: "../Assets/SVG/HugeiconsColorPicker.svg"
                width: 14
                height: 14
                // 将项目的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将项目的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Item {
            // 宽度和高度由内部的 Row 决定
            width: 22
            height: 22

            // 将项目的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter

            // 背景矩形
            Rectangle {
                anchors.fill: parent
                color: "#46474E"
                radius: 6
            }

            Image {
                source: "../Assets/SVG/HugeiconsFullScreen.svg"
                width: 14
                height: 14
                // 将项目的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将项目的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
