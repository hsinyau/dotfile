{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # 引导加载器
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "OvO";
  networking.networkmanager.enable = true;

  # 时区
  time.timeZone = "Asia/Shanghai";

  # 国际化 / 本地化设置
  i18n.defaultLocale = "zh_CN.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  # 输入法：fcitx5 + rime
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-fluent
      (fcitx5-rime.override {
        rimeDataPkgs = [
          pkgs.rime-ice
        ];
      })
    ];
  };

  # 启用 X11（NVIDIA 驱动）
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  # 桌面环境：GNOME + GDM
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  # X11 键盘布局
  services.xserver.xkb = {
    layout = "cn";
    variant = "";
  };

  # 打印服务
  services.printing.enable = true;

  # 音频：PipeWire（替代 PulseAudio）
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # 显卡驱动：NVIDIA 专有驱动
  hardware.opengl = {
    enable = true;
  };

  hardware.nvidia = {
    # 内核态模式设置（KMS），Wayland 必需
    modesetting.enable = true;

    # 电源管理（笔记本省电）
    powerManagement.enable = true;

    # 使用闭源 NVIDIA 驱动（而非开源 nvk）
    open = false;

    # 安装 nvidia-settings 配置工具
    nvidiaSettings = true;

    # 使用稳定版驱动
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # 字体：安装更纱黑体并设为系统默认
  fonts.packages = with pkgs; [
    sarasa-gothic
  ];

  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "Sarasa UI SC" ];
    monospace = [ "Sarasa Mono SC" ];
    serif = [ "Sarasa UI SC" ];
  };

  # 用户账户
  users.users.hsinyau = {
    isNormalUser = true;
    description = "hsinyau";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };

  programs.zsh.enable = true;



  programs.firefox.enable = true;

  # 允许非自由软件
  nixpkgs.config.allowUnfree = true;

  # 系统级安装包
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    bun
  ];

  # 系统状态版本（首次安装时的版本，不要随意更改）
  system.stateVersion = "25.11";

  # 系统概览汉化
  services.gnome.core-utilities.enable = true;

  # 启用 Flakes 与新式 nix 命令行工具
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
