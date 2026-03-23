{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages."${stdenv.hostPlatform.system}".default    # [CLI][Nix] 信息加解密工具
    nh                       # [AUX][RUST] NixOS 生态辅助工具               
  ];
}
