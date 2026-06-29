# 用户级 CLI 工具包
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
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
}
