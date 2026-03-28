let
  # 查看当前用户公钥：cat ~/.ssh/id_ed25519.pub
  # 查看 root 用户公钥：sudo cat /etc/ssh/ssh_host_ed25519_key.pub

  # 导入公钥
  # DATAGC00 = "...";
  # DATAGC01 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC0hvqlUDw2GUZFn2sQA34IzEvW8TUy/5GI98iPzcGh/ root@DATAGC00";
  # DATABC00 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJTksTOEwmqZ+t7fyXmweTShxt+XdAf6eqkAGOo3qysh root@DATABC00";
  # DATABC00-BACKUP = "...";
  # DATASC00 = "...";
  DATASC00-BACKUP = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMXOyjS5BZlOfNpXw2xbOD46hoy5nSAeC8OYNPZCYuTb root@DATASC00-BACKUP";
  # DATASC01 = "...";
  # DATASC01-BACKUP = "...";
  # DATAHC00 = "...";
  # DATAHC01 = "...";
  WORKSTATION = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEHXNRLgQo/Ix/5+YbeiTozO82/qu9JafNS7WZN+M5TG 0x0CFF@Workstation";
in {
  # rclone-config 文件，用于挂载 123 盘 WebDAV
  "rclone-config.age".publicKeys = [
    # DATAGC00
    # DATAGC01
    # DATABC00
    # DATABC00-BACKUP
    # DATASC00
    DATASC00-BACKUP
    # DATASC01
    # DATASC01-BACKUP
    # DATAHC00
    # DATAHC01
    WORKSTATION
  ];
  # restic-password 密钥，用于加密解密文件
  "restic-password.age".publicKeys = [
    # DATAGC00
    # DATAGC01
    # DATABC00
    # DATABC00-BACKUP
    # DATASC00
    DATASC00-BACKUP
    # DATASC01
    # DATASC01-BACKUP
    # DATAHC00
    # DATAHC01
    WORKSTATION
  ];
}