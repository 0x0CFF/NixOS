{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    ccal                     # [CLI][SHELL] 中文日历查看器
  ];
}
