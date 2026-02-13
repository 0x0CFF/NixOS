{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [        
    keepassxc                # [AUI][C++] 密码管理器
  ];
  
  services.gnome = {
    gnome-keyring.enable = true;    # [GUI][GTK+] 密钥环
  };
}
