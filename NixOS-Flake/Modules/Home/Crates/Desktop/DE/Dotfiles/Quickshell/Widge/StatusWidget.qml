import Quickshell

import qs.Theme         // 导入 Theme 目录
import qs.Widge         // 导入 Widge 目录

Scope {
    Variants {
        // 获取显示器列表（数据模型）
        model: Quickshell.screens

        PanelWindow {
            required property var modelData     // 注入屏幕列表中的数据模型
            screen: modelData                   // 然后可以将窗口的屏幕设置为注入的属性
            color: Theme.background

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 42                    // 高度

            ClockWidget {
                anchors.centerIn: parent
            }
        }
    }
}
