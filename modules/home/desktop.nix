# GNOME 桌面设置、Ghostty 终端、DPI
{ config, pkgs, ... }:

{
  # 设置鼠标指针大小以及字体 DPI（适用于 4K 显示器）
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 144;
  };

  # Ghostty 终端配置
  home.file.".config/ghostty/config".text = ''
    # ====================== 字体 ======================
    font-family = FiraCode Nerd Font
    font-size = 12
    font-thicken = true

    # ====================== 主题 ======================
    theme = dark:Catppuccin Mocha,light:Catppuccin Latte

    # ====================== 窗口 ======================
    window-padding-x = 8
    window-padding-y = 8
    background-opacity = 0.95
    background-blur = 20

    # ====================== 光标 ======================
    cursor-style = block
    cursor-style-blink = false

    # ====================== 行为 ======================
    copy-on-select = true
    mouse-hide-while-typing = true
    window-inherit-working-directory = true
    scrollback-limit = 100000

    # ====================== 快捷键 ======================
    keybind = ctrl+shift+c=copy_to_clipboard
    keybind = ctrl+shift+v=paste_from_clipboard
    keybind = ctrl+shift+d=new_split:right
    keybind = ctrl+shift+s=new_split:down
    keybind = ctrl+shift+t=new_tab
    keybind = ctrl+shift+w=close_surface
    keybind = ctrl+shift+,=reload_config
  '';

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
    # 将默认终端模拟器设为 Ghostty
    "org/gnome/desktop/applications/terminal" = {
      exec = "ghostty";
      exec-arg = "";
    };
  };
}
