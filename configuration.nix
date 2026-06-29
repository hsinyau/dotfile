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

  # 启用 X11
  services.xserver.enable = true;

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

  # 用户账户
  users.users.hsinyau = {
    isNormalUser = true;
    description = "hsinyau";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  programs.firefox.enable = true;

  # 允许非自由软件
  nixpkgs.config.allowUnfree = true;

  # 系统级安装包
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    google-chrome
    bun
  ];

  # 系统状态版本（首次安装时的版本，不要随意更改）
  system.stateVersion = "25.11";

  # 启用 Flakes 与新式 nix 命令行工具
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
