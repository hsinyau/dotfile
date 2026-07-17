{
  description = "Hsinyau's NixOS flake";

  inputs = {
    # 使用 GitHub 官方源，通过 binary cache（TUNA 镜像）加速下载构建产物
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      # 保持 home-manager 与当前 flake 使用相同版本的 nixpkgs，避免依赖冲突
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      OvO = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix

          # 将 home-manager 作为 NixOS 模块导入，使其在 nixos-rebuild 时自动部署
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # 配置用户 hsinyau 的 home-manager
            home-manager.users.hsinyau = import ./home.nix;

            # 如需在 home.nix 中使用 flake 的全部 inputs，取消下一行注释
            # home-manager.extraSpecialArgs = inputs;
          }
        ];
      };
    };
  };
}
