{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    rofi                     # [GUI][C] 应用启动器
    ags                      # [GUI][TypeScript] 桌面组件框架
    niri                     # [GUI][RUST] 滚动平铺 Wayland 合成器
  ];
}
