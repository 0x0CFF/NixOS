{ config, lib, pkgs, ... }:

{
  services.printing = {
    # 启用 CUPS 以打印文档
    enable = true;
  };
}