import Quickshell
import QtQuick

import qs.Theme         // 导入 Theme 目录
import qs.Widge         // 导入 Widge 目录
import QtQuick.Layouts

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

            implicitHeight: 38                    // 高度

            Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                    leftMargin: 8   // 左边距
                    rightMargin: 8  // 右边距
                    // 将组件的垂直中心对齐到父项的垂直中心
                    verticalCenter: parent.verticalCenter
                    // 将组件的水平中心对齐到父项的水平中心
                    horizontalCenter: parent.horizontalCenter
                }

                // 左侧布局
                Row {
                    spacing: 4      // 子项之间的间距
                    // 将组件的垂直中心对齐到父项的垂直中心
                    anchors.verticalCenter: parent.verticalCenter
                    // 将组件的左边缘对齐到父组件的左边缘
                    anchors.left: parent.left

                    ClockWidget {}
                    StatusWidget {}
                }

                // // 中间布局
                // WorkspaceWidget {
                //     // 将组件的垂直中心对齐到父项的垂直中心
                //     anchors.verticalCenter: parent.verticalCenter
                //     // 将组件的水平中心对齐到父项的水平中心
                //     anchors.horizontalCenter: parent.horizontalCenter
                // }

                // 右侧布局
                Row {
                    spacing: 4      // 子项之间的间距
                    // 将组件的垂直中心对齐到父项的垂直中心
                    anchors.verticalCenter: parent.verticalCenter
                    // 将组件的右边缘对齐到父组件的右边缘
                    anchors.right: parent.right

                    ToolWidget {}
                    UserWidget {}
                }
            }


        }
    }
}
