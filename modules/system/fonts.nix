# 字体：安装更纱黑体并设为系统默认
{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    sarasa-gothic
  ];

  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "Sarasa UI SC" ];
    monospace = [ "Sarasa Mono SC" ];
    serif = [ "Sarasa UI SC" ];
  };
}
