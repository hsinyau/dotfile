# 杂项：系统包、Firefox、Flakes 等
{ config, pkgs, ... }:

{
  # 系统级安装包
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    bun
  ];

  # Firefox
  programs.firefox.enable = true;

  # 允许非自由软件
  nixpkgs.config.allowUnfree = true;

  # 启用 Flakes 与新式 nix 命令行工具
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # 系统状态版本（首次安装时的版本，不要随意更改）
  system.stateVersion = "25.11";
}
