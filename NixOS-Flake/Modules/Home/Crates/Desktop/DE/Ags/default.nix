{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    ags                      # [GUI] [RUST] 桌面组件框架
  ];
}
