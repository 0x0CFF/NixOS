{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    localsend                # [GUI] [DART] 文件传输助手
  ];
}
