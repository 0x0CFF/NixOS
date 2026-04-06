{ config, pkgs, inputs, ... }:

{
  services.beszel = {
    hub = {
      enable = true
      host = "0.0.0.0"
      port = 8090
      dataDir = "/var/lib/beszel-hub"
      environment = {
        #
      };
    };
  };
}