{ config, lib, pkgs, ... }:

{
  services.libinput = {
    # 启用触摸板支持（在大多数桌面管理器中默认启用）
    enable = true;
  };
}