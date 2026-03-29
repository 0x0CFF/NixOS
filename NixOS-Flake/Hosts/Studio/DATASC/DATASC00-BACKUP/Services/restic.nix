{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    restic                   # [CLI][GO] 数据备份工具
    rclone                   # [CLI][GO] 云存储文件管理工具
  ];

  # 明确指定 agenix 使用的 root 身份文件
  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
    "/etc/ssh/ssh_host_rsa_key"
  ];
  age.secrets = {
    "rclone-config" = {
      # 指向加密后的 .age 文件路径
      file = ./Secrets/rclone-config.age;
      owner = "root";
      group = "root";
      mode = "0400";
    };
    "restic-password" = {
      # 指向加密后的 .age 文件路径
      file = ./Secrets/restic-password.age;
      owner = "root";
      group = "root";
      mode = "0400";
    }; 
  };

  # 备份服务的执行顺序为：
  # 1. 执行备份 (restic backup)
  # 2. 执行清理 (restic forget --prune，如果配置了 pruneOpts)
  # 3. 执行检查 (restic check，自动添加 --cache-dir 参数)
  services.restic.backups = {
    # 备份 /mnt/Inspiration#PUBLIC
    Mnt-Inspiration-PUBLIC = {
      # 备份路径
      paths = [
        "/mnt/Inspiration#PUBLIC"
        # 可填写多个路径
      ];
      # 备份时排除文件/文件夹
      exclude = [
        # "/var/cache"
        # "/home/*/.cache"
        # ".git"
      ];
      # 仓库地址：格式为 rclone:配置名:仓库路径
      repository = "rclone:123pan-WebDAV:/Mnt/Inspiration#PUBLIC";
      # 初始化仓库（第一次运行时创建，创建位置：rclone:123pan-WebDAV:/Mnt/Inspiration#PUBLIC）
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
        "--pack-size=64"                 # 设置加密文件大小
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
      # 启用自动检查
      checkOpts = [
        "--with-cache"             # 可选：使用本地缓存加速检查（默认 check 命令不使用缓存）
        # "--read-data"              # 可选：完整读取并验证所有数据包（最彻底，但耗时最长）
        "--read-data-subset=5%"    # 可选：只验证部分数据（适合大型仓库）
        # "--check-unused"           # 可选：检查未使用的数据
      ];
      # 包含访问仓库凭证的文件
      # environmentFile = "/etc/nixos/secrets/restic-environment";
      # 传递给 restic –option 标志的额外扩展选项
      extraOptions = [
        #
      ];
      # 启动备份进程前运行的脚本
      # backupPrepareCommand = "<PATH>"
      # 备份进程完成后运行的脚本
      # backupCleanupCommand = "<PATH>"
      # 定时器
      timerConfig = {
        # 每周日 00:00 执行
        OnCalendar = "Sun *-*-* 00:00:00";
        # 如果错过备份时间，开机后立即执行
        Persistent = true;
        # 随机延迟执行，避免多个任务同时启动
        RandomizedDelaySec = "5min";
      };
    };
    # 备份 /mnt/Material#ANIMATION
    # 备份 /mnt/Material#BUSINESS
    # 备份 /mnt/Material#DESIGN
    Mnt-Material-DESIGN = {
      # 备份路径
      paths = [
        "/mnt/Material#DESIGN"
        # 可填写多个路径
      ];
      # 备份时排除文件/文件夹
      exclude = [
        # "/var/cache"
        # "/home/*/.cache"
        # ".git"
      ];
      # 仓库地址：格式为 rclone:配置名:仓库路径
      repository = "rclone:123pan-WebDAV:/Mnt/Material#DESIGN";
      # 初始化仓库（第一次运行时创建，创建位置：rclone:123pan-WebDAV:/Mnt/Material#DESIGN）
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
        "--pack-size=64"                 # 设置加密文件大小
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
      # 启用自动检查
      checkOpts = [
        "--with-cache"             # 可选：使用本地缓存加速检查（默认 check 命令不使用缓存）
        # "--read-data"              # 可选：完整读取并验证所有数据包（最彻底，但耗时最长）
        "--read-data-subset=5%"    # 可选：只验证部分数据（适合大型仓库）
        # "--check-unused"           # 可选：检查未使用的数据
      ];
      # 包含访问仓库凭证的文件
      # environmentFile = "/etc/nixos/secrets/restic-environment";
      # 传递给 restic –option 标志的额外扩展选项
      extraOptions = [
        #
      ];
      # 启动备份进程前运行的脚本
      # backupPrepareCommand = "<PATH>"
      # 备份进程完成后运行的脚本
      # backupCleanupCommand = "<PATH>"
      # 定时器
      timerConfig = {
        # 每周日 04:00 执行
        OnCalendar = "Sun *-*-* 04:00:00";
        # 如果错过备份时间，开机后立即执行
        Persistent = true;
        # 随机延迟执行，避免多个任务同时启动
        RandomizedDelaySec = "5min";
      };
    };
    # 备份 /mnt/Material#EFFECTS
    # 备份 /mnt/Material#MODELING
    # 备份 /mnt/Material#PUBLIC
    Mnt-Material-PUBLIC = {
      # 备份路径
      paths = [
        "/mnt/Material#PUBLIC"
        # 可填写多个路径
      ];
      # 备份时排除文件/文件夹
      exclude = [
        # "/var/cache"
        # "/home/*/.cache"
        # ".git"
      ];
      # 仓库地址：格式为 rclone:配置名:仓库路径
      repository = "rclone:123pan-WebDAV:/Mnt/Material#PUBLIC";
      # 初始化仓库（第一次运行时创建，创建位置：rclone:123pan-WebDAV:/Mnt/Material#PUBLIC）
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
        "--pack-size=64"                 # 设置加密文件大小
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
      # 启用自动检查
      checkOpts = [
        "--with-cache"             # 可选：使用本地缓存加速检查（默认 check 命令不使用缓存）
        # "--read-data"              # 可选：完整读取并验证所有数据包（最彻底，但耗时最长）
        "--read-data-subset=5%"    # 可选：只验证部分数据（适合大型仓库）
        # "--check-unused"           # 可选：检查未使用的数据
      ];
      # 包含访问仓库凭证的文件
      # environmentFile = "/etc/nixos/secrets/restic-environment";
      # 传递给 restic –option 标志的额外扩展选项
      extraOptions = [
        #
      ];
      # 启动备份进程前运行的脚本
      # backupPrepareCommand = "<PATH>"
      # 备份进程完成后运行的脚本
      # backupCleanupCommand = "<PATH>"
      # 定时器
      timerConfig = {
        # 每周日 03:30 执行
        OnCalendar = "Sun *-*-* 07:00:00";
        # 如果错过备份时间，开机后立即执行
        Persistent = true;
        # 随机延迟执行，避免多个任务同时启动
        RandomizedDelaySec = "5min";
      };
    };
    # 备份 /mnt/Material#VIDEO
  };
}
