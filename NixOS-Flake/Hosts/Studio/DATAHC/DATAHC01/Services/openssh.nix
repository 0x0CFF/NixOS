{ config, pkgs, inputs, ... }:

{
  services.openssh = {
    listenAddresses = [
      {
        addr = "192.168.31.92";
        port = 22;
      }
      {
        addr = "0.0.0.0";
        port = 64022;
      }
    ];
  };
}