{ config, pkgs, inputs, ... }:

{
  services.navidrome = {
    enable = true;
    openFirewall = true;
    settings = {
      Address = "0.0.0.0";
      Port = 4533;
      # 对应用户需要有该文件夹的读、执行权限，一般设置 755 即可
      MusicFolder = "/mnt/媒体仓库/音乐";
    };
  };
}
