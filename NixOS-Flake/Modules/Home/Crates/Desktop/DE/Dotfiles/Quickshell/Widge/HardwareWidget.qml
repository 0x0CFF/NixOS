import QtQuick
import QtQuick.VectorImage

import qs.Theme         // 导入 Theme 目录

Item {

    property real margin: 4

    // 宽度和高度由内部的 Row 决定
    width: row.width + margin * 2
    height: 30

    // 背景矩形
    Rectangle {
        anchors.fill: parent
        color: Theme.wrapper
        radius: 6
    }

    Row {
        id:row
        spacing: 4      // 子项之间的间距
        height: 30      // 固定高度，比文字高
        // 将组件的垂直中心对齐到父项的垂直中心
        anchors.verticalCenter: parent.verticalCenter
        // 将组件的水平中心对齐到父项的水平中心
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            // 宽度和高度由内部的 Row 决定
            width: child4.width + margin * 2
            height: 22
            color: "transparent"

            // 将项目的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter


            // 背景矩形
            Rectangle {
                anchors.fill: parent
                color: Theme.surface
                radius: 6
            }

            Row {
                id: child4
                height: 22
                spacing: 4                          // 子项之间的间距
                // 将组件的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将组件的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter

                VectorImage {
                    source: "../Assets/SVG/HugeiconsDashboardSpeed02.svg"
                    width: 14
                    height: 14
                    // 使用 VectorImage.CurveRenderer 渲染器类型，对于需要变换和抗锯齿的场景建议使用此渲染器
                    preferredRendererType: VectorImage.CurveRenderer
                    // 将项目的垂直中心对齐到父项的垂直中心
                    anchors.verticalCenter: parent.verticalCenter
                }

                Text {
                    text: "2.2M"
                    font.pixelSize: 10
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }
            }
        }

        Rectangle {
            // 宽度和高度由内部的 Row 决定
            width: 22
            height: 22
            color: "transparent"

            // 将项目的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter

            // 背景矩形
            Rectangle {
                anchors.fill: parent
                color: Theme.surface
                radius: 6
            }

            VectorImage {
                source: "../Assets/SVG/HugeiconsBluetooth.svg"
                width: 14
                height: 14
                // 使用 VectorImage.CurveRenderer 渲染器类型，对于需要变换和抗锯齿的场景建议使用此渲染器
                preferredRendererType: VectorImage.CurveRenderer
                // 将项目的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将项目的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            // 宽度和高度由内部的 Row 决定
            width: 22
            height: 22
            color: "transparent"

            // 将项目的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter

            // 背景矩形
            Rectangle {
                anchors.fill: parent
                color: Theme.surface
                radius: 6
            }

            VectorImage {
                source: "../Assets/SVG/HugeiconsVolumeHigh.svg"
                width: 14
                height: 14
                // 使用 VectorImage.CurveRenderer 渲染器类型，对于需要变换和抗锯齿的场景建议使用此渲染器
                preferredRendererType: VectorImage.CurveRenderer
                // 将项目的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将项目的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            // 宽度和高度由内部的 Row 决定
            width: child0.width + margin * 2
            height: 22
            color: "transparent"

            // 将项目的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter


            // 背景矩形
            Rectangle {
                anchors.fill: parent
                color: Theme.surface
                radius: 6
            }

            Row {
                id: child0
                height: 22
                spacing: 4                          // 子项之间的间距
                // 将组件的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将组件的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    text: "CPU"
                    font.pixelSize: 10
                    font.bold: true
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }

                Text {
                    text: "70%"
                    font.pixelSize: 10
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }
            }
        }

        Rectangle {
            // 宽度和高度由内部的 Row 决定
            width: child1.width + margin * 2
            height: 22
            color: "transparent"

            // 将项目的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter


            // 背景矩形
            Rectangle {
                anchors.fill: parent
                color: Theme.surface
                radius: 6
            }

            Row {
                id: child1
                height: 22
                spacing: 4                          // 子项之间的间距
                // 将组件的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将组件的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    text: "GPU"
                    font.pixelSize: 10
                    font.bold: true
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }

                Text {
                    text: "20%"
                    font.pixelSize: 10
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }
            }
        }

        Rectangle {
            // 宽度和高度由内部的 Row 决定
            width: child2.width + margin * 2
            height: 22
            color: "transparent"

            // 将项目的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter


            // 背景矩形
            Rectangle {
                anchors.fill: parent
                color: Theme.surface
                radius: 6
            }

            Row {
                id: child2
                height: 22
                spacing: 4                          // 子项之间的间距
                // 将组件的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将组件的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    text: "RAM"
                    font.pixelSize: 10
                    font.bold: true
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }

                Text {
                    text: "70%"
                    font.pixelSize: 10
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }
            }
        }
    }
}
