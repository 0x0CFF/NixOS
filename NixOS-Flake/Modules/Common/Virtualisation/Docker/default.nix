{ config, pkgs, inputs, ... }:

{
    # 在 /etc/containers 中启用通用容器配置文件
    virtualisation.containers.enable = true;

    virtualisation = {
      docker = {
        enable = true;
        # 自动清理无用镜像
        autoPrune.enable = true;
        # 禁用 Docker 自动添加 iptables 规则，避免与系统防火墙冲突
        # 开启该选项后，需要手动通过 NixOS 的 networking.firewall.allowedTCPPorts 选项来开放容器所需的开放端口
        daemon.settings = {
          iptables = false;
        };
      };
    };

    # Docker 相关开发工具
    environment.systemPackages = with pkgs; [
      docker-compose             # [CLI][GO] Docker 容器编排工具
      oxker                      # [TUI][RUST] Docker 可视化管理
    ];

    users.users."0x0CFF" = {
      extraGroups = [
        "docker"
      ];
    };
}
