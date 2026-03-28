{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    restic                   # [CLI][GO] 数据备份工具
    rclone                   # [CLI][GO] 云存储文件管理工具
  ];

  age.secrets.restic-password = {
    # 指向加密后的 .age 文件路径
    file = /home/0x0CFF/Solution/Blueprints/NixOS/NixOS-Flake/Hosts/Studio/DATABC/DATABC00/Services/Dotfiles/restic-password.age;
    # 解密后文件的属主和权限（可选）
    owner = "root";
    mode = "0400";
  };
  age.secrets.rclone-config = {
    # 指向加密后的 .age 文件路径
    file = /home/0x0CFF/Solution/Blueprints/NixOS/NixOS-Flake/Hosts/Studio/DATABC/DATABC00/Services/Dotfiles/rclone-config.age;
    # 解密后文件的属主和权限（可选）
    owner = "root";
    mode = "0400";
  };
  
  services.restic.backups = {
    # 备份任务名，可自定义
    DATABC00-Mnt-Document = {
      # 备份路径
      paths = [
        "/mnt/Document"
        # 可填写多个路径
      ];
      # 备份时排除文件/文件夹
      exclude = [
        # "/var/cache"
        # "/home/*/.cache"
        # ".git"
      ];

      # 仓库地址：格式为 rclone:配置名:仓库路径
      repository = "rclone:123pan-webdav:/Mnt/Document";
      # 初始化仓库（第一次运行时创建，创建位置：rclone:123pan-webdav:/Document）
      initialize = true;

      # 指定 rclone 配置文件路径
      # 通过 .path 引用解密后的 .age 文件（实际路径位于 /run/agenix/rclone-config）
      rcloneConfigFile = config.age.secrets.rclone-config.path;
      # 传递给 rclone 以控制其行为的选项，详细参数查看官方文档： https://rclone.org/docs/#options
      rcloneOptions = {
        bwlimit = "10M:off";            # --bwlimit UP:DOWN 带宽上下行限制，off 表示关闭限制，单位 MiB/s
        cache-chunk-size = "64M";       # --cache-chunk-size 数据块大小
      };

      # 仓库密码文件（用于加密备份数据，非 WebDAV 密码，注意妥善保管，一旦忘记数据将无法恢复！）
      # 通过 .path 引用解密后的 .age 文件（实际路径位于 /run/agenix/restic-password）
      passwordFile = config.age.secrets.restic-password.path;
      # 传递给 restic 备份的额外参数
      extraBackupArgs = [
        "--pack-size=64M"               # 设置加密文件大小
        "--cleanup-cache"               # 清除缓存
        # "--compression=max"           # 可选：最大压缩
        # "--verbose"                   # 可选：详细输出
      ];
      # 备份优化和清理策略
      # 选项列表，格式为 –keep-*，用于 `restic forget –prune` 命令，以自动修剪旧快照
      # 注意： `forget` 命令在 `backup` 命令之后运行，因此构建 –keep-* 选项时请记住这一点
      pruneOpts = [
        "--keep-daily 7"
      ];
      # 备份定时器
      timerConfig = {
        # 每天 08:00 到 20:00 之间，每 3 个小时运行一次
        OnCalendar = "*-*-* 08..20:00:00/3";
        # 如果错过备份时间，开机后立即执行
        Persistent = true;
      };

      # 启动备份进程前运行的脚本
      # backupPrepareCommand = "<PATH>"
      # 备份进程完成后运行的脚本
      # backupCleanupCommand = "<PATH>"

      # 包含访问仓库凭证的文件
      # environmentFile = "/etc/nixos/secrets/restic-environment";
      #
      # 传递给 restic –option 标志的额外扩展选项
      extraOptions = [
        #
      ];
    };
  };
}
