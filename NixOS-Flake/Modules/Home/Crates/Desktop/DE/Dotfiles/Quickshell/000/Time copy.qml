
// 有了这行代码，类型变成了单例
pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root
    property string time                          // 在根目录中添加一个全局属性

    // 创建一个进程管理对象
    Process {
        id: dateProc
        command: ["date"]                         // 将运行的命令，参数为字符串
        running: true                             // 立即执行命令
        
        // 使用 StdioCollector 处理标准输出流，以便 stdout 获取进程发送的文本
        stdout: StdioCollector {
            // 监听 streamFinished 信号，该信号在进程关闭 stdout 或退出时发送
            onStreamFinished: root.time = this.text     // 修改全局属性
        }
    }

    // 使用定时器以间隔重新运行该过程
    Timer {
        interval: 1000          // 1000 毫秒等于1秒
        running: true           // 立即启动计时器
        repeat: true            // 当它结束时再次启动计时器
        onTriggered: dateProc.running = true    // 当定时器被触发时，将进程的 running 属性设置为 true，如果停止它将重新运行
    }
}