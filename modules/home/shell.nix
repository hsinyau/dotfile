# Shell 配置：Zsh + Starship + Bash（备用）
{ config, pkgs, ... }:

{
  # Starship 提示符
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
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
    '';

    shellAliases = {
      d = "bun run dev";
    };
  };

  # 保留 Bash 作为备用 shell
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="/home/hsinyau/.bun/bin:$PATH"
    '';
    shellAliases = {
      d = "bun run dev";
    };
  };
}
