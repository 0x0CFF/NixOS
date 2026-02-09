{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    mpv                      # [GUI][C] 视频查看器
    pavucontrol              # [GUI][C++] 音量管理器
    loupe                    # [GUI][RUST] 图片查看器
    overskride               # [GUI][RUST] 蓝牙管理器
  ];
}
