{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    rofi                     # [GUI] [C] 应用启动器
  ];
}
