{ config, pkgs, inputs, ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    group = "jellyfin";
    user = "jellyfin";
  };
}
