let
  # 查看当前用户公钥：cat ~/.ssh/id_ed25519.pub
  # 查看 root 用户公钥：sudo cat /etc/ssh/ssh_host_ed25519_key.pub

  # 导入公钥
  NAS = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ/p3s3mQO8mGsMNQyG78tScS5Gcou+ks6HbVttwHoLu root@NAS";
  # GATEWAY = "...";
  WORKSTATION = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEHXNRLgQo/Ix/5+YbeiTozO82/qu9JafNS7WZN+M5TG 0x0CFF@Workstation";
in {
  # rclone-config 文件，用于挂载 123 盘 WebDAV
  "rclone-config.age".publicKeys = [
    NAS
    # GATEWAY
    WORKSTATION
  ];
  # restic-password 密钥，用于加密解密文件
  "restic-password.age".publicKeys = [
    NAS
    # GATEWAY
    WORKSTATION
  ];
}