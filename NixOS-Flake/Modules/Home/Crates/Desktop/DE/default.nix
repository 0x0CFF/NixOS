{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    playerctl                # [CLI][C] 媒体播放器控制
    wev                      # [CLI][C] Wayland 事件查看器
    tuigreet                 # [TUI][RUST] 登录屏幕
    rofi                     # [GUI][C] 应用启动器
    libnotify                # [GUI][C] 通知守护进程
    mako                     # [GUI][C] 通知管理器
    swaybg                   # [GUI][C] 壁纸管理器
    hyprpaper                # [GUI][C++] 壁纸管理器
    slurp                    # [GUI][C] Wayland 合成器屏幕区域选择工具
    hyprpicker               # [GUI][C++] 取色器
    hypridle                 # [GUI][C++] 空闲守护进程
    quickshell               # [GUI][C++] 桌面组件开发工具
    xdg-desktop-portal-gtk   # [GUI][GTK+] 桌面门户
    xdg-desktop-portal-gnome # [GUI][GTK+] 桌面门户
    grim                     # [GUI][RUST] Wayland 合成器截图工具
    satty                    # [GUI][RUST] 截图标注工具
    alacritty                # [GUI][RUST] 终端
    xwayland-satellite       # [GUI][RUST] xwayland 实现
  ];

  programs.dconf = {
    enable = true;           # [GUI][GTK+] GNOME 桌面环境配置存储系统
  };

  programs.niri = {
    enable = true;           # [GUI][RUST] 滚动平铺 Wayland 合成器
  };

  programs.hyprlock = {
    enable = true;           # [GUI][C++] 屏幕锁定程序
  };

  # services.displayManager = {
  #   autoLogin.enable = true;
  #   autoLogin.user = "0x0CFF";
  # };

  # 登录管理器守护进程
  services.greetd = {
    enable = true;
    settings = {
     default_session.command = ''
      ${pkgs.tuigreet}/bin/tuigreet \
        --time \
        --asterisks \
        --user-menu \
        --cmd niri
    '';
    };
  };

  environment.etc."greetd/environments".text = ''
    niri
  '';
}
