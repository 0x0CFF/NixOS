import Quickshell
import QtQml
import QtQuick

import qs.Window         // 导入 Window 目录

Scope {
    id: root
    
    // 配置项
    property bool enableFakeRounding: true
    property int roundingRadius: 20
    property string bgColor: "#ffffff"  // 你的主题背景色
    
    // 为每个屏幕创建圆角
    Instantiator {
        model: screens
        delegate: Item {
            required property var screen
            
            // 左上角
            CornerWindow {
                screen: parent.screen
                corner: "top-left"
                radius: root.roundingRadius
                maskColor: root.bgColor
                visible: root.enableFakeRounding
            }
            
            // 右上角
            CornerWindow {
                screen: parent.screen
                corner: "top-right"
                radius: root.roundingRadius
                maskColor: root.bgColor
                visible: root.enableFakeRounding
            }
            
            // 左下角
            CornerWindow {
                screen: parent.screen
                corner: "bottom-left"
                radius: root.roundingRadius
                maskColor: root.bgColor
                visible: root.enableFakeRounding
            }
            
            // 右下角
            CornerWindow {
                screen: parent.screen
                corner: "bottom-right"
                radius: root.roundingRadius
                maskColor: root.bgColor
                visible: root.enableFakeRounding
            }
        }
    }
    
    Bar {}
}
