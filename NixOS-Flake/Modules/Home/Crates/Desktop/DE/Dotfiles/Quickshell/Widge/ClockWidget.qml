import QtQuick

import qs.Singleton     // 导入 Singleton 目录
import qs.Theme         // 导入 Theme 目录
import QtQuick.Controls

Item {

    property real margin: 4
    
    // 宽度和高度由内部的 Row 决定
    width: row.width + margin * 2
    height: row.height

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
        // 将组件的垂直中心对齐到父项的垂直中心
        anchors.verticalCenter: parent.verticalCenter
        // 将组件的水平中心对齐到父项的水平中心
        anchors.horizontalCenter: parent.horizontalCenter

        Item {
            width: child.width + margin * 2
            height: child.height
            // 将组件的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter
            
            Row {
                id: child
                height: 22
                spacing: 4                          // 子项之间的间距
                // 将组件的垂直中心对齐到父项的垂直中心
                anchors.verticalCenter: parent.verticalCenter
                // 将组件的水平中心对齐到父项的水平中心
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    // 直接访问时间单例的时间属性
                    text: Time.value
                    font.pixelSize: 13
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }
        
                Text {
                    text: "•"
                    font.pixelSize: 13
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }
        
                Text {
                    // 直接访问时间单例的时间属性
                    text: Data.value
                    font.pixelSize: 10
                    color: Theme.text
                    height: parent.height                 // 填充整个 Row 的高度
                    verticalAlignment: Text.AlignVCenter  // 文字内容垂直居中
                }
            }
        }

        Item {
        
            // 宽度和高度由内部的 Row 决定
            width: weatherText.width + margin * 2
            height: weatherText.height
        
            // 将组件的垂直中心对齐到父项的垂直中心
            anchors.verticalCenter: parent.verticalCenter
        
            // 背景矩形
            Rectangle {
                anchors.fill: parent
                color: Theme.surface
                radius: 6
            }
        
            Text {
                id: weatherText
                anchors.centerIn: parent
                text: "🌤️ 加载中..."
                font.pixelSize: 11
                color: Theme.text
                height: 22
                verticalAlignment: Text.AlignVCenter
            }
        
            // 定时器：每30分钟刷新一次天气
            Timer {
                id: refreshTimer
                interval: 30 * 60 * 1000  // 30分钟
                running: true
                repeat: true
                onTriggered: fetchWeather()
            }
        
            // 格式化天气数据
            function formatWeatherData(rawData) {
                // 移除所有换行符、回车符和多余空格
                var cleaned = rawData.replace(/[\n\r]/g, '').trim();
                
                // 如果数据包含特殊的分隔符或格式，尝试提取图标和温度
                // wttr.in 返回格式可能是 "⛅+26°C" 或 "⛅ +26°C" 或包含其他字符
                
                // 匹配常见的天气图标和温度格式
                var iconMatch = cleaned.match(/[☀️⛅🌤️🌥️🌦️🌧️⛈️🌨️❄️💨🌫️☁️🌙⭐]/);
                var tempMatch = cleaned.match(/[+-]?\d+°C/);
                
                if (iconMatch && tempMatch) {
                    return iconMatch[0] + " " + tempMatch[0];
                } else if (tempMatch) {
                    // 只有温度，使用默认图标
                    return "🌡️ " + tempMatch[0];
                } else if (cleaned.length > 0 && cleaned.length < 20) {
                    // 如果数据简短，直接返回清理后的数据
                    return cleaned;
                } else {
                    // 解析失败，返回原始数据的前20个字符用于调试
                    console.warn("Unexpected weather format:", cleaned);
                    return "🌤️ 解析失败";
                }
            }
        
            // 网络请求
            function fetchWeather() {
                var xhr = new XMLHttpRequest();
                var city = "~23.175122426125416,113.47711628286415";  // 广州市黄埔区萝岗地铁站
                // 使用更严格的格式参数
                var url = "https://wttr.in/" + city + "?format=%c%t&lang=zh";
                
                xhr.open("GET", url);
                xhr.timeout = 5000;
                
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            var rawData = xhr.responseText;
                            console.log("Raw weather data:", JSON.stringify(rawData));
                            
                            var formattedWeather = formatWeatherData(rawData);
                            weatherText.text = formattedWeather;
                            console.log("Formatted weather:", formattedWeather);
                        } else {
                            weatherText.text = "⚠️ 网络错误";
                            console.error("Weather fetch failed: ", xhr.status);
                        }
                    }
                };
                
                xhr.onerror = function() {
                    weatherText.text = "⚠️ 请求失败";
                    console.error("XHR network error");
                };
                
                xhr.ontimeout = function() {
                    weatherText.text = "⚠️ 超时";
                    console.error("XHR timeout");
                };
                
                xhr.send();
            }
        
            // 组件创建完成后立即获取一次天气
            Component.onCompleted: {
                fetchWeather();
            }
        }
    }
}
