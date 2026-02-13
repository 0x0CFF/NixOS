# 编辑此配置文件以定义应在系统上安装的内容
# 相关帮助请参阅 configuration.nix(5) 手册页、https://search.nixos.org/options 和 NixOS 手册（`nixos-help`）

{ config, lib, pkgs, ... }:

{
  imports =
    [ # 硬件信息
      ./hardware-configuration.nix
    ];
    #

  # 系统引导（根据设备情况选择）
  boot.loader = {
    # 使用 systemd-boot EFI 引导加载程序
    systemd-boot.enable = true;
    # 设置 NixOS EFI 引导数量
    systemd-boot.configurationLimit = 10;
    efi.canTouchEfiVariables = false;
    # 使用 GRUB 引导加载程序
    # grub.enable = true;
    # 设置 NixOS GRUB 引导数量
    # grub.configurationLimit = 10;
    # grub.device = "nodev";
  };

  # 网络配置
  networking = {
    # 定义主机名
    hostName = "WORKSTATION";
    # 配置网络管理工具，仅选择以下选项之一
    # wireless.enable = true;      # 通过 wpa_supplicant 启用无线支持
    networkmanager.enable = true;  # 易于使用的网络管理工具（大多数发行版默认使用它）
    # 网络代理配置，格式："http://user:password@proxy:port/"
    proxy = {
      # 代理服务器
      # default = "http://192.168.31.96:20171/";            # V2ray 非分流端口
      # default = "http://192.168.31.96:20172/";            # V2ray 分流端口
      # 代理黑名单，格式："127.0.0.1,localhost,internal.domain"
      # noProxy = "127.0.0.1,localhost";                    # 代理黑名单
    };
    # 防火墙端口配置
    firewall = {
      enable = true;                  # 防火墙开关（关闭则完全禁用防火墙）
      allowPing = true;
      # allowedTCPPorts = [ ... ];    # 防火墙 TCP 放行端口
      # allowedUDPPorts = [ ... ];    # 防火墙 UPD 放行端口
    };
  };

  environment.systemPackages = with pkgs; [
    rocmPackages.clr         # [AUX][C++] AMD 通用语言运行时，用于 hipamd、opencl 和 rocclr
  ];
  
  # 配置 X 桌面驱动模式
  services.xserver.videoDrivers = [ "modesetting" ];

  # 启用 CPU 微码
  # hardware.cpu.amd.updateMicrocode = true;
  # 启用可再分发固件（加载包含专有固件的软件包）
  hardware.enableRedistributableFirmware = true;
  # 开启 OpenGL
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
  };
  
  # 启用 HIP 支持
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
}
