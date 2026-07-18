# NVIDIA 专有显卡驱动
#
# 显卡：GeForce GTX 1650 Mobile / Max-Q（无核显，纯独显笔记本）
#
# 注意：配置修改后需要 nixos-rebuild switch 并重启才能生效。
# 重启后可用以下命令验证驱动是否加载成功：
#   nvidia-smi                   # 应显示 GPU 信息和驱动版本
#   lsmod | grep nvidia          # 应看到 nvidia、nvidia_drm、nvidia_modeset 等模块
#   glxinfo | grep "OpenGL"      # 应显示 NVIDIA Corporation
{ config, pkgs, lib, ... }:

{
  # ── 屏蔽开源 nouveau 驱动 ──────────────────────────
  # 避免系统启动时 nouveau 抢先绑定 NVIDIA 硬件，导致 nvidia 模块无法加载。
  boot.blacklistedKernelModules = [ "nouveau" "nvidiafb" ];

  # ── 显卡加速支持 ──────────────────────────────────
  hardware.graphics = {
    enable = true;
    enable32Bit = true;   # 32 位应用（如 Steam/游戏）的 OpenGL/Vulkan 支持
  };

  # ── 将 NVIDIA 加入 X11 视频驱动列表 ──────────────
  # ★ 这是最关键的一步！NVIDIA 模块检查的是
  #   lib.elem "nvidia" config.services.xserver.videoDrivers
  #   只有 "nvidia" 在列表中，NVIDIA 驱动（内核模块 + nvidia-smi 等）才会被真正加载。
  services.xserver.videoDrivers = [ "nvidia" ];

  # ── NVIDIA 专有驱动配置 ──────────────────────────
  hardware.nvidia = {
    # 内核态模式设置（KMS）
    # 在 initrd 阶段即加载 nvidia_drm，避免启动过程中闪屏，且是 Wayland 必需。
    modesetting.enable = true;

    # 电源管理（笔记本省电）
    # 允许驱动在 GPU 空闲时自动将其置于低功耗状态。
    powerManagement.enable = true;

    # 使用闭源 NVIDIA 驱动（非开源的 nvk 或 nouveau）
    open = false;

    # 安装 nvidia-settings 图形化配置工具
    nvidiaSettings = true;

    # 驱动包：使用当前内核版本对应的稳定版 NVIDIA 驱动
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # ── 内核参数（可选但推荐）─────────────────────────
  # nvidia_drm.fbdev=1：启用 NVIDIA 的 framebuffer 模拟，提升控制台/TTY 体验
  boot.kernelParams = [
    "nvidia_drm.fbdev=1"
  ];

  # ── 环境变量：优化 Chrome 等应用的 GPU 渲染 ──────
  environment.sessionVariables = {
    # 告诉 Chrome/Electron 应用使用 Wayland 后端
    NIXOS_OZONE_WL = "1";
    # 对部分 Electron 应用（如 VSCode、Zed）有用
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # 确保 X11 应用不误用软件渲染
    LIBGL_ALWAYS_SOFTWARE = "0";
  };
}
