# 系统配置入口——各模块按功能拆分在 modules/system/ 下
{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/boot.nix
    ./modules/system/networking.nix
    ./modules/system/locale.nix
    ./modules/system/desktop.nix
    ./modules/system/audio.nix
    ./modules/system/nvidia.nix
    ./modules/system/fonts.nix
    ./modules/system/user.nix
    ./modules/system/misc.nix
  ];
}
