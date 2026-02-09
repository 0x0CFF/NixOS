{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome-calculator         # [GUI][GTK+] 计算器
    localsend                # [GUI][DART] 文件传输助手
    pot                      # [GUI][RUST] 翻译助手
  ];
}
