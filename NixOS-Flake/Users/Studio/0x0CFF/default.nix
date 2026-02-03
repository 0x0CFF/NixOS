{ config, pkgs, inputs, ... }:

{
  users.users."0x0CFF" = {
    extraGroups = [                    # 辅助用户组
      "PUBLIC"
      "ADMINISTRATION"
      "ANIMATION"
      "BOARD"
      "BUSINESS"
      "DESIGN"
      "DEVELOPMENT"
      "EFFECTS"
      "FINANCE"
      "MODELING"
      "OPERATION"
      "PHOTOGRAPHY"
      "VIDEO"
      "R5"
    ];
  };

  # 定义主要用户组（否则工作室对应用户无法创建）
  users.groups.PUBLIC = {};
  users.groups.ADMINISTRATION = {};
  users.groups.ANIMATION = {};
  users.groups.BOARD = {};
  users.groups.BUSINESS = {};
  users.groups.DESIGN = {};
  users.groups.DEVELOPMENT = {};
  users.groups.EFFECTS = {};
  users.groups.FINANCE = {};
  users.groups.MODELING = {};
  users.groups.OPERATION = {};
  users.groups.PHOTOGRAPHY = {};
  users.groups.VIDEO = {};
  users.groups.R0 = {};
  users.groups.R1 = {};
  users.groups.R2 = {};
  users.groups.R3 = {};
  users.groups.R4 = {};
  users.groups.R5 = {};
}
