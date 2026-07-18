# 桌面环境：GNOME + GDM
{ ... }:

{
  # 启用 X11（NVIDIA 驱动需要 X11 后端）
  services.xserver.enable = true;

  # 桌面环境
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;

  # X11 键盘布局
  services.xserver.xkb = {
    layout = "cn";
    variant = "";
  };

  # 打印服务
  services.printing.enable = true;

  # 系统概览汉化
  services.gnome.core-utilities.enable = true;

  # flatpak
  services.flatpak.enable = true;
}
