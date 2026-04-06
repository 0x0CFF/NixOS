{ config, pkgs, inputs, ... }:

{
  services.beszel = {
    agent = {
      enable = true
      openFirewall = true   # 是否打开防火墙端口（默认端口 45876）
      environment = {
        #
      };
      smartmon = {
        enable = true
        deviceAllow = [
          "/dev/nvme0n1"
          "/dev/nvme1n1"
          "/dev/sda"
          "/dev/sdb"
        ]
      };
    };
  };
}