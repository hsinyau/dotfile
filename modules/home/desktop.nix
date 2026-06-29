# GNOME 桌面设置、Alacritty 终端、DPI
{ config, pkgs, ... }:

{
  # 设置鼠标指针大小以及字体 DPI（适用于 4K 显示器）
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Alacritty 终端（GPU 加速）
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  # GNOME 桌面字体与窗口设置
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      font-name = "Sarasa UI SC 10";
      document-font-name = "Sarasa UI SC 11";
      monospace-font-name = "Sarasa Mono SC 10";
    };
    "org/gnome/desktop/wm/preferences" = {
      titlebar-font = "Sarasa UI SC Bold 10";
      button-layout = ":minimize,maximize,close";
      action-double-click-titlebar = "toggle-maximize";
      action-middle-click-titlebar = "minimize";
    };
  };
}
