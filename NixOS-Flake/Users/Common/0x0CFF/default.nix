{ config, pkgs, inputs, ... }:

{
  # 定义用户，首次构建系统不要忘记使用「passwd」命令设置密码
  users.users."0x0CFF" = {
    isNormalUser = true;
    extraGroups = [                    # 辅助用户组
      "wheel"           # 为该用户启用 sudo 权限
    ];
    # packages = with pkgs; [
    #   tree
    # ];
  };

  # 定义主要用户组（否则工作室对应用户无法创建）
}
