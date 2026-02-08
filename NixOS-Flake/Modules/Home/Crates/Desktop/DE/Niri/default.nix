{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    niri                     # [GUI] [RUST] 滚动平铺 Wayland 合成器
  ];
}
