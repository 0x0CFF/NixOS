{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    ansible                  # [CLI][Python] IT 自动化
  ];
}