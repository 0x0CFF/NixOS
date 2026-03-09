import QtQuick
import Quickshell


import qs.Theme         // 导入 Theme 目录
import qs.Widge         // 导入 Widge 目录

PanelWindow {
    
    id: root

    // 可配置属性
    property string corner: "top-left"       // top-left, top-right, bottom-left, bottom-right
    property color maskColor: "#1e1e2e"      // 你的背景色
    property int radius: 20                  // 圆角半径
    property bool deadPixelWorkaround: true  // 死像素补偿

    // 窗口基础设置
    color: "#ffffff"

    // 死像素补偿偏移量
    property int offset: deadPixelWorkaround ? 1 : 0

    // 根据角落设置锚点和窗口大小
    anchors {
        top: corner.includes("top") ? parent.top : undefined
        bottom: corner.includes("bottom") ? parent.bottom : undefined
        left: corner.includes("left") ? parent.left : undefined
        right: corner.includes("right") ? parent.right : undefined
    }

    width: radius
    height: radius

    // 根据角落设置圆角参数
    RoundCorner {
        anchors.fill: parent
        cornerColor: root.maskColor
        cornerRadius: root.radius

        startX: {
            if (corner.includes("left")) return 0
            else return width
        }

        startY: {
            if (corner.includes("top")) return 0
            else return height
        }

        startAngle: {
            if (corner == "top-left") return 180
            if (corner == "top-right") return -90
            if (corner == "bottom-left") return 90
            if (corner == "bottom-right") return 0
            return 180
        }
    }
}
