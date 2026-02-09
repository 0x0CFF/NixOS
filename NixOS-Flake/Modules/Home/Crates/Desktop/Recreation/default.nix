{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    jellyfin                 # [GUI][C#] 视频流媒体播放器
    sonixd                   # [GUI][TypeScript] 音乐播放器
  ];
}
