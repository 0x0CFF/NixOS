import QtQuick
import QtQuick.Shapes

Shape {
    id: root
    
    // 可配置属性
    property color cornerColor: "black"  // 遮罩颜色（通常是背景色）
    property real cornerRadius: 20       // 圆角半径
    property real startX: 0              // 起始X坐标
    property real startY: 0              // 起始Y坐标
    property real startAngle: 180         // 起始角度 (0, 90, 180, -90)
    
    // 窗口大小自动适应圆角半径
    implicitWidth: cornerRadius
    implicitHeight: cornerRadius
    
    // 渲染优化
    layer.enabled: true
    layer.smooth: true
    preferredRendererType: Shape.CurveRenderer
    
    ShapePath {
        fillColor: root.cornerColor
        strokeColor: "transparent"
        
        // 起始点
        PathMove {
            x: root.startX
            y: root.startY
        }
        
        // 绘制到圆角起点
        PathLine {
            x: root.startX
            y: root.startY
        }
        
        // 绘制四分之一圆弧
        PathArc {
            x: root.startX + root.cornerRadius * Math.cos(root.startAngle * Math.PI / 180)
            y: root.startY + root.cornerRadius * Math.sin(root.startAngle * Math.PI / 180)
            radiusX: root.cornerRadius
            radiusY: root.cornerRadius
            useLargeArc: false
            direction: PathArc.Counterclockwise
        }
        
        // 闭合路径
        PathLine {
            x: root.startX
            y: root.startY
        }
    }
}