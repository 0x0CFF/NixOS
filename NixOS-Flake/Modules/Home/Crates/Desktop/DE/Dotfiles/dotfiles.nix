{ config, pkgs, inputs, ... }:let
  # 配置目录路径
  # ${config.home.homeDirectory} 表示 Home-Manager 管理的用户家目录
  alacrittyConfigPath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Alacritty";
  cursorThemePath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Cursor";
  rofiThemePath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Rofi/Themes";
  rofiConfigPath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Rofi/Config";
  sattyConfigPath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Satty";
  hyprConfigPath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Hypr";
  makoConfigPath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Mako";
  niriConfigPath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Niri";
  quickshellConfigPath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Quickshell";
  waybarConfigPath = "${config.home.homeDirectory}/Solution/Blueprints/NixOS/NixOS-Flake/Modules/Home/Crates/Desktop/DE/Dotfiles/Waybar";
in
{
  # config.lib.file.mkOutOfStoreSymlink 可以创建一个指向 Dotfiles 绝对路径的软链接
  # 该函数能够绕过 Home Manager 自身，对 Dotfiles 的修改就能立即生效
  # 注意：仅支持原生配置，由 Nix 生成的配置不支持
  # xdg.dataFile -> ~/.local/share/
  # xdg.configFile -> ~/.config/
  # 拓展：https://wiki.archlinux.org/title/XDG_Base_Directory
  xdg.configFile."alacritty".source = config.lib.file.mkOutOfStoreSymlink alacrittyConfigPath;
  xdg.dataFile."icons".source = config.lib.file.mkOutOfStoreSymlink cursorThemePath;
  xdg.dataFile."rofi/themes".source = config.lib.file.mkOutOfStoreSymlink rofiThemePath;
  xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink rofiConfigPath;
  xdg.configFile."satty".source = config.lib.file.mkOutOfStoreSymlink sattyConfigPath;
  xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink hyprConfigPath;
  xdg.configFile."mako".source = config.lib.file.mkOutOfStoreSymlink makoConfigPath;
  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriConfigPath;
  xdg.configFile."quickshell".source = config.lib.file.mkOutOfStoreSymlink quickshellConfigPath;
  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink waybarConfigPath;
}
