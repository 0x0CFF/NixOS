import QtQuick
import QtQuick.VectorImage
import Quickshell.Services.Notifications

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
        id: row
        spacing: 4      // 子项之间的间距
        height: 30      // 固定高度，比文字高
        // 将项目的垂直中心对齐到父项的垂直中心
        anchors.verticalCenter: parent.verticalCenter
        // 将项目的水平中心对齐到父项的水平中心
        anchors.horizontalCenter: parent.horizontalCenter

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
                color: "#46474E"
                radius: 6
            }

            VectorImage {
                source: "../Assets/SVG/HugeiconsInputCursorText.svg"
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
                color: "#46474E"
                radius: 6
            }

            VectorImage {
                source: "../Assets/SVG/HugeiconsCenterFocus.svg"
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
                color: "#46474E"
                radius: 6
            }

            VectorImage {
                source: "../Assets/SVG/HugeiconsNotificationOff01.svg"
                width: 14
                height: 14
                // 使用 VectorImage.CurveRenderer 渲染器类型，对于需要变换和抗锯齿的场景建议使用此渲染器
                preferredRendererType: VectorImage.CurveRenderer
                // 将项目的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将项目的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // TODO
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
                color: "#46474E"
                radius: 6
            }

            VectorImage {
                source: "../Assets/SVG/HugeiconsMoon02.svg"
                width: 14
                height: 14
                // 使用 VectorImage.CurveRenderer 渲染器类型，对于需要变换和抗锯齿的场景建议使用此渲染器
                preferredRendererType: VectorImage.CurveRenderer
                // 将项目的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将项目的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // TODO
                }
            }
        }
    }
}
