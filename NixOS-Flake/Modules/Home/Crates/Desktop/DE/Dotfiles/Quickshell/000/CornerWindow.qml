import Quickshell
import QtQml

// 屏幕假圆角组件 - 在屏幕四角绘制半透明遮罩
Item {
    id: root
    
    // 可配置属性
    property int radius: 15                    // 圆角半径（像素）
    property int screenWidth: 1920              // 屏幕宽度（可选，默认值）
    property int screenHeight: 1080             // 屏幕高度（可选，默认值）
    property real opacity: 1.0                   // 遮罩透明度
    property string maskColor: "black"           // 遮罩颜色（建议与背景色匹配）
    property bool enableCorners: true            // 是否启用所有角落
    property bool enableTopLeft: true            // 单独控制左上角
    property bool enableTopRight: true           // 单独控制右上角
    property bool enableBottomLeft: true         // 单独控制左下角
    property bool enableBottomRight: true        // 单独控制右下角
    property int deadPixelOffset: 0               // 死像素补偿（向内偏移像素数）
    
    // 调试模式 - 显示彩色半透明区域便于调整
    property bool debugMode: false
    
    // 组件大小设置为覆盖整个屏幕
    width: screenWidth
    height: screenHeight
    
    // 让组件不拦截鼠标事件，下方的应用仍可正常交互
    // 使用 Item 作为容器，不设置任何鼠标处理
    
    // 左上角遮罩
    Rectangle {
        id: topLeftMask
        visible: enableCorners && enableTopLeft
        width: radius + deadPixelOffset
        height: radius + deadPixelOffset
        anchors {
            top: parent.top
            left: parent.left
            topMargin: -deadPixelOffset
            leftMargin: -deadPixelOffset
        }
        
        // 使用渐变或纯色来创建圆角效果
        gradient: !debugMode ? null : Gradient {
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 1.0; color: "transparent" }
        }
        
        // 实际起作用的遮罩
        Rectangle {
            width: parent.width
            height: parent.height
            radius: radius
            color: debugMode ? Qt.rgba(1, 0, 0, 0.3) : maskColor
            opacity: root.opacity
            
            // 关键：这个矩形只显示右下部分，形成角落圆角效果
            Rectangle {
                width: parent.width
                height: parent.height
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                color: parent.color
                opacity: parent.opacity
                visible: !debugMode
            }
        }
    }
    
    // 右上角遮罩
    Rectangle {
        id: topRightMask
        visible: enableCorners && enableTopRight
        width: radius + deadPixelOffset
        height: radius + deadPixelOffset
        anchors {
            top: parent.top
            right: parent.right
            topMargin: -deadPixelOffset
            rightMargin: -deadPixelOffset
        }
        
        Rectangle {
            width: parent.width
            height: parent.height
            radius: radius
            color: debugMode ? Qt.rgba(0, 1, 0, 0.3) : maskColor
            opacity: root.opacity
            
            Rectangle {
                width: parent.width
                height: parent.height
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                color: parent.color
                opacity: parent.opacity
                visible: !debugMode
            }
        }
    }
    
    // 左下角遮罩
    Rectangle {
        id: bottomLeftMask
        visible: enableCorners && enableBottomLeft
        width: radius + deadPixelOffset
        height: radius + deadPixelOffset
        anchors {
            bottom: parent.bottom
            left: parent.left
            bottomMargin: -deadPixelOffset
            leftMargin: -deadPixelOffset
        }
        
        Rectangle {
            width: parent.width
            height: parent.height
            radius: radius
            color: debugMode ? Qt.rgba(0, 0, 1, 0.3) : maskColor
            opacity: root.opacity
            
            Rectangle {
                width: parent.width
                height: parent.height
                anchors.top: parent.top
                anchors.right: parent.right
                color: parent.color
                opacity: parent.opacity
                visible: !debugMode
            }
        }
    }
    
    // 右下角遮罩
    Rectangle {
        id: bottomRightMask
        visible: enableCorners && enableBottomRight
        width: radius + deadPixelOffset
        height: radius + deadPixelOffset
        anchors {
            bottom: parent.bottom
            right: parent.right
            bottomMargin: -deadPixelOffset
            rightMargin: -deadPixelOffset
        }
        
        Rectangle {
            width: parent.width
            height: parent.height
            radius: radius
            color: debugMode ? Qt.rgba(1, 1, 0, 0.3) : maskColor
            opacity: root.opacity
            
            Rectangle {
                width: parent.width
                height: parent.height
                anchors.top: parent.top
                anchors.left: parent.left
                color: parent.color
                opacity: parent.opacity
                visible: !debugMode
            }
        }
    }
    
    // 用于获取屏幕尺寸的辅助组件
    Component.onCompleted: {
        // 如果是在QsWindow中使用，可以自动获取窗口大小
        if (parent && parent instanceof QsWindow) {
            screenWidth = parent.width
            screenHeight = parent.height
            
            // 监听窗口大小变化
            parent.widthChanged.connect(function() {
                screenWidth = parent.width
            })
            parent.heightChanged.connect(function() {
                screenHeight = parent.height
            })
        }
    }
}