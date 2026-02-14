{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # gnome-calculator         # [GUI][GTK+] 计算器
    localsend                # [GUI][DART] 文件传输助手
    # pot                      # [GUI][RUST] 翻译助手
  ];
  
  # 防火墙端口配置
  networking.firewall = {
    allowedTCPPorts = [
      53317                  # localsend
    ];
    allowedUDPPorts = [
      53317                  # localsend
    ];
    allowedUDPPortRanges = [
      #
    ];
  };
}
