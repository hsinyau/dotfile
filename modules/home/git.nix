# Git 配置
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      # 用户信息
      user = {
        name = "hsinyau";
        email = "hsinyau@qq.com";
      };

      # 常用别名
      alias = {
        st = "status -s";
        co = "checkout";
        br = "branch";
        ci = "commit";
        cia = "commit --amend";
        lg = "log --oneline --graph --all --decorate";
        unstage = "reset HEAD --";
        last = "log -1 HEAD";
        discard = "restore";
        cleanup = "remote prune origin";
      };

      # 默认行为
      init.defaultBranch = "main";
      push.default = "simple";
      pull.rebase = true;
      fetch.prune = true;

      # 使用 SSH 而非 HTTPS
      url."git@github.com:".insteadOf = "https://github.com/";

      # 全局 gitignore
      core.excludesFile = "${config.home.homeDirectory}/.gitignore_global";
    };
  };

  # 全局 gitignore
  home.file.".gitignore_global".text = ''
    # 编辑器 / IDE
    .vscode/
    .idea/
    *.swp
    *.swo
    *~

    # 系统文件
    .DS_Store
    Thumbs.db

    # 构建产物
    node_modules/
    target/
    dist/
    build/
    .next/

    # 环境 / 密钥
    .env
    .env.local
    *.key
    *.pem
  '';
}
