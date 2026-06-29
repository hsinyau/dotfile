# 用户账户
{ config, pkgs, ... }:

{
  users.users.hsinyau = {
    isNormalUser = true;
    description = "hsinyau";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

  # 系统级启用 zsh（确保 PATH 正确）
  programs.zsh.enable = true;
}
