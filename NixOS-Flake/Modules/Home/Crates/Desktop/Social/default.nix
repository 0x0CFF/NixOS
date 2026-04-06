{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    telegram-desktop         # [GUI][C++] 电报通讯客户端
    fractal                  # [GUI][RUST] 去中心化通讯客户端
    discord                  # [GUI][RUST] 语音聊天客户端
  ];
}
