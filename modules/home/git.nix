# Git 配置
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings.user = {
      name = "hsinyau";
      email = "hsinyau@qq.com";
    };
  };
}
