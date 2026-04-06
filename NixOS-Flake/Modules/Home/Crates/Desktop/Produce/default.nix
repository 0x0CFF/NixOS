{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # darktable                # [GUI][C] 摄影工作流程应用
    obs-studio               # [GUI][C] 直播录屏应用
    # blender-hip              # [GUI][C++] 3D 创作套件
    # thunderbird              # [GUI][C++] 邮件客户端
    krita                    # [GUI][C++] 数字绘画应用
    wpsoffice-cn             # [GUI][C++] Office 办公套件
    # gyroflow                 # [GUI][RUST] 视频稳定应用
    zed-editor               # [GUI][RUST] 代码编辑器
    # rustdesk                 # [GUI][RUST] 远程桌面
    obsidian                 # [GUI][JAVASCRIPT] 笔记管理应用
  ];
}
