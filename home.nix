# 用户级配置入口——各模块按功能拆分在 modules/home/ 下
{ config, pkgs, ... }:

{
  imports = [
    ./modules/home/shell.nix
    ./modules/home/packages.nix
    ./modules/home/git.nix
    ./modules/home/desktop.nix
    ./modules/home/ssh.nix
  ];

  home.username = "hsinyau";
  home.homeDirectory = "/home/hsinyau";
  home.stateVersion = "25.11";
}
