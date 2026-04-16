{ config, pkgs, inputs, ... }:

{
  # 防火墙端口配置
  networking.firewall = {
    allowedTCPPorts = [
      10180                    # Web 界面
    ];
    allowedUDPPorts = [
      #
    ];
    allowedUDPPortRanges = [
      #
    ];
  };
}
