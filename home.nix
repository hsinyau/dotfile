{ config, pkgs, ... }:

{
  # 注意修改这里的用户名与用户目录
  home.username = "hsinyau";
  home.homeDirectory = "/home/hsinyau";

  # 将当前配置目录中的文件导入 Nix store，并在 Home 目录下生成指向该 store 文件的符号链接
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # 设置鼠标指针大小以及字体 DPI（适用于 4K 显示器）
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # 通过 home.packages 安装用户级软件包（仅当前用户可用）
  home.packages = with pkgs;[
    neofetch
    nnn # 终端文件管理器

    # 压缩 / 归档工具
    zip
    xz
    unzip
    p7zip

    # 实用工具
    ripgrep # 递归搜索文件内容
    jq      # JSON 命令行处理器
    yq-go   # YAML 处理器
    eza     # ls 的现代替代品
    fzf     # 命令行模糊搜索

    # 网络工具
    mtr     # 网络诊断
    iperf3
    dnsutils  # dig + nslookup
    ldns      # drill（dig 的替代品）
    aria2     # 多协议命令行下载工具
    socat     # netcat 的替代品
    nmap      # 网络扫描
    ipcalc    # IPv4/v6 地址计算器

    # 杂项
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # Nix 相关
    nix-output-monitor  # nom 命令，提供更详细的 nix 构建日志

    # 效率工具
    hugo  # 静态站点生成器
    glow  # 终端 Markdown 预览

    btop  # 系统监控（htop/nmon 的替代品）
    iotop # I/O 监控
    iftop # 网络流量监控

    # 系统调用监控
    strace
    ltrace
    lsof

    # 系统工具
    sysstat
    lm_sensors  # sensors 命令
    ethtool
    pciutils    # lspci
    usbutils    # lsusb

    google-chrome
    zed-editor
    sparkle
  ];

  # Git 配置
  programs.git = {
    enable = true;
    settings.user = {
      name = "hsinyau";
      email = "hsinyau@qq.com";
    };
  };

  # Starship 提示符
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
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

  # Bash 配置
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="/home/hsinyau/.bun/bin:$PATH"
    '';

    # 别名
    shellAliases = {
      d = "bun run dev";
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

  # Home Manager 状态版本（首次配置时的版本，不要随意更改）
  home.stateVersion = "25.11";
}
