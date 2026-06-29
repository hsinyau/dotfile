# 此文件由 nixos-generate-config 自动生成，请勿手动修改！
# 如需更改配置，请修改 /etc/nixos/configuration.nix
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  # 内核模块
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  # 根分区
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/5d44ac6c-4fbb-46fb-95c5-8c0feee2cdc8";
      fsType = "ext4";
    };

  # /boot 分区（EFI）
  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/CF19-335D";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  # 交换分区
  swapDevices =
    [ { device = "/dev/disk/by-uuid/f6a845b6-7d7d-4e39-a813-0b5d89e3396d"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
