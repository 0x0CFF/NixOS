{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    mpv                      # [GUI][C] 视频查看器
    firefox                  # [GUI][C++] 网页浏览器
    loupe                    # [GUI][RUST] 图片查看器
    nautilus                 # [GUI][GTK+] 文件管理器
  ];

  # 在没有 GNOME 桌面环境的情况下使用 Nautilus 时，需要启用 GVfs 服务才能使垃圾箱、网络文件系统正常工作
  services.gvfs = {
    enable = true;
  };
}
