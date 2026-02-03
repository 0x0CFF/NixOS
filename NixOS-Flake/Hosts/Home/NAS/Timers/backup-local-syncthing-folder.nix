{ config, pkgs, inputs, ... }:

{
  # 在 timers 服务中启用 systemd 单元
  systemd.timers."backup-local-syncthing-folder" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      # 每天 08:00 到 20:00 之间，每 2 个小时运行一次
      OnCalendar = "*-*-* 08..20:00:00/2";
      # 如果服务在执行时间内由于意外没有触发，则立即补执行
      Persistent = true;
    };
  };

  # 定义 systemd 单元
  systemd.services."backup-local-syncthing-folder" = {
    # 运行脚本
    # 查找程序所在位置 echo $(which ssh)
    script = ''
      # Rsync 参数说明
      # -a：归档模式，保留文件权限、时间戳、符号链接等元数据
      # -v：详细模式，显示传输过程中的详细信息
      # -p：保留文件权限
      # -X：在归档模式基础上，额外保留扩展属性（例如 chattr 修改后的属性）

      # 镜像备份，NAS [ ~/Solution/Syncthing/ ] --> NAS [ /mnt/BACKUP/Syncthing ]
      ${pkgs.rsync}/bin/rsync -avPX --delete -e "/run/current-system/sw/bin/ssh" /home/0x0CFF/Solution/Syncthing/ /mnt/BACKUP/Syncthing/
    '';
    # 单元配置
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
