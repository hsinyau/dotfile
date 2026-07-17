# Shell 配置：Zsh + Starship + Bash（备用）
#
# Starship 默认图标（Nerd Fonts）已内置，此处只覆盖需要自定义的项。
# 如需查看所有可用图标，请参考 https://starship.rs/config/
#
{ config, pkgs, ... }:

{
  # Starship 提示符
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };

      battery = {
        full_symbol = "󰁹 ";
        charging_symbol = "󰂄 ";
        discharging_symbol = "󰂃 ";
        unknown_symbol = "󰂑 ";
        empty_symbol = "󰂎 ";
      };

      directory = { read_only = " 󰌾"; };

      git_commit = { tag_symbol = "  "; };

      os = {
        symbols = {
          NixOS = " ";
          Unknown = " ";
        };
      };

      status = { symbol = " "; };
    };
  };

  # Zsh 配置（主 shell）
  programs.zsh = {
    enable = true;

    # 自动建议（输入时灰色历史提示，→ 接受）
    autosuggestion.enable = true;

    # 语法高亮
    syntaxHighlighting.enable = true;

    # 补全系统
    enableCompletion = true;

    # 环境变量与别名
    initContent = ''
      export PATH="${config.home.homeDirectory}/.bun/bin:$PATH"

      # Go
      export GOPATH="$HOME/go"
      export GOBIN="$GOPATH/bin"
      export PATH="$GOBIN:$PATH"

      # Rust（rustup 会自动管理 ~/.cargo/bin）
      # 如果你使用 rustup 默认安装，以下通常已是自动的
      # export PATH="$HOME/.cargo/bin:$PATH"
    '';

    shellAliases = {
      d = "bun run dev";
      i = "cd ~/Workspace";
    };
  };

  # 保留 Bash 作为备用 shell
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="${config.home.homeDirectory}/.bun/bin:$PATH"

      # Go
      export GOPATH="$HOME/go"
      export GOBIN="$GOPATH/bin"
      export PATH="$GOBIN:$PATH"
    '';
    shellAliases = {
      d = "bun run dev";
      i = "cd ~/Workspace";
    };
  };
}
