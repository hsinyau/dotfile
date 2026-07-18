# SSH 配置（密钥管理 + GitHub 等主机别名）
#
# 前置步骤（一次性）：
#   1. 运行 `nixos-rebuild switch` 加载本配置
#   2. 运行以下命令生成 SSH key（如果还没有）：
#        ssh-keygen -t ed25519 -C "hsinyau@qq.com"
#   3. 添加私钥到 ssh-agent：
#        ssh-add ~/.ssh/id_ed25519
#   4. 将公钥添加到 GitHub / GitLab：
#        cat ~/.ssh/id_ed25519.pub
#     → 访问 https://github.com/settings/keys 添加
#
{ config, pkgs, ... }:

{
  home.file.".ssh/config".text = ''
    # ── GitHub ─────────────────────────────────────
    Host github.com
      HostName github.com
      User git
      IdentityFile ~/.ssh/id_ed25519
      IdentitiesOnly yes

    # ── GitLab（备用）─────────────────────────────
    Host gitlab.com
      HostName gitlab.com
      User git
      IdentityFile ~/.ssh/id_ed25519
      IdentitiesOnly yes

    # ── 通用默认配置 ──────────────────────────────
    Host *
      AddKeysToAgent yes
      ServerAliveInterval 60
      ServerAliveCountMax 3
  '';

  # 自动启动 ssh-agent
  services.ssh-agent.enable = true;
}
