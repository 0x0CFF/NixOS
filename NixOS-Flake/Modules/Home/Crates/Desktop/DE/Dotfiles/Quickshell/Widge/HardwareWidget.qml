import QtQuick
import Quickshell
import Quickshell.Io
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
            id: cpuWidget
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

            // CPU 数据获取逻辑
            property string cpuLoad: "00%"  // 存储 CPU 负载的属性

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
                    id: cpuValueLabel
                    text: cpuWidget.cpuLoad               // 绑定到根对象的属性
                    font.pixelSize: 10
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }
            }
            
            // CPU 数据获取逻辑
            Process {
                id: cpuProcess
                command: ["sh", "-c", "grep 'cpu ' /proc/stat | awk '{print $5, $2+$3+$4+$5+$6+$7+$8+$9}'"]
                running: true
        
                stdout: StdioCollector {
                    onStreamFinished: {
                        var parts = this.text.trim().split(' ');
                        var idle = parseInt(parts[0]);
                        var total = parseInt(parts[1]);
                         
                        if (cpuWidget.lastIdle !== 0) {
                            var idleDelta = idle - cpuWidget.lastIdle;
                            var totalDelta = total - cpuWidget.lastTotal;
                            var usage = 100 * (1 - idleDelta / totalDelta);
                             
                            // 格式化为两位数字，不足两位前面补零
                            var rounded = Math.round(usage);
                            var formatted = (rounded < 10 ? "0" + rounded : rounded) + "%";
                            cpuWidget.cpuLoad = formatted;
                         }
                         
                         cpuWidget.lastIdle = idle;
                         cpuWidget.lastTotal = total;
                    }
                }
            }
        
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: cpuProcess.running = true
            }
        
            // 存储上一次的 CPU 统计值（作为 Rectangle 的属性）
            property int lastIdle: 0
            property int lastTotal: 0
        }

        Rectangle {
            id: gpuWidget
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

            // CPU 数据获取逻辑
            property string gpuLoad: "00%"  // 存储 CPU 负载的属性
            
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
                    id: gpuValueLabel
                    text: gpuWidget.gpuLoad               // 绑定到根对象的属性
                    font.pixelSize: 10
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }
            }
            
            // GPU 数据获取逻辑
            Process {
                id: gpuProcess
                // AMD ROCm 显卡
                command: ["sh", "-c", "rocm-smi --showuse | grep 'GPU use' | grep -o '[0-9]*' | head -1"]
                running: true
                stdout: StdioCollector {
                    onStreamFinished: {
                        var usage = parseInt(this.text.trim());
                        if (!isNaN(usage)) {
                            var formatted = (usage < 10 ? "0" + usage : usage) + "%";
                            gpuWidget.gpuLoad = formatted;
                        }
                    }
                }
            }
            
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: ramProcess.running = true
            }
        }

        Rectangle {
            id: ramWidget
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

            // RAM 数据获取逻辑
            property string ramLoad: "00%"  // 存储 RAM 负载的属性
            
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
                    id: ramValueLabel
                    text: ramWidget.ramLoad               // 绑定到根对象的属性
                    font.pixelSize: 10
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }
            }
            
            // RAM 数据获取逻辑
            Process {
                id: ramProcess
                command: ["sh", "-c", "top -bn1 | grep 'MiB Mem' | awk '{print ($8/$4)*100}'"]
                running: true
            
                stdout: StdioCollector {
                    onStreamFinished: {
                        var usage = parseFloat(this.text.trim());
                        if (!isNaN(usage)) {
                            // 格式化为两位数字，不足两位前面补零
                            var rounded = Math.round(usage);
                            var formatted = (rounded < 10 ? "0" + rounded : rounded) + "%";
                            ramWidget.ramLoad = formatted;
                        }
                    }
                }
            }
            
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: ramProcess.running = true
            }

        }
    }
}
