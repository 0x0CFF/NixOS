pragma Singleton
import QtQuick

QtObject {
    // 是否使用深色模式
    property bool darkMode: true

    // ========== 核心颜色 ==========
    // 背景色
    readonly property color background: darkMode ? "#000000" : "#f5f5f5"

    // 表面色（卡片、面板背景）
    readonly property color surface: darkMode ? "#2a2a3a" : "#ffffff"

    // 主色调（按钮、选中项）
    readonly property color primary: darkMode ? "#89b4fa" : "#1e88e5"

    // 文字颜色
    readonly property color text: darkMode ? "#cdd6f4" : "#2c3e50"
    readonly property color textSecondary: darkMode ? "#9399b2" : "#546e7a"

    // 边框颜色
    readonly property color border: darkMode ? "#45475a" : "#e0e0e0"

    // 强调/危险色
    readonly property color accent: darkMode ? "#f38ba8" : "#e53935"
    readonly property color success: darkMode ? "#a6e3a1" : "#43a047"

    // ========== 常用效果 ==========
    // 悬停效果（透明覆盖层）
    readonly property color hoverOverlay: Qt.rgba(1, 1, 1, darkMode ? 0.1 : 0.05)

    // 阴影透明度
    readonly property real shadowOpacity: darkMode ? 0.5 : 0.1
}
