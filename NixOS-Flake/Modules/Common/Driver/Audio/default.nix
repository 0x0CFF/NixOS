{ config, lib, pkgs, ... }:

{
  # 启用声音（pulseaudio 与 pipewire 服务互斥，仅选择以下选项之一）
  # services.pulseaudio = {
  #   enable = true;
  # };

  services.pipewire = {
    enable = true;
    alsa.enable = true;          # 启用 ALSA 支持
    alsa.support32Bit = true;    # 支持 32 位应用
    pulse.enable = true;         # 兼容 PulseAudio 应用
  };
  
  security.rtkit.enable = true;  # 为音频进程提供实时调度能力，提升性能
}
