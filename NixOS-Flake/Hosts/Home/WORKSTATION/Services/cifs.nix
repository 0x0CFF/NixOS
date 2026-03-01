{ config, pkgs, inputs, ... }:

let
  username = "0x0CFF";
  userUid = config.users.users.${username}.uid;  # 前提：UID 已显式设置
in
{
  environment.systemPackages = with pkgs; [ cifs-utils ];

  # 定义要挂载的网络共享
  fileSystems."/mnt/DATABC00#01·协作盘" = {
    device = "//192.168.31.51/DATABC00#01·协作盘";  # 例如 //192.168.1.100/data
    fsType = "cifs";
    options = let
      # 自动挂载选项：防止启动时因网络未就绪而挂起，并按需挂载
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in [
      "${automount_opts}"
      "credentials=/home/0x0CFF/Solution/Blueprints/NixOS/NixOS-Flake/Hosts/Home/WORKSTATION/Services/Dotfiles/DATABC00"  # 指向存放密码的文件
      # 如果想让普通用户也能操作挂载点，添加 uid 和 gid
      "uid=${toString userUid}"
      "gid=${toString config.users.groups.users.gid}"    
      # 其他常用选项
      "iocharset=utf8"  # 解决中文文件名乱码
      "file_mode=0755"
      "dir_mode=0755"
      # 如果服务器较老，可能需要指定协议版本：vers=3.0, vers=2.0, 或 vers=1.0
    ];
  };
  fileSystems."/mnt/DATABC00#02·文档盘" = {
    device = "//192.168.31.51/DATABC00#02·文档盘";  # 例如 //192.168.1.100/data
    fsType = "cifs";
    options = let
      # 自动挂载选项：防止启动时因网络未就绪而挂起，并按需挂载
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in [
      "${automount_opts}"
      "credentials=/home/0x0CFF/Solution/Blueprints/NixOS/NixOS-Flake/Hosts/Home/WORKSTATION/Services/Dotfiles/DATABC00"  # 指向存放密码的文件
      # 如果想让普通用户也能操作挂载点，添加 uid 和 gid
      "uid=${toString userUid}"
      "gid=${toString config.users.groups.users.gid}"     
      # 其他常用选项
      "iocharset=utf8"  # 解决中文文件名乱码
      "file_mode=0755"
      "dir_mode=0755"
      # 如果服务器较老，可能需要指定协议版本：vers=3.0, vers=2.0, 或 vers=1.0
    ];
  };
  fileSystems."/mnt/DATABC00#03·临时盘" = {
    device = "//192.168.31.51/DATABC00#03·临时盘";  # 例如 //192.168.1.100/data
    fsType = "cifs";
    options = let
      # 自动挂载选项：防止启动时因网络未就绪而挂起，并按需挂载
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in [
      "${automount_opts}"
      "credentials=/home/0x0CFF/Solution/Blueprints/NixOS/NixOS-Flake/Hosts/Home/WORKSTATION/Services/Dotfiles/DATABC00"  # 指向存放密码的文件
      # 如果想让普通用户也能操作挂载点，添加 uid 和 gid
      "uid=${toString userUid}"
      "gid=${toString config.users.groups.users.gid}"      
      # 其他常用选项
      "iocharset=utf8"  # 解决中文文件名乱码
      "file_mode=0755"
      "dir_mode=0755"
      # 如果服务器较老，可能需要指定协议版本：vers=3.0, vers=2.0, 或 vers=1.0
    ];
  };
}