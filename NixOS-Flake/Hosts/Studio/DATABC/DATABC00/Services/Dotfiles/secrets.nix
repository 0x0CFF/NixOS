let
  # 导入公钥
  # DATAGC00 = "...";
  # DATAGC01 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGNDZ9Q12G/kuaCYCvRT6i5nR2Ic3d3JWXEPTPL/6oO4 0x0CFF@DATAGC01";
  DATABC00 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB3XAz0Kn9AaKUEfoB7byShZ/8WvEHrgIE5w1uPwqCTr 0x0CFF@DATABC00";
  # DATASC00 = "";
  # DATASC01 = "...";
  # DATAHC00 = "...";
  # DATAHC01 = "...";
  WORKSTATION = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEHXNRLgQo/Ix/5+YbeiTozO82/qu9JafNS7WZN+M5TG 0x0CFF@Workstation";
in {
  # rclone-config 文件，用于挂载 123 盘 webdav
  "rclone-config.age".publicKeys = [
    # DATAGC00
    # DATAGC01
    DATABC00
    # DATASC00
    # DATASC01
    # DATAHC00
    # DATAHC01
    WORKSTATION
  ];
  # restic-password 密钥，用于加密解谜文件
  "restic-password.age".publicKeys = [
    # DATAGC00
    # DATAGC01
    DATABC00
    # DATASC00
    # DATASC01
    # DATAHC00
    # DATAHC01
    WORKSTATION
  ];
}