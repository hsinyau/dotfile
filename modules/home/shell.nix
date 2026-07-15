# Shell 配置：Zsh + Starship + Bash（备用）
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

      aws = { symbol = " "; };
      azure = { symbol = " "; };

      battery = {
        full_symbol = "󰁹 ";
        charging_symbol = "󰂄 ";
        discharging_symbol = "󰂃 ";
        unknown_symbol = "󰂑 ";
        empty_symbol = "󰂎 ";
      };

      buf = { symbol = " "; };
      bun = { symbol = " "; };
      c = { symbol = " "; };
      cpp = { symbol = " "; };
      cmake = { symbol = " "; };
      cobol = { symbol = " "; };
      conda = { symbol = " "; };
      container = { symbol = " "; };
      crystal = { symbol = " "; };
      dart = { symbol = " "; };
      deno = { symbol = " "; };
      direnv = { symbol = " "; };

      directory = { read_only = " 󰌾"; };

      docker_context = { symbol = " "; };
      dotnet = { symbol = " "; };
      elixir = { symbol = " "; };
      elm = { symbol = " "; };
      erlang = { symbol = " "; };
      fennel = { symbol = " "; };
      fortran = { symbol = " "; };
      fossil_branch = { symbol = " "; };
      gcloud = { symbol = "󱇶 "; };
      gleam = { symbol = " "; };
      git_branch = { symbol = " "; };

      git_commit = { tag_symbol = "  "; };

      golang = { symbol = " "; };
      gradle = { symbol = " "; };
      guix_shell = { symbol = " "; };
      haskell = { symbol = " "; };
      haxe = { symbol = " "; };
      helm = { symbol = " "; };
      hg_branch = { symbol = " "; };

      hostname = { ssh_symbol = " "; };

      java = { symbol = " "; };
      julia = { symbol = " "; };
      kotlin = { symbol = " "; };
      kubernetes = { symbol = "󱃾 "; };
      lua = { symbol = " "; };
      maven = { symbol = " "; };
      memory_usage = { symbol = "󰍛 "; };
      meson = { symbol = "󰔷 "; };
      mojo = { symbol = "󰈸 "; };
      nats = { symbol = " "; };
      netns = { symbol = "󰛳 "; };
      nim = { symbol = " "; };
      nix_shell = { symbol = " "; };
      nodejs = { symbol = " "; };
      ocaml = { symbol = " "; };
      odin = { symbol = "󰟢 "; };
      opa = { symbol = " "; };
      openstack = { symbol = " "; };

      os = {
        symbols = {
          AIX = " ";
          AlmaLinux = " ";
          Alpaquita = " ";
          Alpine = " ";
          ALTLinux = " ";
          Amazon = " ";
          Android = " ";
          AOSC = " ";
          Arch = " ";
          Artix = " ";
          Bluefin = " ";
          CachyOS = " ";
          CentOS = " ";
          Debian = " ";
          DragonFly = " ";
          Elementary = " ";
          Emscripten = " ";
          EndeavourOS = " ";
          Fedora = " ";
          FreeBSD = " ";
          Garuda = " ";
          Gentoo = " ";
          HardenedBSD = "󰞌 ";
          Illumos = " ";
          InstantOS = " ";
          Ios = "󰀷 ";
          Kali = " ";
          Linux = " ";
          Mabox = " ";
          Macos = " ";
          Manjaro = " ";
          Mariner = " ";
          MidnightBSD = " ";
          Mint = " ";
          NetBSD = " ";
          NixOS = " ";
          Nobara = " ";
          OpenBSD = " ";
          OpenCloudOS = " ";
          openEuler = " ";
          openSUSE = " ";
          OracleLinux = "󰺡 ";
          PikaOS = " ";
          Pop = " ";
          Raspbian = " ";
          Redhat = "󱄛 ";
          RedHatEnterprise = "󱄛 ";
          Redox = "󰀘 ";
          RockyLinux = " ";
          Solus = " ";
          SUSE = " ";
          Ubuntu = " ";
          Ultramarine = " ";
          Unknown = " ";
          Uos = " ";
          Void = " ";
          Windows = "󰍲 ";
          Zorin = " ";
        };
      };

      package = { symbol = "󰏗 "; };
      perl = { symbol = " "; };
      php = { symbol = " "; };
      pijul_channel = { symbol = " "; };
      pixi = { symbol = "󰏗 "; };
      pulumi = { symbol = " "; };
      purescript = { symbol = " "; };
      python = { symbol = " "; };
      raku = { symbol = "󱖊 "; };
      red = { symbol = "󱍼 "; };
      rlang = { symbol = "󰟔 "; };
      ruby = { symbol = " "; };
      rust = { symbol = "󱘗 "; };
      scala = { symbol = " "; };
      shlvl = { symbol = "󰹍 "; };
      singularity = { symbol = " "; };
      solidity = { symbol = " "; };
      spack = { symbol = " "; };
      status = { symbol = " "; };
      sudo = { symbol = " "; };
      swift = { symbol = " "; };
      terraform = { symbol = " "; };
      vlang = { symbol = " "; };
      typst = { symbol = " "; };
      vagrant = { symbol = " "; };
      xmake = { symbol = " "; };
      zig = { symbol = " "; };
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
      export PATH="/home/hsinyau/.bun/bin:$PATH"

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
      export PATH="/home/hsinyau/.bun/bin:$PATH"

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
