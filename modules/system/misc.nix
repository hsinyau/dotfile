# 杂项：系统包、Firefox、Flakes 等
{ config, pkgs, ... }:

{
  # ── Nix 国内镜像源 ──────────────────────────────
  # 使用中科大的 Nix 二进制缓存镜像，大幅加速下载
  nix.settings = {
    # 启用 Flakes 与新式 nix 命令行工具
    experimental-features = [ "nix-command" "flakes" ];

    # 主 binary cache（使用清华 TUNA 镜像，官方的作为回退）
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];

    # 对镜像源给予更高的信任权重
    trusted-substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];

    # 公共 substituters 的公钥
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };

  # 系统级安装包
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    bun
  ];

  # nix-ld：为非 Nix 动态链接的可执行文件提供运行环境
  programs.nix-ld.enable = true;

  # Firefox
  programs.firefox.enable = true;

  # 允许非自由软件
  nixpkgs.config.allowUnfree = true;

  # 自动清理：保留最近 10 个 generations，超过 30 天的自动删除
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # 自动优化 Nix store（定期硬链接重复文件以节省磁盘空间）
  nix.optimise.automatic = true;

  # 系统状态版本（首次安装时的版本，不要随意更改）
  system.stateVersion = "25.11";
}
