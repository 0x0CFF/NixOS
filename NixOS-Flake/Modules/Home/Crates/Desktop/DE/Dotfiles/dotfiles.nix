{ config, pkgs, inputs, ... }:let
  # 配置目录路径
  # ${config.home.homeDirectory} 表示 Home-Manager 管理的用户家目录
  hyprPath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Hypr";
  niriPath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Niri";
  waybarPath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Waybar";
  rofiPath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Rofi";
in
{
  # config.lib.file.mkOutOfStoreSymlink 可以创建一个指向 Dotfiles 绝对路径的软链接
  # 该函数能够绕过 Home Manager 自身，对 Dotfiles 的修改就能立即生效
  # 注意：仅支持原生配置，由 Nix 生成的配置不支持
  xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink hyprPath;
  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriPath;
  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink waybarPath;
  xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink rofiPath;
}
