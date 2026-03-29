{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    tokei                    # [TUI][RUST] 代码统计工具
    # dtop                     # [TUI][RUST] 多主机监控的 Docker 仪表盘
  ];
}