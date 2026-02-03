{ config, pkgs, inputs, ... }:

{
  users.users."0x0CFF" = {
    extraGroups = [                    # 辅助用户组
    ];
  };

  # 定义主要用户组（否则工作室对应用户无法创建）
}
