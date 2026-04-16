{ config, pkgs, inputs, ... }:

{
  # 明确指定 agenix 使用的 root 身份文件
  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
    "/etc/ssh/ssh_host_rsa_key"
  ];
  age.secrets = {
    "nocobase-studio-env" = {
      # 指向加密后的 .age 文件路径
      file = ./Secrets/nocobase-studio-env.age;
      owner = "root";
      group = "root";
      mode = "0400";
    };
  };
  
  # 在 timers 服务中启用 systemd 单元
  systemd.timers."nocobase-studio" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      # 系统启动 30 秒后启动
      OnBootSec = "30sec";
      # 如果服务在执行时间内由于意外没有触发，则立即补执行
      Persistent = true;
    };
  };

  # 定义 systemd 单元
  systemd.services."nocobase-studio" = {
    # 运行脚本
    # 查找程序所在位置 echo $(which ssh)
    script = ''
      set -eu
      cd /home/0x0CFF/Solution/Blueprints/UV/Studio/Nocobase-Studio
      ${pkgs.uv}/bin/uv run ./main.py
    '';
    # 单元配置
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      WorkingDirectory = "/home/0x0CFF/Solution/Blueprints/UV/Studio/Nocobase-Studio";
      EnvironmentFile = config.age.secrets.nocobase-studio-env.path;
    };
  };

  # 防火墙端口配置
  networking.firewall = {
    allowedTCPPorts = [
      6000
    ];
    allowedUDPPorts = [
      #
    ];
    allowedUDPPortRanges = [
      #
    ];
  };
}
