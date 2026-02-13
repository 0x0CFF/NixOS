{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl            # [CLI][C] 屏幕亮度调管理器
    pavucontrol              # [GUI][C++] 音量管理器
    overskride               # [GUI][RUST] 蓝牙管理器
  ];
}
