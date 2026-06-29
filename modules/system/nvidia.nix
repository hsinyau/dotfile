# NVIDIA 专有显卡驱动
{ config, pkgs, ... }:

{
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
}
