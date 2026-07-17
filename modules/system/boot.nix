# 引导加载器
{ ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # systemd-boot 菜单只保留最近 10 个 generations（避免 /boot 分区膨胀）
  boot.loader.systemd-boot.configurationLimit = 10;
}
