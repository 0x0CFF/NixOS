{ config, pkgs, inputs, ... }:

{
  services.immich = {
    enable = true;
    host = "0.0.0.0";
    port = 2283;
    openFirewall = true;     # 开放防火墙端口
  };
}
