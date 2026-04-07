{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnupg                    # [CLI][C] 数据加密签名工具
    inputs.agenix.packages."${stdenv.hostPlatform.system}".default    # [CLI][Nix] 信息加解密工具
  ];
}
