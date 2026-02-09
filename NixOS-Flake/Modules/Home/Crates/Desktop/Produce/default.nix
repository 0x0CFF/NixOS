{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    darktable                # [GUI][C] 摄影工作流程应用
    obs-studio               # [GUI][C] 直播录屏应用
    blender                  # [GUI][C++] 3D 创作套件
    krita                    # [GUI][C++] 数字绘画应用
    firefox                  # [GUI][C++] 网页浏览器
    obsidian                 # [GUI][JAVASCRIPT] 笔记管理应用
    alacritty                # [GUI][RUST] 终端
    gyroflow                 # [GUI][RUST] 视频稳定应用
    zed                      # [GUI][RUST] 代码编辑器
  ];
}
